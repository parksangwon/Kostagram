package com.kostagram.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.CommentVO;
import com.kostagram.service.beans.ConversationVO;
import com.kostagram.service.beans.FollowVO;
import com.kostagram.service.beans.HashtagVO;
import com.kostagram.service.beans.LikeVO;
import com.kostagram.service.beans.LocationVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.ReportVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.ActivityDAO;
import com.kostagram.service.dao.CommentDAO;
import com.kostagram.service.dao.ConversationDAO;
import com.kostagram.service.dao.FollowDAO;
import com.kostagram.service.dao.HashtagDAO;
import com.kostagram.service.dao.LikeDAO;
import com.kostagram.service.dao.LocationDAO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.ReportDAO;
import com.kostagram.service.dao.UserInfoDAO;
import com.kostagram.imgchange.ImgChage;

@Controller
@RequestMapping("/m")
public class MobileController {

	@Autowired
	private UserInfoDAO userInfoDao;

	@Autowired
	private PhotoInfoDAO photoInfoDao;

	@Autowired
	private ActivityDAO activityDao;

	@Autowired
	private ConversationDAO conversationDao;

	@Autowired
	private FollowDAO followDao;
	
	@Autowired
	private ReportDAO reportDao;
	
	@Autowired
	private HashtagDAO hashtagDao;
	
	@Autowired
	private CommentDAO commentDao;
	
	@Autowired
	private LikeDAO likeDao;
	
	@Autowired
	private LocationDAO locationDao;

	// Ÿ�� ���� (����)
	@RequestMapping("/")
	public String timeLine(HttpSession session, Model model) {

		if (session == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")
				|| session.getAttribute("email") == null) {
			return "mobile/login";
		}
		return "mobile/timeline";
	}

	@RequestMapping("/login")
	public void login(UserInfoVO user, HttpSession session,
			HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		if (user == null || user.getNickname() == null
				|| user.getPass() == null) {
			out.print("loginFail");
		}

		// userInfoDao�� ������ �ִ��� Ȯ��
		UserInfoVO findedUser = userInfoDao.findNickname(user);

		if (findedUser != null && findedUser.getPass().equals(user.getPass())) {
			session.setAttribute("loginYn", "Y");
			session.setAttribute("email", findedUser.getEmail());
			session.setAttribute("nickname", findedUser.getNickname());
			out.print("loginSuccess");
		} else {
			out.print("loginFail");
		}
	}
	
