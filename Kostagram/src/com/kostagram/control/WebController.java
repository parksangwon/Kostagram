package com.kostagram.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kostagram.service.beans.PersonVO;
import com.kostagram.service.dao.PersonDAO;

@Controller
public class WebController {
    
	@Autowired
	private PersonDAO dao;
	
	
	//��û ����
	//������ JSP������
	@RequestMapping("/hello")
	public String hello(){
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
	/*@RequestMapping(value="/person/form", method=RequestMethod.POST)
	public String form2(){
		
	}*/
	
	@RequestMapping("/person/insert")
	public String insert(PersonVO person){
	   dao.insert(person);
	   return "success";
	}
	
	@RequestMapping("/person/list")
	public String list(Model model){
	   List<PersonVO> list= dao.findAll();//�𵨷κ��� ������ ������	   
	   model.addAttribute("list",list); //��� ����	   
	   return "list";
	}
}










