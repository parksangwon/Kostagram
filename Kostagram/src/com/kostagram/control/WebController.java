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
	
	
	//요청 매핑
	//간단한 JSP포워딩
	@RequestMapping("/hello")
	public String hello(){
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
	   List<PersonVO> list= dao.findAll();//모델로부터 데이터 얻어오기	   
	   model.addAttribute("list",list); //뷰와 공유	   
	   return "list";
	}
}










