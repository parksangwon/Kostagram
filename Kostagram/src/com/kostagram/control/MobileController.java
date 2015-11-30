package com.kostagram.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/m")
public class MobileController {
    /*
	@Autowired
	private PersonDAO dao;
	*/
	
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
	   return "mobile/emailcheck";
	}
	
	@RequestMapping("/usercheck")
	public String usercheck(){
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
	
	@RequestMapping("/profileupdate")
	public String profileupdate(){
	   return "mobile/profileupdate";
	}
	
	@RequestMapping("/findfriend")
	public String findfriend(){
	   return "mobile/findfriend";
	}
	
	@RequestMapping("/numbersearch")
	public String numbersearch(){
	   return "mobile/numbersearch";
	}
}










