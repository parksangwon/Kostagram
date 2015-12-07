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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.SearchVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.SearchDAO;
import com.kostagram.service.dao.UserInfoDAO;

@Controller
public class WebController {

    @Autowired
    private UserInfoDAO userInfoDao;
    @Autowired private PhotoInfoDAO photoInfoDao;
    @Autowired private SearchDAO searchDao;

    @RequestMapping("/")
    public String goToMainPage(HttpSession session, Model model) {
	// 로그인 세션 확인 후 로그인이 안되어 있으면 로그인 페이지
	if (session == null || session.getAttribute("loginYn") == null || session.getAttribute("loginYn").equals("N")
		|| session.getAttribute("email") == null) {
	    return "web/index";
	}
	
	// test code 
		System.out.println("-- WebController call / --");
		System.out.println("session(email) : " + session.getAttribute("email"));
	//
		
		
	String email = (String) session.getAttribute("email");
	List<PhotoInfoVO> timeline = photoInfoDao.getTimeline(new UserInfoVO(email));
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
	
	if (user == null || user.getNickname() == null || user.getPass() == null ) {
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
	    session.setAttribute("email", findedUser.getEmail());
	    session.setAttribute("nickname", findedUser.getNickname());
	    out.print("loginSuccess");
	} else {
	    out.print("loginFail");
	}
	System.out.println("login 끝");
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
	UserInfoVO userinfo = userInfoDao.findNickname(new UserInfoVO(nickname));
	model.addAttribute("userinfo", userinfo);

	return "profileupdate";
    }

    @RequestMapping("/searchWordAutoComplete/")
    public void searchWord(SearchVO searchVO, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
    	System.out.println(searchVO.getMessage());
    	
    	List<SearchVO> list = searchDao.select(searchVO);
    	
    	System.out.println(list.size());
    	if (list.size() > 0)
		{
    		response.setCharacterEncoding("utf-8");
    		
			PrintWriter out = response.getWriter();
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			out.println("<WORDSLIST>");

			for(int i=0; i<list.size(); i++)
			{
				searchVO = (SearchVO)list.get(i);
				String word = searchVO.getWord();
				String count = searchVO.getCount();
				out.println("<WORD>");
				out.println("<NAME>" + word + "</NAME>");
				out.println("<COUNT>" + count + "</COUNT>");
				out.println("</WORD>");
			}
			out.println("</WORDSLIST>");
			out.close();
		}
		else
		{
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
    
    
    @RequestMapping(value = "/profileupdate")
    public String profileupdate() {
	return "common/profileupdate";
    }
   
    
    @RequestMapping(value = "/pwupdate")
    public String pwupdate() {
	return "common/pwupdate";
    }
    

    @RequestMapping(value = "/{nickname}")
    public String userPage(@PathVariable String nickname) {
	// DAO에서 {name}에 해당하는 자료를 갖고오고
	// model에 addAttr--
	return "web/userpage";
    }

    @RequestMapping(value = "/userpage")
    public String userPage() {
	return "web/userpage";
    }
    
}
