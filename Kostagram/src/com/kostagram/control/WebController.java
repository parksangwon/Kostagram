package com.kostagram.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.UserInfoDAO;

@Controller
public class WebController {

    @Autowired
    private UserInfoDAO userInfoDao;

    @RequestMapping("/")
    public String goToMainPage(HttpSession session) {
	if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")) {
	    return "web/index";
	}
	return "web/timeline";
    }

    @RequestMapping("/accounts/password/change/")
    public String pwChange(HttpServletRequest request, Model model) {
	if (request.getMethod().equals("POST") && request.getAttribute("id_old_password") != null) {
	    int check = userInfoDao.pwCheck(request.getAttribute("id_old_password"));
	    String message;
	    if (check > 0) {
		check = userInfoDao.pwUpdate(request.getAttribute("new_password1"));
		if (check > 0) {
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
	    int i = userInfoDao.update(vo);
	    if (i > 0) {
		model.addAttribute("message", "���������� ������Ʈ �Ǿ����ϴ�.");
	    } else {
		model.addAttribute("message", "������Ʈ�ϴ� ���� ������ �߻��Ͽ����ϴ�.");
	    }
	}
	String nickname = (String) session.getAttribute("nickname");
	List<UserInfoVO> userinfo = userInfoDao.findUser(nickname);
	model.addAttribute("userinfo", userinfo);

	return "profileupdate";
    }

}
