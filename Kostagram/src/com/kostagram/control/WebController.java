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
	
	//��û ����
	//������ JSP������
	
	@RequestMapping("/hello")
	public String hello(){
	   return "web/timeline";
	}
	
	@RequestMapping("/index") //����������
	public String index(){
	   return "web/index";
	}
	
	@RequestMapping("/pwforget") //��й�ȣ�缳�� ������
	public String pwforget(){
	   return "web/pwforget";
	}
	
	@RequestMapping("/searchresult") //�˻���� ������
	public String searchresult(){
	   return "web/searchresult";
	}
	
	@RequestMapping("/userpage") //ȸ��������
	public String userpage(){
	   return "web/userpage";
	}
	
	@RequestMapping("/timeline") //timeline ������
	public String timeline(){
	   return "web/timeline";
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
					message = "���������� ��й�ȣ�� �����Ͽ����ϴ�.";
				}
				else
				{
					message = "��й�ȣ ������ ������ �߻� �Ͽ����ϴ�.";
				}
				
			}
			else
			{
				message="��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
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
				model.addAttribute("message", "���������� ������Ʈ �Ǿ����ϴ�.");
			}
			else
			{
				model.addAttribute("message", "������Ʈ�ϴ� ���� ������ �߻��Ͽ����ϴ�.");
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
	   List<PersonVO> list= dao.findAll();//�𵨷κ��� ������ ������	   
	   model.addAttribute("list",list); //��� ����	   
	   return "list";
	}*/
}










