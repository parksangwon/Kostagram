package com.kostagram.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.UserInfoDAO;

@Controller
public class WebController {

    @Autowired
    private UserInfoDAO userInfoDao;
    private PhotoInfoDAO photoInfoDao;

    @RequestMapping("/")
    public String goToMainPage(HttpSession session, Model model) {
	// 로그인 세션 확인 후 로그인이 안되어 있으면 로그인 페이지
	if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
		|| session.getAttribute("id") == null) {
	    return "web/index";
	}

	List<PhotoInfoVO> timeline = photoInfoDao.getTimeline((String) session.getAttribute("id"));

	model.addAttribute("timeline", timeline);
	return "web/timeline";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest req, Model model) {

	// 파라미터 값 validation 후
	if ( req == null || req.getParameter("username") == null || req.getParameter("password") == null ) {
	    model.addAttribute("result", false);
	}
	
	String nickname = (String)req.getParameter("username");
	String password = (String)req.getParameter("password");
	
	// userInfoDao 로 정보가 있는지 확인
	UserInfoVO user = userInfoDao.findUser(nickname);
	
	if ( user != null && user.getPass().equals(password)) {
	    // 로그인 성공
	    return "web/timeline";
	}
	
	model.addAttribute("result", false);
	return "web/index";
    }

    @RequestMapping("/accounts/password/change/")
    public String pwChange(HttpServletRequest request, Model model) {
	if (request.getMethod().equals("POST") && request.getAttribute("id_old_password") != null) {
	    boolean check = userInfoDao.pwCheck((String) request.getAttribute("id_old_password"));
	    String message;
	    if (check) {
		check = userInfoDao.pwUpdate((String) request.getAttribute("new_password1"));
		if (check) {
		    message = "정상적으로 비밀번호를 수정하였습니다.";
		} else {
		    message = "비밀번호 수정중 오류가 발생 하였습니다.";
		}

	    } else {
		message = "비밀번호가 일치하지 않습니다.";
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
		model.addAttribute("message", "성공적으로 업데이트 되었습니다.");
	    } else {
		model.addAttribute("message", "업데이트하는 도중 에러가 발생하였습니다.");
	    }
	}
	String nickname = (String) session.getAttribute("nickname");
	UserInfoVO userinfo = userInfoDao.findUser(nickname);
	model.addAttribute("userinfo", userinfo);

	return "profileupdate";
    }

}
