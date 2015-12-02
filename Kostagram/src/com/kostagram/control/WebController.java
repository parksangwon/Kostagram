package com.kostagram.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.SearchDAO;
import com.kostagram.service.dao.UserInfoDAO;

@Controller
public class WebController {

    @Autowired
    private UserInfoDAO userInfoDao;
    private PhotoInfoDAO photoInfoDao;
    private SearchDAO searchDao;

    @RequestMapping("/")
    public String goToMainPage(HttpSession session, Model model) {
	// �α��� ���� Ȯ�� �� �α����� �ȵǾ� ������ �α��� ������
	if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
		|| session.getAttribute("email") == null) {
	    return "web/index";
	}

	List<PhotoInfoVO> timeline = photoInfoDao.getTimeline((String) session.getAttribute("email"));

	model.addAttribute("timeline", timeline);
	return "web/timeline";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest req, Model model) {

	// �Ķ���� �� validation ��
	if (req == null || req.getParameter("username") == null || req.getParameter("password") == null) {
	    return "web/ajax/loginFailed";
	}

	String nickname = (String) req.getParameter("username");
	String password = (String) req.getParameter("password");

	// userInfoDao �� ������ �ִ��� Ȯ��
	UserInfoVO user = userInfoDao.findNickname(new UserInfoVO(nickname));

	if (user != null && user.getPass().equals(password)) {
	    // �α��� ����
	    return "web/timeline";
	}

	return "web/ajax/loginFailed";
    }

    @RequestMapping("/accounts/password/change/")
    public String pwChange(HttpServletRequest request, Model model) {
	if (request.getMethod().equals("POST") && request.getAttribute("id_old_password") != null) {
	    String oldPw = (String) request.getAttribute("id_old_password");
	    String newPw = (String) request.getAttribute("new_password1");
	    
	    boolean check = userInfoDao.pwCheck(new UserInfoVO(oldPw));
	    String message;
	    if (check) {
		check = userInfoDao.pwUpdate(new UserInfoVO(newPw));
		if (check) {
		    message = "���������� ��й�ȣ�� �����Ͽ����ϴ�.";
		} else {
		    message = "��й�ȣ ������ ������ �߻� �Ͽ����ϴ�.";
		}

	    } else {
		message = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
	    }
	    model.addAttribute("message", message);
	}

	return "pwupdate";
    }

    @RequestMapping(value = "/accounts/profileupdate/")
    public String profileEdit(UserInfoVO vo, HttpSession session, HttpServletRequest reqeuest, Model model) {
	String method = reqeuest.getMethod();
	if (method.equals("POST")) {
	    boolean result = userInfoDao.update(vo);
	    if (result) {
		model.addAttribute("message", "���������� ������Ʈ �Ǿ����ϴ�.");
	    } else {
		model.addAttribute("message", "������Ʈ�ϴ� ���� ������ �߻��Ͽ����ϴ�.");
	    }
	}
	String nickname = (String) session.getAttribute("nickname");
	UserInfoVO userinfo = userInfoDao.findNickname(new UserInfoVO(nickname));
	model.addAttribute("userinfo", userinfo);

	return "profileupdate";
    }

    @RequestMapping(value = "/userpage/{nickname}")
    public String userPage(@PathVariable String nickname) {
	System.out.println(nickname);
	// DAO���� {name}�� �ش��ϴ� �ڷḦ �������
	// model�� addAttr--
	return "web/userpage";
    }

    @RequestMapping(value = "/userpage")
    public String userPage() {
	return "web/userpage";
    }

}
