package com.kostagram.control;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.kostagram.service.dao.UserInfoDAO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


@Controller
public class WebController {
	HttpSession session;
	/*@Autowired
	private UserInfoDAO dao;
	*/
	
	//요청 매핑
	//간단한 JSP포워딩
	
	@RequestMapping("/hello")
	public String hello(){
	   return "web/timeline";
	}
	
	@RequestMapping("/index") //메인페이지
	public String index(){
	   return "web/index";
	}
	
	@RequestMapping("/pwforget") //비밀번호재설정 페이지
	public String pwforget(){
	   return "web/pwforget";
	}
	
	@RequestMapping("/searchresult") //검색결과 페이지
	public String searchresult(){
	   return "web/searchresult";
	}
	
	@RequestMapping("/userpage") //회원페이지
	public String userpage(){
	   return "web/userpage";
	}
	
	@RequestMapping("/timeline") //timeline 페이지
	public String timeline(){
	   return "web/timeline";
	}
	
	
	@RequestMapping("/hello2")
	public String hello2(Model model){
	   //model.addAttribute(String key, Object data);
		//model: 영역객체중 request와 같은 의미
		model.addAttribute("k1", "안녕, 겨울~!!");
	   return "hi2";	
	}
	
	
	@RequestMapping(value="/person/form", method=RequestMethod.GET)
	public String form(){
	  return "form";
	}
	
	/*@RequestMapping("/accounts/password/change/")
	public String pwChange(HttpServletRequest request, Model model)
	{
		if(request.getMethod().equals("POST") && request.getAttribute("id_old_password")!=null)
		{
			int check = userinfodao.pwCheck(request.getAttribute("id_old_password"));
			String message;
			if(check>0)
			{
				check = userinfodao.pwUpdate(request.getAttribute("new_password1"));
				if(check>0)
				{
					message = "정상적으로 비밀번호를 수정하였습니다.";
				}
				else
				{
					message = "비밀번호 수정중 오류가 발생 하였습니다.";
				}
				
			}
			else
			{
				message="비밀번호가 일치하지 않습니다.";
			}
			model.addAttribute("message", message);
		}
		
		
		return "pwupdate";
	}*/
	/*@RequestMapping(value="/accounts/profileupdate/")
	public String profileEdit(UserInfoVO vo, HttpSession session, HttpServletRequest reqeuest, Model model)
	{
		String method = reqeuest.getMethod();
		if(method.equals("POST"))
		{
			int i = userInfoDAO.update(vo);
			if(i>0)
			{
				model.addAttribute("message", "성공적으로 업데이트 되었습니다.");
			}
			else
			{
				model.addAttribute("message", "업데이트하는 도중 에러가 발생하였습니다.");
			}
		}
		String nickname = (String) session.getAttribute("nickname");
		List<UserInfoVO> userinfo= userInfoDAO.finduser(nickname);
		model.addAttribute("userinfo", userinfo);
		
		return "profileupdate";
	}*/
	
	/*@RequestMapping(value="/person/form", method=RequestMethod.POST)
	public String form2(){
		
	}*/
	/*
	/*@RequestMapping("/person/insert")
	public String insert(PersonVO person){
	   dao.insert(person);
	   return "success";
	}
	
	@RequestMapping("/person/list")
	public String list(Model model){
	   List<PersonVO> list= dao.findAll();//모델로부터 데이터 얻어오기	   
	   model.addAttribute("list",list); //뷰와 공유	   
	   return "list";
	}*/
}










