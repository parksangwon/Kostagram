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
import org.springframework.web.bind.annotation.RequestMapping;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.ConversationVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.ActivityDAO;
import com.kostagram.service.dao.ConversationDAO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.UserInfoDAO;

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

	// Ÿ�� ���� (����)
	@RequestMapping("/")
	public String timeLine(HttpSession session, Model model) {

		if (session == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")
				|| session.getAttribute("email") == null) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		List<ArticleVO> timeLineList = photoInfoDao
				.getTimeline(new UserInfoVO(email));
		model.addAttribute("timeLineList", timeLineList);

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
	public String round() {
		return "mobile/round";
	}

	@RequestMapping("/search_home")
	public String search_home() {
		return "mobile/search_home";
	}

	@RequestMapping("/search_people")
	public String search_people() {
		return "mobile/search_people";
	}

	@RequestMapping("/search_hashtag")
	public String search_hashtag() {
		return "mobile/search_hashtag";
	}

	@RequestMapping("/search_place")
	public String search_place() {
		return "mobile/search_place";
	}

	@RequestMapping("/detail")
	public String detail() {
		return "mobile/detail";
	}

	// �ȷ��� �α� (���ƿ� �ȷο�)
	@RequestMapping("/following")
	public String following(HttpServletRequest request, HttpSession session,
			Model model) {

		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		List<ActivityVO> followingList = activityDao
				.activityList(new UserInfoVO(email));
		model.addAttribute("followingList", followingList);

		return "mobile/following";

	}

	 @RequestMapping("/mynews")
	    public String mynews(HttpSession session, ActivityVO activityVO, Model model) {
	    	
	    	//DB���� ��(���� ���ǿ� ����Ǿ��ִ� email) �Խù��� ��� �Ǵ� ���ƿ並 �� ����� �г���, ����, find(��� or ���ƿ�)���� ����� �����;��Ѵ�.
	    	//session���� �̸����� �޾ƿ�.
	    	String email = (String) session.getAttribute("email");
	    	
	    	UserInfoVO user = new UserInfoVO(email);
			
			//DB���� ���� ��������.
			//mynewsList�޼ҵ� ����
			List<HashMap> mynews = activityDao.mynewsList(user);
			
	    	//jsp���� ������ �հ� ������
			model.addAttribute("mynews", mynews);
			return "mobile/mynews";
	    }

	@RequestMapping("/userpage")
	public String userpage() {
		return "mobile/userpage";
	}

	@RequestMapping("/getMyPhotoList")
	public void getMyPhotoList(HttpSession session, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		String type = (String) req.getParameter("type");
		String email = (String) session.getAttribute("email");

		System.out.println(type);
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
			for (int i = 0; i < myPhotoList.size(); i++) {
				ArticleVO article = myPhotoList.get(i);
				PhotoInfoVO photo = article.getPhoto();
				String seq_photo = photo.getSeq_photo();

				System.out.println(article);
				out.print(
						"<div class='article'><div class='photoHeader'><table width='100%'><tr><td width='60'>");

				HashMap userInfo = article.getUserInfo();
				String photoNickname = (String) userInfo.get("NICKNAME");
				String profile = (String) userInfo.get("PROFILE");
				if ( profile == null ) {
					out.print("<img src='../personalImg/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// ������
				} else {
					out.print("<img src='../personalImg/" + email
							+ "/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// ������
				// �̹���
				}
				out.print(
						"</td><td align='left'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
				out.print(photoNickname);// �г���
				out.print(
						"</a></td><td align='right' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
				out.print(photo.getReg_date());// �ø��ð�
				out.print(
						"</td></tr></table></div><div class='photoArea'><table width='100%' cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>");
				out.print("<img src='../personalImg/" + email + "/" + seq_photo
						+ ".jpg' width='100%' />");// �ø� ����
				out.print(
						"</td></tr></table></div><div class='CMTnLIK'><table><tr><td align='left'><a href='#'><img src='./image/icon/heart.png' width='25' />");
				out.print(
						"</a><a href='#'><img src='./image/icon/chat_bubble.png' width='25' /></a></td><td align='right'><a href='#'>");
				out.print(
						"<img src='./image/icon/warning.png' width='25' /></a></td></tr><tr>");

				List<HashMap> likeList = article.getLikeList();
				if (likeList.size() < 6) {
					out.print(
							"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>��");
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
					if ( commentList.size() > 6) {
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>��� ������</a></td></tr>");
					}
					for (int j = 0; j < commentList.size(); j++) {
						HashMap comment = commentList.get(j);
						String nickname = (String) comment.get("NICKNAME");
						String content = (String) comment.get("CONTENT");
						System.out.println(nickname + "/" + content);
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
						out.print(nickname);
						out.print("</a>" + content + "</td></tr>");
					}
				}
				out.print(
						"</table></div><div class='addCmt'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>��� �ޱ�</a></div></div>");
			}
		} else {
			out.print("�ε� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.");
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
	public String findphonenumber() {
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
	public String likenotice(HttpServletRequest request, HttpSession session,
			Model model) {

		// �α����� ���� ���¸� �α��� �������� �����̵�
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// �α����� �� ���¸� �ڽ��� ���̵� �����ͼ� DAO�� ���� ���� �ڽ��� ���̵� �´� likeNoticeList�� �����´�.
		String email = (String) session.getAttribute("email");
		List<PhotoInfoVO> likePhotoList = photoInfoDao
				.selectList(new UserInfoVO(email)); // LikeDAO��
		// selectList
		// �߰�

		// ������ likeNoticeList �� ��� ����

		model.addAttribute("likePhotoList", likePhotoList);
		return "mobile/likenotice";

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

}
