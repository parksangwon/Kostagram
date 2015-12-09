package com.kostagram.control;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.kostagram.service.dao.LikeDAO;
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

	@Autowired
	private LikeDAO likeDao;

	// 타임 라인 (메인)
	@RequestMapping("/")
	public String timeLine(HttpSession session, Model model) {

		if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
				|| session.getAttribute("email") == null) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		List<ArticleVO> timeLineList = photoInfoDao.getTimeline(new UserInfoVO(email));
		model.addAttribute("timeLineList", timeLineList);

		return "mobile/timeline";

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

		// userInfoDao로 정보가 있는지 확인
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

	// 이메일만 보내고 중복을 체크
	@RequestMapping("/validationEmail")
	public void validationEmail(UserInfoVO user, HttpSession session, HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		UserInfoVO findedUser = userInfoDao.findEmail(user);

		if (findedUser != null) {
			// 중복되었음
			out.print("existedEmail");
		} else {
			// 사용가능
			session.setAttribute("email", user.getEmail());
			out.print("availableEmail");
		}
	}

	@RequestMapping("/usercheck")
	public String userCheck() {
		return "mobile/usercheck";
	}

	@RequestMapping("/validationNickname")
	public void validationEmailAndNickname(UserInfoVO user, HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		UserInfoVO findedUserListByEmail = userInfoDao.findEmail(user);
		UserInfoVO findedUSerListByNick = userInfoDao.findNickname(user);
		if (findedUserListByEmail != null) {
			// 중복되었음
			System.out.println("이메일 중복 검사 : 이메일 중복");
			out.print("existedEmail");

		} else if (findedUSerListByNick != null) {

			System.out.println("이메일, 닉네임 중복 검사 : 이메일, 닉네임 중복");
			out.print("existedNickname");

		} else {
			// 사용가능
			System.out.println("이메일, 닉네임 중복 검사 : 이메일, 닉네임 사용 가능");
			boolean result = userInfoDao.insert(user);
			if (result) {
				System.out.println("가입완료");
				out.print("joinSuccess");
			} else {
				System.out.println("DB에러");
				out.print("DBerror");
			}
		}

	}

	// 팔로잉 로그 (좋아요 팔로우)
	@RequestMapping("/following")
	public String following(HttpServletRequest request, HttpSession session, Model model) {

		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		List<ActivityVO> followingList = activityDao.activityList(new UserInfoVO(email));
		model.addAttribute("followingList", followingList);

		return "mobile/following";

	}

	// 포토리스트 (회원정보에 있음)
	@RequestMapping("/photolist")
	public String photolist(HttpServletRequest request, HttpSession session, Model model) {

		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}
		String email = (String) session.getAttribute("email");
		List<ArticleVO> photoList = photoInfoDao.getTimeline(new UserInfoVO(email));
		model.addAttribute("photoList", photoList);

		return "mobile/photolist";

	}

	// 비밀번호 변경 페이지 가기
	@RequestMapping("/pwupdate")
	public String pwupdate(HttpServletRequest request, HttpSession session, Model model) {

		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		return "mobile/pwupdate";

	}

	// 비밀번호 변경하기
	@RequestMapping("/pwupdate/update")
	public String pwupdateUpdate(HttpServletRequest request, HttpSession session, Model model) {
		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 입력한 원래 비밀번호와 변경할 비밀번호를 가져온다
		String email = (String) session.getAttribute("email");
		String pw = request.getParameter("oldPass");
		String newPw = request.getParameter("newPass");
		// 원래 비밀번호가 일치할 경우 변경할 비밀번호를 DAO로 보낸다. 성공했을시 userpage로 이동
		boolean pwCheck = userInfoDao.pwCheck(new UserInfoVO(email, pw));
		if (pwCheck == true) {
			boolean pwUpdate = userInfoDao.pwUpdate(new UserInfoVO(email, newPw));
			return "mobile/userpage";
		}
		// 원래 비밀번호가 틀린 경우 다시 비밀번호 변경 페이지로
		else if (pwCheck == false) {
			return "mobile/pwupdate";
		}
		return "mobile/login";
	}

	// 좋아한 게시물 보여주기
	@RequestMapping("/likenotice")
	public String likenotice(HttpServletRequest request, HttpSession session, Model model) {

		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 로그인을 한 상태면 자신의 아이디를 가져와서 DAO로 보낸 다음 자신의 아이디에 맞는 likeNoticeList를 가져온다.
		String email = (String) session.getAttribute("email");
		List<PhotoInfoVO> likePhotoList = photoInfoDao.selectList(new UserInfoVO(email)); // LikeDAO에
		// selectList
		// 추가

		// 가져온 likeNoticeList 를 뷰와 공유

		model.addAttribute("likePhotoList", likePhotoList);
		return "mobile/likenotice";

	}

	// 채팅 리스트
	@RequestMapping("/chatting")
	public String chatting(HttpServletRequest request, HttpSession session, Model model) {

		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 로그인을 한 상태면 자신의 아이디를 가져와서 ConversationDAO로 보낸 다음 자신의 아이디에 맞는
		// chattinglist를 가져온다.
		String email = (String) session.getAttribute("email");
		List<ConversationVO> chattinglist = conversationDao.selectList(new UserInfoVO(email));
		// 가져온 chattinglist 를 뷰와 공유

		return "mobile/chattinglist";

	}

	// 채팅 리스트 (대화상대 추가)
	@RequestMapping("/chattinginsert")
	public String chattinginsert(HttpServletRequest request, HttpSession session, Model model) {

		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 상대 아이디를 받아온 다음 ConversationDao 를 통해 대화 상대를 추가 한뒤
		// 다시 chattinglist 페이지로 이동
		String someoneEmail = request.getParameter("someoneEmail");
		boolean result = conversationDao.insert(new UserInfoVO(someoneEmail));

		return "mobile/chattinglist";

	}

	@RequestMapping("/userpage")
	public String userpage() {
		return "mobile/userpage";
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

	@RequestMapping("/findfriend")
	public String findfriend(HttpServletRequest request, UserInfoVO user) {
		String email = (String) request.getParameter("email");
		String name = (String) request.getParameter("name");
		String nickname = (String) request.getParameter("nickname");
		String pass = (String) request.getParameter("pass");
		System.out.println("id=" + email + " name=" + name + " nickname=" + nickname + " pass=" + pass);

		UserInfoVO emailcheck = userInfoDao.findEmail(new UserInfoVO(email));
		System.out.println(emailcheck);

		/*
		 * boolean result = userInfoDao.insert(user); if (result) {
		 * System.out.println("회원가입 완료"); } else { System.out.println("회원가입 실패"
		 * ); }
		 */

		return "mobile/findfriend";
	}

	@RequestMapping("/numbersearch")
	public String numbersearch() {
		return "mobile/numbersearch";
	}

	@RequestMapping("/profileupdate")
	public String profileupdate() {
		return "mobile/profileupdate";
	}

	@RequestMapping("/option")
	public String option() {
		return "mobile/option";
	}

	@RequestMapping("/findphonenumber")
	public String findphonenumber() {
		return "mobile/findphonenumber";
	}

	@RequestMapping("/round")
	public String round() {
		return "mobile/round";
	}

	@RequestMapping("/detail")
	public String detail() {
		return "mobile/detail";
	}

	@RequestMapping("/mynews")
	public String mynews() {
		return "mobile/mynews";
	}
}
