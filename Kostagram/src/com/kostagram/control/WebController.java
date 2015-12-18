package com.kostagram.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kostagram.mail.Mail;
import com.kostagram.mail.MailService;
import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.CommentVO;
import com.kostagram.service.beans.FollowVO;
import com.kostagram.service.beans.LikeVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.ReportVO;
import com.kostagram.service.beans.SearchVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.CommentDAO;
import com.kostagram.service.dao.FollowDAO;
import com.kostagram.service.dao.LikeDAO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.ReportDAO;
import com.kostagram.service.dao.SearchDAO;
import com.kostagram.service.dao.UserInfoDAO;

@Controller
public class WebController {

	@Autowired
	private UserInfoDAO userInfoDao;
	@Autowired
	private PhotoInfoDAO photoInfoDao;
	@Autowired
	private SearchDAO searchDao;
	@Autowired
	private FollowDAO followDao;
	@Autowired
	private MailService mailService;
	@Autowired
	private CommentDAO commentDao;
	@Autowired
	private LikeDAO likeDao;
	@Autowired
	private Mail mail;
    @Autowired
    private ReportDAO reportDao;

	@RequestMapping("/")
	public String goToMainPage(HttpSession session, Model model) {
		// 로그인 세션 확인 후 로그인이 안되어 있으면 로그인 페이지
		ArticleVO article = null;
		if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
				|| session.getAttribute("email") == null) {

			return "web/index";
		}

		// test code
		System.out.println("-- WebController call / --");
		System.out.println("session(email) : " + session.getAttribute("email"));
		//
		
		String email = (String) session.getAttribute("email");
		ArrayList<ArticleVO> timeline = photoInfoDao.getTimeline(new UserInfoVO(email));
		UserInfoVO user = userInfoDao.findEmail(new UserInfoVO((String) session.getAttribute("email")));
		
		/*if ( pid != null ) {
    		article = photoInfoDao.getArticleByPhotoId(pid);
    	}
		
		List<HashMap> likeList = article.getLikeList();
		String likeYn = "heart";
		if (likeList.size() != 0) {
			for ( int j = 0; j < likeList.size(); j++ ) {
				HashMap like2 = likeList.get(j);
				if (email.equals((String)like2.get("EMAIL"))) {
					likeYn = "heart2";
				}
			}
		}
		model.addAttribute("likeYn", likeYn);*/
		
		
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("timeline", timeline);
		