	@RequestMapping("/write")
	public String filePage()
	{
		return "mobile/fileform";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public void uploadFile(HttpSession session, HttpServletRequest req, MultipartHttpServletRequest request) {
        Iterator<String> itr =  request.getFileNames();
        
        String email = (String)session.getAttribute("email");
        
        PhotoInfoVO pivo = new PhotoInfoVO();
        
        pivo.setContent(request.getParameter("content"));
        pivo.setEmail((String)session.getAttribute("email"));
        pivo.setLocation_name("��������д��� �ڽ�Ÿ");

        if(photoInfoDao.insert(pivo))
        {
        	pivo = photoInfoDao.myseqPhoto(email);
        	String fileName = pivo.getSeq_photo();
        	String subfileName = fileName;
        	String path = req.getSession().getServletContext().getRealPath("/personalImg/"+email);
        	
        	if(itr.hasNext()) {
                MultipartFile mpf = request.getFile(itr.next());
                String originalFileName = mpf.getOriginalFilename();
                
                int i = originalFileName.indexOf(".");
                fileName += originalFileName.substring(i);
                
                try {
                	File file = new File(path+"/"+fileName);
                	mpf.transferTo(file);
                	
                	ImgChage imgchange = new ImgChage();
                	imgchange.change(path+"/"+fileName, path+"/"+subfileName);
                	
                } catch (IOException e) {
                    System.out.println(e.getMessage());
                    e.printStackTrace();
                }
            } else {
            }
        }
        
    }
	
	@RequestMapping("/gps")
	public String searchLocation()
	{
		return "mobile/location";
	}

	@RequestMapping("/timeline")
	public void getTimeline(HttpSession session, HttpServletResponse res) throws IOException {
		String email = (String) session.getAttribute("email");
		
		UserInfoVO user = new UserInfoVO(email);

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		out.print("<div id='photoList'>");
		ArrayList<ArticleVO> timeline = photoInfoDao
				.getTimeline(user);
		if ( timeline.size() != 0 ) {
			for (int i = 0; i < timeline.size(); i++) {
				ArticleVO article = timeline.get(i);
				PhotoInfoVO photo = article.getPhoto();
				String seq_photo = photo.getSeq_photo();
		
				out.print(
						"<div class='article' id='article"+seq_photo+"'><div class='photoHeader'><table width='100%'><tr><td width='60'>");
		
				HashMap userInfo = article.getUserInfo();
				String photoNickname = (String) userInfo.get("NICKNAME");
				String profile = (String) userInfo.get("PROFILE_IMG");
				String photoEmail = (String) userInfo.get("EMAIL");
				if (profile == null) {
					out.print(
							"<img src='personalImg/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// ������
				} else {
					out.print("<img src='personalImg/" + photoEmail
							+ "/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// ������
					// �̹���
				}
				out.print(
						"</td><td align='left'><a href='./m/"+photoNickname+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
				out.print(photoNickname);// �г���
				out.print(
						"</a></td><td align='right' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");

				long uploadTime = System.currentTimeMillis() - photo.getReg_date().getTime();
				if ( uploadTime/(1000*60*60*24*7) != 0 ) {
					out.print( uploadTime/(1000*60*60*24*7) +"�� ��" );
				} else if ( uploadTime/(1000*60*60*24) != 0 ) {
					out.print( uploadTime/(1000*60*60*24) + "�� ��" );
				} else if ( uploadTime/(1000*60*60) != 0 ) {
					out.print( uploadTime/(1000*60*60) + "�� ��" );
				} else if ( uploadTime/(1000*60) != 0 ) {
					out.print( uploadTime/(1000*60) + "�� ��");
				} else if ( uploadTime/(1000*30) != 0 ) {
					out.print( "���" );
				}
				
				out.print(
						"</td></tr></table></div><div class='photoArea' id='photoArea'><table width='100%' cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>");
				out.print("<img src='personalImg/" + photoEmail + "/" + seq_photo
						+ ".jpg' width='100%' />");// �ø� ����
				
				List<HashMap> likeList = article.getLikeList();
				String likeYn = "heart";
				if (likeList.size() != 0) {
					for ( int j = 0; j < likeList.size(); j++ ) {
						HashMap like = likeList.get(j);
						if (email.equals((String)like.get("EMAIL"))) {
							likeYn = "heart2";
						}
					}
				}
				out.print(
						"</td></tr></table></div><div class='CMTnLIK' id='CMTnLIK"+seq_photo+"'' style='padding: 0px 5px 0px 5px'><table><tr><td align='left'><a href'#'><img src='m/image/icon/"+likeYn+".png' id='heartBtn' width='25' value='"+seq_photo+"'/></a>");
				out.print(
						"</td><td align='left'><a href='./m/comment?pid="+seq_photo+"'><img src='m/image/icon/chat_bubble.png' width='25' /></a></td><td align='right'><a href='./m/report?pid="+seq_photo+"' >");
				out.print(
						"<img src='m/image/icon/warning.png' width='25' /></a></td></tr></table><hr/><table><tr>");
		
				
				if (likeList.size() < 6) {
					out.print(
							"<td><div id='" + seq_photo +"'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>�� ");
					if (likeList.size() == 0) {
						out.print("���ƿ�");
					}
					for (int j = 0; j < likeList.size(); j++) {
						HashMap like = likeList.get(j);
						String likeNickname = (String) like.get("NICKNAME");
						out.print(likeNickname);
						if ( j != likeList.size() - 1 ) {
							out.print(", ");
						}
					}
					out.print("</a></div></td>");
				} else {
					out.print(
							"<td><div id='" + seq_photo +"'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>�� ");
					out.print(likeList.size() + "��</a></div></td></tr>");
				}
				if (photo.getContent() != null) {
					out.print(
							"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
					out.print("�г���");
					out.print("</a>" + photo.getContent() + "</td></tr>");
				}
		
				List<HashMap> commentList = article.getCommentList();
				if (commentList != null && commentList.size() > 0) {
					if (commentList.size() > 6) {
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>��� ������</a></td></tr>");
					}
					for (int j = 0; j < commentList.size(); j++) {
						HashMap comment = commentList.get(j);
						String nickname = (String) comment.get("NICKNAME");
						String content = (String) comment.get("CONTENT");
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
						out.print(nickname);
						out.print("</a>" + content + "</td></tr>");
					}
				}
				out.print(
						"</table></div><div class='addCmt' style='padding: 0px 5px 40px 5px'><a href='./m/comment?pid="+seq_photo+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>��� �ޱ�</a></div></div><br/>");
			}
		} else {
			out.print("<br/><span>������ ������ �����Ͽ� �����غ�����</span>");
		}
		out.print("</div>");
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("email");
		session.removeAttribute("nickname");
		session.setAttribute("loginYn", "N");

		return "mobile/login";
	}

	@RequestMapping("/emailcheck")
	public String emailcheck() {
		return "mobile/emailcheck";
	}

	// �̸��ϸ� ������ �ߺ��� üũ
	@RequestMapping("/validationEmail")
	public void validationEmail(UserInfoVO user, HttpSession session,
			HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		UserInfoVO findedUser = userInfoDao.findEmail(user);

		if (findedUser != null) {
			// �ߺ��Ǿ���
			out.print("existedEmail");
		} else {
			// ��밡��
			session.setAttribute("email", user.getEmail());
			out.print("availableEmail");
		}
	}

	@RequestMapping("/usercheck")
	public String userCheck() {
		return "mobile/usercheck";
	}

	@RequestMapping("/validationNickname")
	public void validationEmailAndNickname(UserInfoVO user,
			HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		UserInfoVO findedUserListByEmail = userInfoDao.findEmail(user);
		UserInfoVO findedUSerListByNick = userInfoDao.findNickname(user);
		if (findedUserListByEmail != null) {
			// �ߺ��Ǿ���
			System.out.println("�̸��� �ߺ� �˻� : �̸��� �ߺ�");
			out.print("existedEmail");

		} else if (findedUSerListByNick != null) {

			System.out.println("�̸���, �г��� �ߺ� �˻� : �̸���, �г��� �ߺ�");
			out.print("existedNickname");

		} else {
			// ��밡��
			System.out.println("�̸���, �г��� �ߺ� �˻� : �̸���, �г��� ��� ����");
			boolean result = userInfoDao.insert(user);
			if (result) {
				System.out.println("���ԿϷ�");
				out.print("joinSuccess");
			} else {
				System.out.println("DB����");
				out.print("DBerror");
			}
		}

	}

	@RequestMapping("/round")
	public String round(HttpSession session, ActivityVO activityVO,
			Model model) {
		String email = (String) session.getAttribute("email");

		UserInfoVO user = new UserInfoVO(email);

		// DB���� ���� ��������.
		// mynewsList�޼ҵ� ����
		List<HashMap> roundList = activityDao.roundList(user);
		List<HashMap> round_profileList = activityDao.round_profileList(user);
		
		// jsp���� ������ �հ� ������
		model.addAttribute("roundList", roundList);
		model.addAttribute("round_profileList", round_profileList);
		return "mobile/round";
	}
	

	@RequestMapping("/like")
	public void like(HttpSession session,HttpServletResponse res,HttpServletRequest req) throws IOException {
		String email = (String) session.getAttribute("email");
		String state = (String) req.getParameter("state");
		String seq_photo = (String) req.getParameter("seq_photo");
		
		System.out.println("LIKE CONTROLLER : " + email + "/" + state + "/" + seq_photo);
		PrintWriter out = res.getWriter();
		
		LikeVO like = new LikeVO();
		like.setEmail(email);
		like.setSeq_photo(seq_photo);
		
		System.out.println(like);
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
	
	@RequestMapping("/likelist")
	public void likelist(HttpSession session,HttpServletResponse res,HttpServletRequest req) throws IOException {
		String seq_photo = (String) req.getParameter("seq_photo");
		
		PrintWriter out = res.getWriter();
		
		List<HashMap> likeList = likeDao.getLikeByPhotoId(seq_photo);
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");
		
		out.print("<span style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>�� </span>");
		System.out.println("LIKELIST : " + likeList);
		if(likeList.size()<=6) {
			for(int i=0; i<likeList.size(); i++) {
				String nickname = (String)likeList.get(i).get("NICKNAME");
				System.out.println("FOR �� ���� NICKNAME : " + nickname);
				out.print("<a href='/Kostagram/m/"+ nickname +"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>" + nickname + " </a>");
			}
		} else if(likeList.size()==0) {
			out.print("<span style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>���ƿ� </span>");
		}
			else {
			out.print("<a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879;	font-weight: normal;'>" + likeList.size() + "��</a>");
		}
			
	}
	
	@RequestMapping("/search_people")
	public String search_people() {
		return "mobile/search_people";
	}
	
	@RequestMapping("/ajaxsearch_people")
	public void ajaxsearchpeople(UserInfoVO userInfoVO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		String nickname = (String)request.getParameter("input_people");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");	

		UserInfoVO findUserVO = new UserInfoVO();
		findUserVO.setNickname(nickname);
		List<UserInfoVO> search_result = userInfoDao.searchNickname(findUserVO);
		if(search_result!=null && search_result.size()>=1) {
			System.out.println(search_result);
			out.print("<table class='search_result'>");
			for (int i = 0; i < search_result.size(); i++) {
				String nick_name = search_result.get(i).getNickname();
				String name = search_result.get(i).getName();
				String profile = search_result.get(i).getProfile_img();
				String email = search_result.get(i).getEmail();
				if(profile!=null && profile=="") {
					out.print("<tr><td align='left' style='padding-left: 15px;'><img src='../personalImg/'" + email + "/" + profile + ".jpg' width='40'"
							+ "style='-webkit-border-radius: 100px; border-radius: 100px;'/></td><td><a href='/Kostagram/m/"+nick_name+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>"+nick_name+"<br><span style='color:#bdbdbd;'>" + name + "</span></td></tr>");
				} else {
					out.print("<tr><td align='center' style='padding-left: 15px;'><img src='../personalImg/profile.jpg' width='40'"
							+ "style='-webkit-border-radius: 100px; border-radius: 100px;'/></td><td><a href='/Kostagram/m/"+nick_name+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>"+nick_name+"<br><span style='color:#bdbdbd;'>" + name + "</span></td></tr>");
				}
			}
			out.print("</table>");
		} else {
			out.print("<table class='search_result'>");
			out.print("<tr><td align='left' style='padding-left: 15px;'>�˻������ �����ϴ�</td></tr>");
			out.print("</table>");
		}
	}

	@RequestMapping("/search_hashtag")
	public String search_hashtag() {
		return "mobile/search_hashtag";
	}
	
	@RequestMapping("/ajaxsearch_hashtag")
	public void ajaxsearchhashtag(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		String hashtag = (String)request.getParameter("input_hashtag");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");	
		
		HashtagVO findHashtagVO = new HashtagVO();
		findHashtagVO.setHashtag(hashtag);
		List<HashtagVO> search_result = hashtagDao.searchHashtag(findHashtagVO);
		if(search_result!=null && search_result.size()>=1) {
			System.out.println(search_result);
			out.print("<table class='search_result'>");
			for (int i = 0; i < search_result.size(); i++) {
				String hash_tag = search_result.get(i).getHashtag();
				out.print("<tr><td align='left' style='padding-left: 15px;'>#<span class='result_hashtag' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>" + hash_tag + "</span></tr>");
			}
			out.print("</table>");
		} else {
			out.print("<table class='search_result'>");
			out.print("<tr><td align='left' style='padding-left: 15px;'>�˻������ �����ϴ�</td></tr>");
			out.print("</table>");
		}
	}
	
	@RequestMapping("/ajaxselect_hashtag")
	public void ajaxselecthashtag(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String hashtag = (String)request.getParameter("select_hashtag");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");
		
		List<PhotoInfoVO> select_result = hashtagDao.selectHashtag(hashtag);
		if(select_result!=null && select_result.size()>=1) {
			System.out.println("CONTROLLER select_result : " + select_result);
			out.print("<div id='photoList'>");
			if (select_result != null && select_result.size() > 0) {
				out.print("<ul class='myPhotoListByGrid'>");
				for (int i = 0; i < select_result.size(); i++) {
					PhotoInfoVO photo = select_result.get(i);
					String seq_photo = photo.getSeq_photo();
					String email = photo.getEmail();
					out.print("<li><a href='../detail?pid=" + seq_photo
							+ "'><img src='/Kostagram/personalImg/" + email + "/"
							+ seq_photo + ".jpg'/></a></li>");
				}
				out.print("</ul>");
			}
		}
	}
	
	@RequestMapping("/hashtag/{select_hashtag}")
	public String hashtag(@PathVariable String select_hashtag, Model model) throws Exception{
		String hashtag = new String(select_hashtag.getBytes("8859_1"), "utf-8");
		model.addAttribute("hashtag", hashtag);
		return "mobile/search_result";
	}
	
	@RequestMapping("/search_place")
	public String search_place() {
		return "mobile/search_place";
	}
	
	@RequestMapping("/ajaxsearch_place")
	public void ajaxsearchplace(UserInfoVO userInfoVO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		String input_place = (String)request.getParameter("input_place");
		System.out.println("SEARCH_PLACE CONTROLLER : " + input_place);
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");	
		     
		List<HashMap> search_result = locationDao.searchLocation(input_place);
		System.out.println("SEARCH_PLACE RESULT : " + search_result);
		if(search_result!=null && search_result.size()>=1) {
			out.print("<table class='search_result'>");
			for (int i = 0; i < search_result.size(); i++) {
				String place = (String)search_result.get(i).get("LOCATION");
				out.print("<tr><td align='left' style='padding-left: 15px;'>#<span class='result_place' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>" + place + "</span></tr>");
			}
			out.print("</table>");
		} else {
			out.print("<table class='search_result'>");
			out.print("<tr><td align='left' style='padding-left: 15px;'>�˻������ �����ϴ�</td></tr>");
			out.print("</table>");
		}
	}
	
	@RequestMapping("/ajaxselect_place")
	public void ajaxselectplace(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String place = (String)request.getParameter("select_place");
		System.out.println("SELECT_PLACE CONTROLLER : " + place);
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");
		
		List<PhotoInfoVO> select_result = locationDao.selectPlace(place);
		System.out.println("CONTROLLER select_result : " + select_result);
		if(select_result!=null && select_result.size()>=1) {
			out.print("<div id='photoList'>");
			if (select_result != null && select_result.size() > 0) {
				out.print("<ul class='myPhotoListByGrid'>");
				for (int i = 0; i < select_result.size(); i++) {
					PhotoInfoVO photo = select_result.get(i);
					String seq_photo = photo.getSeq_photo();
					String email = photo.getEmail();
					out.print("<li><a href='../detail?pid=" + seq_photo
							+ "'><img src='/Kostagram/personalImg/" + email + "/"
							+ seq_photo + ".jpg'/></a></li>");
				}
				out.print("</ul>");
			}
		}
	}
	
	@RequestMapping("/place/{select_place}")
	public String place(@PathVariable String select_place, Model model) throws Exception{
		String place = new String(select_place.getBytes("8859_1"), "utf-8");
		List<HashMap> search_result = locationDao.searchLocation(place);
		List<HashMap> locationList = locationDao.selectLocationMap();
		String lat = (String)search_result.get(0).get("LAT");
		String lon = (String)search_result.get(0).get("LON");
		
		model.addAttribute("lat", lat);
		model.addAttribute("lon", lon);
		model.addAttribute("place", place);
		model.addAttribute("locationList", locationList);
		return "mobile/searchplace_result";
	}
	
	@RequestMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		String seq_photo = request.getParameter("pid");
		List<HashMap> userInfo = photoInfoDao.getUserInformation(seq_photo);

		String email = (String)userInfo.get(0).get("EMAIL");
		String profile_img = (String)userInfo.get(0).get("PROFILE_IMG");
		String nickname = (String)userInfo.get(0).get("NICKNAME");
		Date reg_date = (Date)userInfo.get(0).get("REG_DATE");
		
		ArrayList<ArticleVO> myPhotoList = photoInfoDao.getPhotoInfo(seq_photo);
		System.out.println("DETAIL CONTROLLER : " + myPhotoList);
		model.addAttribute("seq_photo", seq_photo);
		model.addAttribute("email", email);
		model.addAttribute("profile_img", profile_img);
		model.addAttribute("nickname", nickname);
		model.addAttribute("reg_date", reg_date);
		model.addAttribute("myPhotoList", myPhotoList);
		return "mobile/detail";
	}

	// �ȷ��� �α� (���ƿ� �ȷο�)
	@RequestMapping("/following")
	public String following(HttpServletRequest request, HttpSession session,Model model) {
		
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		//System.out.println(email);
		List<HashMap> followingList = activityDao.followingList(new UserInfoVO(email));
		//System.out.println(followingList);
		model.addAttribute("followingList", followingList);

		return "mobile/following";

	}

	@RequestMapping("/mynews")
	public String mynews(HttpSession session, ActivityVO activityVO,
			Model model) {

		// DB���� ��(���� ���ǿ� ����Ǿ��ִ� email) �Խù��� ��� �Ǵ� ���ƿ並 �� ����� �г���, ����, find(��� or
		// ���ƿ�)���� ����� �����;��Ѵ�.
		// session���� �̸����� �޾ƿ�.
		String email = (String) session.getAttribute("email");

		UserInfoVO user = new UserInfoVO(email);

		// DB���� ���� ��������.
		// mynewsList�޼ҵ� ����
		List<HashMap> mynews = activityDao.mynewsList(user);

		// jsp���� ������ �հ� ������
		model.addAttribute("mynews", mynews);
		return "mobile/mynews";
	}

	@RequestMapping("/getMyPhotoList")
	public void getMyPhotoList(HttpSession session, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		String type = (String) req.getParameter("type");
		String email = (String) req.getParameter("email");

		UserInfoVO user = new UserInfoVO(email);

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		out.print("<div id='photoList'>");
		if (type.equals("grid")) {
			List<PhotoInfoVO> myPhotoList = photoInfoDao.getMyPhotoList(user);
			if (myPhotoList != null && myPhotoList.size() > 0) {
				out.print("<ul class='myPhotoListByGrid'>");
				for (int i = 0; i < myPhotoList.size(); i++) {
					PhotoInfoVO photo = myPhotoList.get(i);
					String seq_photo = photo.getSeq_photo();
					out.print("<li><a href='./detail?pid=" + seq_photo
							+ "'><img src='../personalImg/" + email + "/"
							+ seq_photo + ".jpg' alt='" + seq_photo
							+ "' /></a></li>");
				}
				out.print("</ul>");
			} else {
				out.print("<span>������ ������ �����Ͽ� �����غ�����</span>");
			}
		} else if (type.equals("list")) {
			ArrayList<ArticleVO> myPhotoList = photoInfoDao
					.getMyPhotoListForArticle(user);
			if (myPhotoList.size() != 0) {
				for (int i = 0; i < myPhotoList.size(); i++) {
					ArticleVO article = myPhotoList.get(i);
					PhotoInfoVO photo = article.getPhoto();
					String seq_photo = photo.getSeq_photo();

					out.print(
							"<div class='article'><div class='photoHeader'><table width='100%'><tr><td width='60'>");

					HashMap userInfo = article.getUserInfo();
					String photoNickname = (String) userInfo.get("NICKNAME");
					String profile = (String) userInfo.get("PROFILE");
					if (profile == null) {
						out.print(
								"<img src='../personalImg/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// ������
					} else {
						out.print("<img src='../personalImg/" + email
								+ "/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// ������
						// �̹���
					}
					out.print(
							"</td><td align='left'><a href='./m/"+photoNickname+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
					out.print(photoNickname);// �г���
					out.print(
							"</a></td><td align='right' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
					
					long uploadTime = System.currentTimeMillis() - photo.getReg_date().getTime();
					if ( uploadTime/(1000*60*60*24*7) != 0 ) {
						out.print( uploadTime/(1000*60*60*24*7) +"�� ��" );
					} else if ( uploadTime/(1000*60*60*24) != 0 ) {
						out.print( uploadTime/(1000*60*60*24) + "�� ��" );
					} else if ( uploadTime/(1000*60*60) != 0 ) {
						out.print( uploadTime/(1000*60*60) + "�� ��" );
					} else if ( uploadTime/(1000*60) != 0 ) {
						out.print( uploadTime/(1000*60) + "�� ��");
					} else if ( uploadTime/(1000*30) != 0 ) {
						out.print( "���" );
					}
					
					out.print(
							"</td></tr></table></div><div class='photoArea'><table width='100%' cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>");
					out.print("<img src='../personalImg/" + email + "/"
							+ seq_photo + ".jpg' width='100%' />");// �ø� ����
					out.print(
							"</td></tr></table></div><div class='CMTnLIK' style='padding: 0px 5px 0px 5px'><table><tr><td align='left'><img src='./image/icon/heart.png' width='25' />");
					out.print(
							"</td><td align='left'><a href='#'><img src='./image/icon/chat_bubble.png' width='25' /></a></td><td align='right'><a href='./report?pid="+seq_photo+"'>");
					out.print(
							"<img src='./image/icon/warning.png' width='25' /></a></td></tr></table><hr/><table><tr>");

					List<HashMap> likeList = article.getLikeList();
					if (likeList.size() < 6) {
						out.print(
								"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>�� ");
						if (likeList.size() == 0) {
							out.print("���ƿ�");
						}
						for (int j = 0; j < likeList.size(); j++) {
							HashMap like = likeList.get(j);
							String cmtNickname = (String) like.get("NICKNAME");
							out.print(cmtNickname);
						}
						out.print("</a></td>");
					} else {
						out.print(
								"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>��");
						out.print(likeList.size() + "��</a></td></tr>");
					}
					if (photo.getContent() != null) {
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
						out.print("�г���");
						out.print("</a>" + photo.getContent() + "</td></tr>");
					}

					List<HashMap> commentList = article.getCommentList();
					if (commentList != null && commentList.size() > 0) {
						if (commentList.size() > 6) {
							out.print(
									"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>��� ������</a></td></tr>");
						}
						for (int j = 0; j < commentList.size(); j++) {
							HashMap comment = commentList.get(j);
							String nickname = (String) comment.get("NICKNAME");
							String content = (String) comment.get("CONTENT");
							out.print(
									"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
							out.print(nickname);
							out.print("</a> " + content + "</td></tr>");
						}
					}
					out.print(
							"</table></div><div class='addCmt' style='padding: 0px 5px 40px 5px'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>��� �ޱ�</a></div></div>");
				}
			}  else {
				out.print("<span>������ ������ �����Ͽ� �����غ�����</span>");
			}
		} else {
			out.print("�߸��� ��û�Դϴ�. �ٽ� �õ��� �ּ���.");
		}
		out.print("</div>");

	}

	@RequestMapping("/profileupdate")
	public String profileupdate(UserInfoVO userInfoVO, HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			Model model) throws IOException {
		// session���� nickname�� �޾� DB ���ٿ�
		String nickname = (String) session.getAttribute("nickname");
		userInfoVO.setNickname(nickname);
		// findNickname �޼ҵ� ����
		UserInfoVO userinfo = userInfoDao.findNickname(userInfoVO);

		model.addAttribute("userinfo", userinfo);
		return "mobile/profileupdate";
	}

	@RequestMapping("/ajaxprofileupdate")
	public void profileupdate(UserInfoVO userInfoVO, HttpSession session,
			HttpServletResponse response, Model model) throws IOException {
		String nickname = (String) session.getAttribute("nickname");

		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");

		UserInfoVO findUserVO = new UserInfoVO();
		findUserVO.setNickname(userInfoVO.getNickname());

		findUserVO = userInfoDao.findNickname(findUserVO);

		System.out.println("select :" + userInfoVO);
		if (userInfoVO.getNickname() == null
				|| findUserVO.getNickname().equals(nickname)) {
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

		// session���� nickname�� �޾� DB ���ٿ�

	}

	@RequestMapping("/option")
	public String option() {
		return "mobile/option";
	}

	@RequestMapping("/findphonenumber")
	public String findphonenumber(UserInfoVO userInfoVO, Model model) {
		
		UserInfoVO findUserVO = new UserInfoVO();
		List<UserInfoVO> userinfo = userInfoDao.findFriend(findUserVO);
		
		model.addAttribute("userinfo", userinfo);
		System.out.println(userinfo);
		return "mobile/findphonenumber";
	}

	// ��й�ȣ ���� ������ ����
	@RequestMapping("/pwupdate")
	public String pwupdate(HttpServletRequest request, HttpSession session,
			Model model) {

		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		return "mobile/pwupdate";

	}

	// ��й�ȣ �����ϱ�
	@RequestMapping("/pwupdate/update")
	public String pwupdateUpdate(HttpServletRequest request,
			HttpSession session, Model model) {
		// �α����� ���� ���¸� �α��� �������� �����̵�
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// �Է��� ���� ��й�ȣ�� ������ ��й�ȣ�� �����´�
		String email = (String) session.getAttribute("email");
		String pw = request.getParameter("oldPass");
		String newPw = request.getParameter("newPass");
		// ���� ��й�ȣ�� ��ġ�� ��� ������ ��й�ȣ�� DAO�� ������. ���������� userpage�� �̵�
		boolean pwCheck = userInfoDao.pwCheck(new UserInfoVO(email, pw));
		if (pwCheck == true) {
			boolean pwUpdate = userInfoDao
					.pwUpdate(new UserInfoVO(email, newPw));
			return "mobile/userpage";
		}
		// ���� ��й�ȣ�� Ʋ�� ��� �ٽ� ��й�ȣ ���� ��������
		else if (pwCheck == false) {
			return "mobile/pwupdate";
		}
		return "mobile/login";
	}

	// ������ �Խù� �����ֱ�
	@RequestMapping("/likenotice")
	public String likenotice(HttpSession session, ActivityVO activityVO,
			Model model) {

		// �α����� ���� ���¸� �α��� �������� �����̵�
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// �α����� �� ���¸� �ڽ��� ���̵� �����ͼ� DAO�� ���� ���� �ڽ��� ���̵� �´� likeNoticeList�� �����´�.
		String email = (String) session.getAttribute("email");
		
		List<HashMap> mylikeList = likeDao.getILikeitPhotoId(email);

		// ������ likeNoticeList �� ��� ����
		
		model.addAttribute("mylikeList", mylikeList);

		return "mobile/likenotice";
	}
	
	@RequestMapping("/report")
	public String goToReportPage(@RequestParam String pid, Model model) {
		model.addAttribute("pid", pid);
		return "mobile/report";
	}
	
	@RequestMapping("/reportphoto")
	public void reportPhoto(@RequestParam String pid, @RequestParam String rid, HttpSession session, HttpServletResponse res) throws IOException {
		PrintWriter out = res.getWriter();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");
		
		ReportVO report = new ReportVO();
		report.setSeq_photo(pid);
		report.setEmail((String)session.getAttribute("email"));
		report.setContent_id(rid);
		
		if ( reportDao.insert(report) ) {
			out.print("reportSuccess");
		} else {
			out.print("reportFailed");
		}
	}
	
	// ä�� ����Ʈ
	@RequestMapping("/chatting")
	public String chatting(HttpServletRequest request, HttpSession session,
			Model model) {

		// �α����� ���� ���¸� �α��� �������� �����̵�
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// �α����� �� ���¸� �ڽ��� ���̵� �����ͼ� ConversationDAO�� ���� ���� �ڽ��� ���̵� �´�
		// chattinglist�� �����´�.
		String email = (String) session.getAttribute("email");
		List<ConversationVO> chattinglist = conversationDao
				.selectList(new UserInfoVO(email));
		// ������ chattinglist �� ��� ����

		return "mobile/chattinglist";

	}

	// ä�� ����Ʈ (��ȭ��� �߰�)
	@RequestMapping("/chattinginsert")
	public String chattinginsert(HttpServletRequest request,
			HttpSession session, Model model) {

		// �α����� ���� ���¸� �α��� �������� �����̵�
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// ��� ���̵� �޾ƿ� ���� ConversationDao �� ���� ��ȭ ��븦 �߰� �ѵ�
		// �ٽ� chattinglist �������� �̵�
		String someoneEmail = request.getParameter("someoneEmail");
		boolean result = conversationDao.insert(new UserInfoVO(someoneEmail));

		return "mobile/chattinglist";

	}
	
	@RequestMapping("/comment")
	public String comment(@RequestParam String pid, Model model, CommentVO comment) {

		System.out.println("pid = " +pid);
		// DB���� ���� ��������.
		List<HashMap> commentList = commentDao.getCommentByPhotoId(pid);
		System.out.println("controller commentList = "+commentList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("pid", pid);
		return "mobile/comment";
	}
	
	
	@RequestMapping("/ajaxcomment")
	public String comment(CommentVO commentVO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		
		String seq_photo = (String)request.getParameter("seq_photo");
		String email = (String)session.getAttribute("email");
		String content = (String)request.getParameter("comment");
		
		System.out.println("seq_photo = "+seq_photo);
		commentVO.setEmail(email);
		System.out.println(commentVO);
		boolean result = commentDao.insert(commentVO);

		List<HashMap> commentList = commentDao.getCommentByPhotoId(seq_photo);
		
		model.addAttribute("commentList", commentList);
		return "/mobile/comment2";
	}
	
	
	
	// ��й�ȣ �����ϱ�
		@RequestMapping(value = "/ajaxpwupdate")
		public void pwupdateUpdate(HttpServletRequest request,HttpServletResponse response,
				HttpSession session, Model model) throws IOException{
			// �α����� ���� ���¸� �α��� �������� �����̵�
			
			
			String email = (String) session.getAttribute("email");
			String nowpw = (String)request.getParameter("nowpw");
			String changepw = (String)request.getParameter("changepw");
			
			System.out.println(email);
			System.out.println(nowpw);
			System.out.println(changepw);
			
			PrintWriter out = response.getWriter();

			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");

			System.out.println("����");
			UserInfoVO userInfoVO = userInfoDao.findPass(new UserInfoVO(email));	
			System.out.println(userInfoVO);
			if (nowpw.equals(userInfoVO.getPass())) {
				
				userInfoVO.setPass(changepw);
				boolean result = userInfoDao.pwUpdate(userInfoVO);
				
				if(result)
				{
					System.out.println(result);
					out.print("updateSuccess");
					System.out.println("����");
					
				}
							
			}
			
			else 
			{
				out.print("updateFail");
			}
		}

		//����� ������ ����
	    @RequestMapping("/photomap")
	    public String report(LocationVO location,HttpSession session,
	    		Model model,HttpServletRequest request,HttpServletResponse response) 
	    		throws IOException {
	    	
	    	if (session == null || session.getAttribute("email") == null
					|| session.getAttribute("loginYn") == null
					|| session.getAttribute("loginYn").equals("N")) {
				return "mobile/login";
			}
	    	
	    PrintWriter out = response.getWriter();	
	    
	    String email = (String) session.getAttribute("email");
	    UserInfoVO user = new UserInfoVO(email);
	    
	    System.out.println(email);
	    List<HashMap> locationList = locationDao.findPhotoMap(user);
	    model.addAttribute("locationList", locationList);
	    
	    	
	    
		return "mobile/photoMap";
	    }
	    
	    @RequestMapping(value = "/userpage")
		public void follow(HttpSession session, HttpServletResponse response, HttpServletRequest request)
				throws IOException {
			String from_email = (String) session.getAttribute("email");
			String to_email = (String) request.getParameter("to_email");
			String followState = (String) request.getParameter("followState");

			FollowVO follow = new FollowVO();
			follow.setTo_email(to_email);
			follow.setFrom_email(from_email);
			
			PrintWriter out = response.getWriter();
			
			System.out.println(followState);
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			
			
			System.out.println(followState);
			if (followState.equals("UF")) {
				System.out.println(followState);
				if (followDao.insert(follow)) {
					out.print("following");
				} else {
					out.print("�ȷ����߿� �����Ͽ����ϴ�.");
				}
			} else if (followState.equals("F")) {
				System.out.println("followStata�� F...");
				if (followDao.delete(follow.getTo_email())) {
					out.print("follow");
				} else {
					out.print("�ȷο��߿� �����Ͽ����ϴ�.");
				}
			}
			
			
		}
		
	    @RequestMapping("/myfollower")
		public String myfollower(@RequestParam String email,HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) 
				throws IOException {

	    	String pageEmail = email;
	    	String sessionEmail = (String)session.getAttribute("email");
	    	
	    	HashMap map = new HashMap();
	    	map.put("pageEmail", pageEmail);
	    	map.put("sessionEmail", sessionEmail);
	    	
    		List<HashMap> myfollower = followDao.getMyFollowerNickname(map);
    		
    		model.addAttribute("myfollower", myfollower);
    		
    		return "mobile/myfollower";
		}

	    @RequestMapping("/myfollowing")
		public String myfollowing(@RequestParam String email, HttpSession session, Model model) {

	    	String pageEmail = email;
	    	String sessionEmail = (String)session.getAttribute("email");
	    	HashMap map = new HashMap();
	    	map.put("pageEmail", pageEmail);
	    	map.put("sessionEmail", sessionEmail);
	    	
    		List<HashMap> myfollowing = followDao.getMyFollowingNickname(map);
	    		
    		model.addAttribute("myfollowing", myfollowing);
			return "mobile/myfollowing";
		}
		
		@RequestMapping("/{nickname}")
		public String userpage(@PathVariable String nickname, HttpSession session,Model model) {

			UserInfoVO user = new UserInfoVO();
			user.setNickname(nickname);
			FollowVO follow = new FollowVO();
			
			String check="N";
			
			user = userInfoDao.findNickname(user);
			
			
			if (user != null) {
				model.addAttribute("email", user.getEmail());
				model.addAttribute("nickname", user.getNickname());
				model.addAttribute("profile", user.getProfile_img());
				model.addAttribute("message", user.getMessage());
				model.addAttribute("photoCnt", photoInfoDao.countMyPhoto(user));
				model.addAttribute("followerCnt", followDao.getMyFollower(user));
				model.addAttribute("followingCnt", followDao.getMyFollowing(user));
				
				if (((String) session.getAttribute("nickname")).equals(nickname)) {
					check = "Y";
					model.addAttribute("check", check);
				}
				// �α����� �ߴµ� �ڱ��ڽ��� �ƴϰ�
				else {
					follow.setFrom_email((String) session.getAttribute("email"));
					follow.setTo_email(user.getEmail());
					follow = followDao.check(follow);
					if (follow == null) {
						check = "FN";
					}

					model.addAttribute("check", check);
				}
				
				
				return "mobile/userpage";
			} else {
				model.addAttribute("nickname", nickname);
				return "mobile/usernotfound";
			}
		}
	
	
}
