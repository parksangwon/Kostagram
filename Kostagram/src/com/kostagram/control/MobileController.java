package com.kostagram.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.UserInfoDAO;

@Controller
@RequestMapping("/m")
public class MobileController {
    
	@Autowired
	private UserInfoDAO userInfoDao;
	
	
	//��û ����
	//������ JSP������
	@RequestMapping("/hello")
	public String hello(){
	   return "mobile/timeline";
	}
	
	@RequestMapping("/hello2")
	public String hello2(Model model){
	   //model.addAttribute(String key, Object data);
		//model: ������ü�� request�� ���� �ǹ�
		model.addAttribute("k1", "�ȳ�, �ܿ�~!!");
	   return "hi2";	
	}
	
	
	@RequestMapping(value="/person/form", method=RequestMethod.GET)
	public String form(){
	  return "form";
	}
	/*@RequestMapping(value="/person/form", method=RequestMethod.POST)
	public String form2(){
		
	}*/
	
	
	@RequestMapping("/login")
	public String login(){
	   return "mobile/login";
	}
	
	@RequestMapping("/emailcheck")
	public String emailcheck(){
		//System.out.println("emailcheck");
	   return "mobile/emailcheck";
	}
	
	@RequestMapping("/usercheck")
	public String usercheck(HttpServletRequest request, Model model ){
		//System.out.println("usercheck");
		String id = (String)request.getParameter("id");
		System.out.println("aa");
		/*String name = (String)request.getParameter("name");
		String nickname = (String)request.getParameter("nickname");
		String pw = (String)request.getParameter("pw");
		
		System.out.println("id="+ id + " name="+name+ " nickname="+nickname+ " pw="+pw);*/
		model.addAttribute("id", id);
	   return "mobile/usercheck";
	}
	
	@RequestMapping("/userpage")
	public String userpage(){
	   return "mobile/userpage";
	}
	
	@RequestMapping("/search")
	public String search(){
	   return "mobile/search";
	}
	
	@RequestMapping("/findfriend")
	public String findfriend(HttpServletRequest request, UserInfoVO user){
		/*String id = (String)request.getParameter("id");
		String name = (String)request.getParameter("name");
		String nickname = (String)request.getParameter("nickname");
		String pass = (String)request.getParameter("pass");
		*/
		boolean result = userInfoDao.insert(user);
		if (result) {
			
		} else {
			
		}
		//System.out.println("id="+ id + " name="+name+ " nickname="+nickname+ " pw="+pw);
	   return "mobile/findfriend";
	}
	
	@RequestMapping("/numbersearch")
	public String numbersearch(){
	   return "mobile/numbersearch";
	}
	
	@RequestMapping("/profileupdate")
	public String profileupdate(){
	   return "mobile/profileupdate";
	}
	
	@RequestMapping("/option")
	public String option(){
	   return "mobile/option";
	}
	
	@RequestMapping("/findphonenumber")
	public String findphonenumber(){
	   return "mobile/findphonenumber";
	}
	
	@RequestMapping("/round")
	public String round(){
	   return "mobile/round";
	}
	
	@RequestMapping("/detail")
	public String detail(){
	   return "mobile/detail";
	}
}










