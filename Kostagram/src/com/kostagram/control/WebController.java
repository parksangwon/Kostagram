package com.kostagram.control;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kostagram.mail.Mail;
import com.kostagram.mail.MailService;
import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.FollowVO;
import com.kostagram.service.beans.ReportVO;
import com.kostagram.service.beans.SearchVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.FollowDAO;
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
	private Mail mail;
    @Autowired
    private ReportDAO reportDao;

	@RequestMapping("/")
	public String goToMainPage(HttpSession session, Model model) {
		// �α��� ���� Ȯ�� �� �α����� �ȵǾ� ������ �α��� ������
		if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
				|| session.getAttribute("email") == null) {

			return "web/index";
		}

		// test code
		System.out.println("-- WebController call / --");
		System.out.println("session(email) : " + session.getAttribute("email"));
		//

		String email = (String) session.getAttribute("email");
		List<ArticleVO> timeline = photoInfoDao.getTimeline(new UserInfoVO(email));
		UserInfoVO user = userInfoDao.findEmail(new UserInfoVO((String) session.getAttribute("email")));

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

		// userInfoDao�� ������ �ִ��� Ȯ��
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
		System.out.println("login ��");
	}

	@RequestMapping("/pwupdate")
	public String pwChange(UserInfoVO userInfoVO, HttpSession session, Model model) throws IOException {
		// session���� email�� �޾� DB ���ٿ�
		String email = (String) session.getAttribute("email");
		userInfoVO.setEmail(email);
		// findNickname �޼ҵ� ����
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
				
				out.print("empty1"); // ���� ��й�ȣ ������
				
			} else if (!oldPw.equals(userInfoVO.getPass())) {
				
				out.print("fail"); // ���� ��й�ȣ �ٸ���
				
			} else if (newPw1.equals("") || newPw2.equals("")) {
				
				out.print("empty2"); // ���ο� ��й�ȣ ������
				
			} else if (newPw1.length() < 4 || newPw1.length() >20 ) {
				
				out.print("empty3"); //  4�ڿ��� 20�ڱ���
				
			}else if (!newPw1.equals(newPw2)) {
				
				out.print("updatefail"); // ���ο� ��� ��ȣ �ٸ���
				// ����й�ȣ ��ġX
				
			} else if (oldPw.equals(userInfoVO.getPass())) {
				
				userInfoVO.setPass(newPw1);
				boolean result = userInfoDao.pwUpdate(userInfoVO);
				
				if (result) {
					out.print("updateSuccess"); // ���������� �ɶ�
				} 
			} else {
				
				out.print("updatefail");
				
			}
		}

	}

	@RequestMapping("/profileupdate")
	public String profileupdate(UserInfoVO userInfoVO, HttpSession session, Model model) throws IOException {
		// session���� nickname�� �޾� DB ���ٿ�
		String nickname = (String) session.getAttribute("nickname");
		userInfoVO.setNickname(nickname);
		// findNickname �޼ҵ� ����
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

	@RequestMapping(value = "/{nickname}")
	public String userPage(@PathVariable String nickname, HttpSession session, UserInfoVO userInfoVO, Model model,
			FollowVO followVO) {
		userInfoVO.setNickname(nickname);

		String check = "N";
		String url = "redirect:/usernotfound";

		// ȸ��ã��
		userInfoVO = userInfoDao.findNickname(userInfoVO);
		// ȸ���� �ƴϰų� ������� �� ȸ���̸�
		if (userInfoVO == null || userInfoVO.getUseYn() == 'N') {
			return url;
		}

		int photoCnt = photoInfoDao.countMyPhoto(userInfoVO);
		int followerCnt = followDao.getMyFollower(userInfoVO);
		int followingCnt = followDao.getMyFollowing(userInfoVO);

		model.addAttribute("photoCnt", photoCnt);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followingCnt", followingCnt);

		model.addAttribute("userInfoVO", userInfoVO);

		if (session != null && session.getAttribute("loginYn") != null
				&& ((String) session.getAttribute("loginYn")).equals("Y")) {
			// �ڱ��ڽ�
			if (((String) session.getAttribute("nickname")).equals(nickname)) {
				check = "Y";
				model.addAttribute("check", check);
			}
			// �α����� �ߴµ� �ڱ��ڽ��� �ƴϰ�
			else {
				followVO.setFrom_email((String) session.getAttribute("email"));
				followVO.setTo_email(userInfoVO.getEmail());
				followVO = followDao.check(followVO);
				if (followVO == null) {
					check = "FN";
				}

				model.addAttribute("check", check);
			}
			// �α����� ���Ѱ�
		}
		// �α����� ���Ѱ�
		else {

		}
		return "web/userpage";
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
				out.print("�ȷ����߿� �����Ͽ����ϴ�.");
			}
		} else if (followState.equals("F")) {
			System.out.println("followStata�� F...");
			if (followDao.delete(followVO.getTo_email())) {
				out.print("follow");
			} else {
				out.print("�ȷο��߿� �����Ͽ����ϴ�.");
			}
		}
	}

	@RequestMapping(value = "/usernotfound")
	public String userNotfound() {
		return "web/usernotfound";
	}

	@RequestMapping("/logout") // �α׾ƿ�
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
			mail.setContent("��й�ȣ�� " + findedUser.getPass() + " �Դϴ�.");
			mail.setReceiver(findedUser.getEmail());
			mail.setSubject(findedUser.getNickname() + "�� ��й�ȣ ã�� �����Դϴ�.");
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

	 //�Ű� ������ ����
    @RequestMapping("/report")
    public String report(ReportVO report,HttpSession session, Model model) {
	
    //�Ű� ����Ʈ ��������
    List<HashMap> findList = reportDao.findList(report);
    model.addAttribute("findList", findList);
	return "common/report";
    }
    
    //�Ű� ����
    @RequestMapping("/report_delete")
    public String report_delete(ReportVO report,HttpSession session, Model model, HttpServletRequest request) {
    //System.out.println("�Ű����");
    	
    //�Ű� ����
    //System.out.println(report);
    boolean result = reportDao.delete(report);
    
	return "redirect:report";
    }
    
    
    //�Ű�� �Խù� ����
    @RequestMapping("/photo_delete")
    public String photo_delete(ReportVO report,HttpSession session, Model model, HttpServletRequest request) {
    System.out.println("�Խù� ����");
    	
    //�Ű� ����
   // System.out.println(report);
    boolean result = reportDao.delete2(report);
    
	return "redirect:report";
    }
}