		return "web/timeline";
	}

	@RequestMapping("/login")
	public void login(UserInfoVO user, HttpSession session, HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		if (user == null || user.getNickname() == null || user.getPass() == null) {
			out.print("loginFail");
		}

		// test code
		System.out.println("-- WebController call /login --");
		System.out.println("user : " + user);
		//

		// userInfoDao로 정보가 있는지 확인
		UserInfoVO findedUser = userInfoDao.findNickname(user);

		// test code
		System.out.println("-- /login find user by nickname --");
		System.out.println("findedUser : " + findedUser);
		//

		if (findedUser != null && findedUser.getPass().equals(user.getPass())) {
			session.setAttribute("loginYn", "Y");
			session.setAttribute("adminYn", findedUser.getAdminYn());
			session.setAttribute("email", findedUser.getEmail());
			session.setAttribute("nickname", findedUser.getNickname());
			out.print("loginSuccess");
		} else {
			out.print("loginFail");
		}
		System.out.println("login 끝");
	}

	@RequestMapping("/pwupdate")
	public String pwChange(UserInfoVO userInfoVO, HttpSession session, Model model) throws IOException {
		// session에서 email을 받아 DB 갔다옴
		String email = (String) session.getAttribute("email");
		userInfoVO.setEmail(email);
		// findNickname 메소드 실행
		UserInfoVO userinfo = userInfoDao.findPass(userInfoVO);

		model.addAttribute("userinfo", userinfo);
		return "common/pwupdate";
	}

	@RequestMapping(value = "/ajaxpwupdate")
	public void pwChange(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)
			throws IOException {
		System.out.println(request.getMethod());
		if (request.getMethod().equals("POST")) {

			String email = (String) session.getAttribute("email");
			String oldPw = (String) request.getParameter("oldPw");
			String newPw1 = (String) request.getParameter("newPw1");
			String newPw2 = (String) request.getParameter("newPw2");

			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");

			UserInfoVO userInfoVO = userInfoDao.findPass(new UserInfoVO(email));
			if (oldPw.equals("")) {
				
				out.print("empty1"); // 기존 비밀번호 없을때
				
			} else if (!oldPw.equals(userInfoVO.getPass())) {
				
				out.print("fail"); // 기존 비밀번호 다를때
				
			} else if (newPw1.equals("") || newPw2.equals("")) {
				
				out.print("empty2"); // 새로운 비밀번호 없을때
				
			} else if (newPw1.length() < 4 || newPw1.length() >20 ) {
				
				out.print("empty3"); //  4자에서 20자까지
				
			}else if (!newPw1.equals(newPw2)) {
				
				out.print("updatefail"); // 새로운 비밀 번호 다를때
				// 새비밀번호 일치X
				
			} else if (oldPw.equals(userInfoVO.getPass())) {
				
				userInfoVO.setPass(newPw1);
				boolean result = userInfoDao.pwUpdate(userInfoVO);
				
				if (result) {
					out.print("updateSuccess"); // 성공적으로 될때
				} 
			} else {
				
				out.print("updatefail");
				
			}
		}

	}

	@RequestMapping("/profileupdate")
	public String profileupdate(UserInfoVO userInfoVO, HttpSession session, Model model) throws IOException {
		// session에서 nickname을 받아 DB 갔다옴
		String nickname = (String) session.getAttribute("nickname");
		userInfoVO.setNickname(nickname);
		// findNickname 메소드 실행
		UserInfoVO userinfo = userInfoDao.findNickname(userInfoVO);

		model.addAttribute("userinfo", userinfo);
		return "common/profileupdate";
	}

	@RequestMapping("/ajaxprofileupdate")
	public void profileupdate(UserInfoVO userInfoVO, HttpSession session, HttpServletResponse response, Model model)
			throws IOException {
		String nickname = (String) session.getAttribute("nickname");

		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");

		UserInfoVO findUserVO = new UserInfoVO();
		findUserVO.setNickname(userInfoVO.getNickname());

		findUserVO = userInfoDao.findNickname(findUserVO);

		System.out.println("select :" + userInfoVO);
		if (userInfoVO.getNickname() == null || findUserVO.getNickname().equals(nickname)) {
			userInfoVO.setUpdatenickname(nickname);
			boolean result = userInfoDao.update(userInfoVO);
			if (result) {
				out.print("updateSuccess");

				session.removeAttribute("nickname");
				session.setAttribute("nickname", userInfoVO.getNickname());

			} else

			{
				out.print("updateFail");
			}
		} else {
			out.print("nicknameduplication");
		}

	}

	@RequestMapping("/searchWordAutoComplete/")
	public void searchWord(SearchVO searchVO, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(searchVO.getMessage());

		List<SearchVO> list = searchDao.select(searchVO);

		System.out.println(list.size());
		if (list.size() > 0) {
			response.setCharacterEncoding("utf-8");

			PrintWriter out = response.getWriter();
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			out.println("<WORDSLIST>");

			for (int i = 0; i < list.size(); i++) {
				searchVO = (SearchVO) list.get(i);
				String word = searchVO.getWord();
				String count = searchVO.getCount();
				out.println("<WORD>");
				out.println("<NAME>" + word + "</NAME>");
				out.println("<COUNT>" + count + "</COUNT>");
				out.println("</WORD>");
			}
			out.println("</WORDSLIST>");
			out.close();
		} else {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}
	}

	@RequestMapping(value = "/pwforget")
	public String pwforget() {
		return "web/pw_forget";
	}

	@RequestMapping(value = "/searchresult")
	public String searchresult() {
		return "web/search_result";
	}
	
	@RequestMapping(value = "/userpage")
	public void follow(FollowVO followVO, HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String nickname = (String) session.getAttribute("nickname");
		String followState = (String) request.getParameter("followState");

		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");

		if (followState.equals("UF")) {
			if (followDao.insert(followVO)) {
				out.print("following");
			} else {
				out.print("팔로잉중에 실패하였습니다.");
			}
		} else if (followState.equals("F")) {
			System.out.println("followStata는 F...");
			if (followDao.delete(followVO.getTo_email())) {
				out.print("follow");
			} else {
				out.print("팔로우중에 실패하였습니다.");
			}
		}
	}

	@RequestMapping(value = "/usernotfound")
	public String userNotfound() {
		return "web/usernotfound";
	}

	@RequestMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {

		session.removeAttribute("email");
		session.removeAttribute("nickname");
		session.removeAttribute("adminYn");
		session.setAttribute("loginYn", "N");

		return "redirect:/";
	}

	@RequestMapping("/sendpw.do")
	public void sendEmailAction(HttpServletResponse res, @RequestParam String token) throws Exception {
		System.out.println(">" + token);

		UserInfoVO findedUser = userInfoDao.findUser(token);

		System.out.println(findedUser);

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		if (findedUser != null) {
			mail.setContent("비밀번호는 " + findedUser.getPass() + " 입니다.   "
					+ " 비밀번호 확인후 비밀번호를 꼭! 변경해주세요 ");
			mail.setReceiver(findedUser.getEmail());
			mail.setSubject(findedUser.getNickname() + "님 비밀번호 찾기 메일입니다.");
			boolean result = mailService.SendEmail(mail);
			if (result) {
				out.print("send");
			} else {
				out.print("error");
			}
		} else {
			out.print("fail");
		}
	}

	 //신고 페이지 가기
    @RequestMapping("/report")
    public String report(ReportVO report,HttpSession session, Model model) {
	
    //신고 리스트 가져오기
    List<HashMap> findList = reportDao.findList(report);
    model.addAttribute("findList", findList);
	return "common/report";
    }
    
    //신고 삭제
    @RequestMapping("/report_delete")
    public String report_delete(ReportVO report,HttpSession session, Model model, HttpServletRequest request) {
    //System.out.println("신고삭제");
    	
    //신고 삭제
    //System.out.println(report);
    boolean result = reportDao.delete(report);
    
	return "redirect:report";
    }
    
    
    //신고된 게시물 삭제
    @RequestMapping("/photo_delete")
    public String photo_delete(ReportVO report,HttpSession session, Model model, HttpServletRequest request) {
    System.out.println("게시물 삭제");
    	
    //신고 삭제
   // System.out.println(report);
    boolean result = reportDao.delete2(report);
    
	return "redirect:report";
    }
    
    @RequestMapping("/getArticleModal")
    public String getArticleModal(@RequestParam String pid, Model model, HttpSession session, LikeVO like) {
    	
    	String email = (String)session.getAttribute("email");
    	ArticleVO article = null;
    	
    	if ( pid != null ) {
    		article = photoInfoDao.getArticleByPhotoId(pid);
    	}
    	
    	List<HashMap> likeList = article.getLikeList();
		String likeYn = "heart";
		if (likeList.size() != 0) {
			for ( int j = 0; j < likeList.size(); j++ ) {
				HashMap like2 = likeList.get(j);
				if (email.equals((String)like2.get("EMAIL"))) {
					likeYn = "heart2";
				}
			}
		}
		
    	model.addAttribute("article", article);
    	model.addAttribute("likeYn", likeYn);
    	
    	return "web/modal";
    }
    
    @RequestMapping("/ajaxgetArticleModal")
    public String ajaxgetArticleModal(Model model, CommentVO commentVO, HttpSession session, HttpServletRequest request) {
    	ArticleVO article = null;
    	
    	String email = (String)session.getAttribute("email");
    	String content = (String)request.getParameter("content");
    	String seq_photo = (String)request.getParameter("seq_photo");
    	System.out.println("seq_photo = "+seq_photo+" content = "+content+" email = "+email);
    	
    	commentVO.setEmail(email);
    	commentVO.setSeq_photo(seq_photo);
    	commentVO.setContent(content);
    	
    	boolean result = commentDao.insert(commentVO);
    	
    	if ( seq_photo != null ) {
    		article = photoInfoDao.getArticleByPhotoId(seq_photo);
    	}
    	
    	model.addAttribute("article", article);
    	
    	return "web/modal2";
    }
    
    @RequestMapping("/ajaxtimelinecomment")
    public String ajaxtimelinecomment(Model model, CommentVO commentVO, HttpSession session, HttpServletRequest request) {
    	ArticleVO article = null;
    	
    	String email = (String)session.getAttribute("email");
    	String content = (String)request.getParameter("content");
    	String seq_photo = (String)request.getParameter("seq_photo");
    	System.out.println("seq_photo = "+seq_photo+" content = "+content+" email = "+email);
    	
    	commentVO.setEmail(email);
    	commentVO.setSeq_photo(seq_photo);
    	commentVO.setContent(content);
    	
    	System.out.println("commentVO = "+commentVO);
    	
    	boolean result = commentDao.insert(commentVO);
    	
    	if ( seq_photo != null ) {
    		article = photoInfoDao.getArticleByPhotoId(seq_photo);
    	}
    	
    	model.addAttribute("article", article);
    	
    	return "web/timelinecomment";
    }
    
    
    @RequestMapping("/likeit")
	public void like(HttpSession session,HttpServletResponse res,HttpServletRequest req) throws IOException {
		String email = (String) session.getAttribute("email");
		String state = (String) req.getParameter("state");
		String seq_photo = (String) req.getParameter("seq_photo");
		
		System.out.println("LIKE CONTROLLER : " + email + "/" + state + "/" + seq_photo);
		PrintWriter out = res.getWriter();
		
		LikeVO like = new LikeVO();
		
		like.setEmail(email);
		like.setSeq_photo(seq_photo);
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");
		
		if (state.equals("unlike")) {
			if (likeDao.insert(like)){
				out.print("like");
			} else {
				out.print("fail");
			}
		} else if (state.equals("like")) {
			if (likeDao.delete(like)) {
				out.print("unlike");
			} else {
				out.print("fail");
			}
		}
	}
    
    
    @RequestMapping(value = "/{nickname}")
	public String userPage(@PathVariable String nickname, HttpSession session, Model model) {
		UserInfoVO user = new UserInfoVO();
		user.setNickname(nickname);

		String check = "N";
		String url = "redirect:/usernotfound";

		// 회원찾기
		user = userInfoDao.findNickname(user);
		// 회원이 아니거나 사용중지 된 회원이면
		if (user == null || user.getUseYn() == 'N') {
			return url;
		}

		int photoCnt = photoInfoDao.countMyPhoto(user);	
		int followerCnt = followDao.getMyFollower(user);
		int followingCnt = followDao.getMyFollowing(user);

		model.addAttribute("profile", user.getProfile_img());
		model.addAttribute("message", user.getMessage());
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("email", user.getEmail());
		model.addAttribute("photoCnt", photoCnt);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);
		
		List<PhotoInfoVO> myPhotoList = photoInfoDao.getMyPhotoList(user);
		model.addAttribute("myPhotoList", myPhotoList);

		if (session != null && session.getAttribute("loginYn") != null && ((String) session.getAttribute("loginYn")).equals("Y")) {
			// 자기자신
			if (((String) session.getAttribute("nickname")).equals(nickname)) {
				check = "Y";
				model.addAttribute("check", check);
			}
			// 로그인은 했는데 자기자신이 아니고
			else {
				FollowVO followVO = new FollowVO();
				followVO.setFrom_email((String) session.getAttribute("email"));
				followVO.setTo_email(user.getEmail());
				followVO = followDao.check(followVO);
				if (followVO == null) {
					check = "FN";
				}

				model.addAttribute("check", check);
			}
		}
		// 로그인을 안한거
		else {

		}
		return "web/userpage";
	}

}
