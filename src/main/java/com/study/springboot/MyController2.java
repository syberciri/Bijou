package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MyController2 {

	@RequestMapping("/")
	public String root( RedirectAttributes redirect ) {
		
		return "redirect:member_list";
	}
	
	@RequestMapping("memberList")
	public String memberList( Model model ) {
		
		return "memberList";
	}
}
