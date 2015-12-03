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
import org.springframework.web.bind.annotation.RequestMethod;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.ConversationVO;
import com.kostagram.service.beans.LikeVO;
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

    // Ÿ�� ���� (����)
    @RequestMapping("/")
    public String timeLine(HttpSession session, Model model) {

	if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
		|| session.getAttribute("email") == null) {
	    return "mobile/login";
	}

	String email = (String) session.getAttribute("email");
	List<PhotoInfoVO> timeLineList = photoInfoDao.getTimeline(new UserInfoVO(email));
	model.addAttribute("timeLineList", timeLineList);

	return "mobile/timeline";

    }

    @RequestMapping("/login")
    public void login(UserInfoVO user, HttpSession session, HttpServletResponse res) throws IOException {
	
	PrintWriter out = res.getWriter();
	
	res.setCharacterEncoding("utf-8");
	res.setContentType("text/xml");
	res.setHeader("Cache-Control", "no-cache");
	
	if (user == null || user.getNickname() == null || user.getPass() == null ) {
	    out.print("loginFail");
	}
	
	// userInfoDao�� ������ �ִ��� Ȯ��
	UserInfoVO findedUser = userInfoDao.findNickname(user);

	if (findedUser != null && findedUser.getPass().equals(user.getPass())) {
	    session.setAttribute("loginYn", "Y");
	    session.setAttribute("email", findedUser.getEmail());
	    out.print("loginSuccess");
	} else {
	    out.print("loginFail");
	}
    }
    
    @RequestMapping("/emailcheck")
    public String emailcheck() {
	return "mobile/emailcheck";
    }
    
    // �̸��ϸ� ������ �ߺ��� üũ
    @RequestMapping("/validationEmail")
    public void validationEmail(UserInfoVO user, HttpServletResponse res) throws IOException {
	
	PrintWriter out = res.getWriter();
	
	res.setCharacterEncoding("utf-8");
	res.setContentType("text/xml");
	res.setHeader("Cache-Control", "no-cache");
	
	UserInfoVO findedUser = userInfoDao.findEmail(user);
	
	if ( findedUser != null ) {
	    // �ߺ��Ǿ���
	    out.print("existedEmail");
	} else {
	    // ��밡��
	    out.print("availableEmail");
	}
    }

    @RequestMapping("/usercheck")
    public String userCheck(HttpServletRequest request, Model model) {
	String email = (String) request.getParameter("email");
	System.out.println("userCheck method params => email : " + email);
	model.addAttribute("email", email);
	return "mobile/usercheck";
    }

    @RequestMapping("/validationNickname")
    public void validationEmailAndNickname(UserInfoVO user, HttpServletResponse res) throws IOException {
	
	PrintWriter out = res.getWriter();
	
	res.setCharacterEncoding("utf-8");
	res.setContentType("text/xml");
	res.setHeader("Cache-Control", "no-cache");
	
	List<UserInfoVO> findedUserList = userInfoDao.findEmailAndNickname(user);
	
	if ( findedUserList != null || findedUserList.size() > 0 ) {
	    // �ߺ��Ǿ���
	    System.out.println("�̸��� �ߺ� �˻� : �̸��� �ߺ�");
	    out.print("existedEmail");
	} else {
	    // ��밡��

	    System.out.println("�̸��� �ߺ� �˻� : �̸��� ��� ����");
	    out.print("availableEmail");
	}
	
    }

    // �ȷ��� �α� (���ƿ� �ȷο�)
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

    // ���丮��Ʈ (ȸ�������� ����)
    @RequestMapping("/photolist")
    public String photolist(HttpServletRequest request, HttpSession session, Model model) {

	if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
		|| session.getAttribute("loginYn").equals("N")) {
	    return "mobile/login";
	}
	String email = (String) session.getAttribute("email");
	List<PhotoInfoVO> photoList = photoInfoDao.getTimeline(new UserInfoVO(email));
	model.addAttribute("photoList", photoList);

	return "mobile/photolist";

    }

    // ��й�ȣ ���� ������ ����
    @RequestMapping("/pwupdate")
    public String pwupdate(HttpServletRequest request, HttpSession session, Model model) {

	if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
		|| session.getAttribute("loginYn").equals("N")) {
	    return "mobile/login";
	}

	String email = (String) session.getAttribute("email");
	return "mobile/pwupdate";

    }

    // ��й�ȣ �����ϱ�
    @RequestMapping("/pwupdate/update")
    public String pwupdateUpdate(HttpServletRequest request, HttpSession session, Model model) {
	// �α����� ���� ���¸� �α��� �������� �����̵�
	if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
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
	    boolean pwUpdate = userInfoDao.pwUpdate(new UserInfoVO(email, newPw));
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
    public String likenotice(HttpServletRequest request, HttpSession session, Model model) {

	// �α����� ���� ���¸� �α��� �������� �����̵�
	if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
		|| session.getAttribute("loginYn").equals("N")) {
	    return "mobile/login";
	}

	// �α����� �� ���¸� �ڽ��� ���̵� �����ͼ� DAO�� ���� ���� �ڽ��� ���̵� �´� likeNoticeList�� �����´�.
	String email = (String) session.getAttribute("email");
	List<PhotoInfoVO> likePhotoList = photoInfoDao.selectList(new UserInfoVO(email)); // LikeDAO��
											  // selectList
											  // �߰�

	// ������ likeNoticeList �� ��� ����

	model.addAttribute("likePhotoList", likePhotoList);
	return "mobile/likenotice";

    }

    // ä�� ����Ʈ
    @RequestMapping("/chatting")
    public String chatting(HttpServletRequest request, HttpSession session, Model model) {

	// �α����� ���� ���¸� �α��� �������� �����̵�
	if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
		|| session.getAttribute("loginYn").equals("N")) {
	    return "mobile/login";
	}

	// �α����� �� ���¸� �ڽ��� ���̵� �����ͼ� ConversationDAO�� ���� ���� �ڽ��� ���̵� �´�
	// chattinglist�� �����´�.
	String email = (String) session.getAttribute("email");
	List<ConversationVO> chattinglist = conversationDao.selectList(new UserInfoVO(email));
	// ������ chattinglist �� ��� ����

	return "mobile/chattinglist";

    }

    // ä�� ����Ʈ (��ȭ��� �߰�)
    @RequestMapping("/chattinginsert")
    public String chattinginsert(HttpServletRequest request, HttpSession session, Model model) {

	// �α����� ���� ���¸� �α��� �������� �����̵�
	if (session == null || session.getAttribute("email") == null || session.getAttribute("loginYn") == null
		|| session.getAttribute("loginYn").equals("N")) {
	    return "mobile/login";
	}

	// ��� ���̵� �޾ƿ� ���� ConversationDao �� ���� ��ȭ ��븦 �߰� �ѵ�
	// �ٽ� chattinglist �������� �̵�
	String someoneEmail = request.getParameter("someoneEmail");
	boolean result = conversationDao.insert(new UserInfoVO(someoneEmail));

	return "mobile/chattinglist";

    }

    @RequestMapping("/userpage")
    public String userpage() {
	return "mobile/userpage";
    }

    @RequestMapping("/search")
    public String search() {
	return "mobile/search";
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
	 * System.out.println("ȸ������ �Ϸ�"); } else { System.out.println("ȸ������ ����"
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
}
