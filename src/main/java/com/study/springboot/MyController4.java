package com.study.springboot;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.study.springboot.dao.IOne2oneDao;
import com.study.springboot.dao.IOne2oneReplyDao;
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dto.One2oneReplyDto;


@Controller
public class MyController4 {
	
	@Autowired
	private IOne2oneDao one2one_dao;
	
	@Autowired
	private IOne2oneReplyDao reply_dao;
	
	@RequestMapping("/one2one")
	public /*@ResponseBody*/ String root( RedirectAttributes redirect ) {
		
		redirect.addAttribute("page", "1");
		
		System.out.println("one2one으로 리다이렉트");
		return "redirect:one2one_list"; //list URI로 리다이렉트 시킨다.
	}

	//호출 URL : localhost:8090/one2one
	//실제호출될 페이지 "/WEB-INF/views/admin/one2one_list.jsp"가 호출됨.
	@RequestMapping( value="/one2one_list", method=RequestMethod.GET)
	public String one2one(HttpServletRequest request, Model model) {
		
		String page = request.getParameter("page");
		System.out.println( "page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size); //5, 10, 15 페이지 끝 줄번호
		
		System.out.println("startRowNum:"+startRowNum);
		System.out.println("endRowNum:"+endRowNum);
		
		//model.addAttribute("list", dao.listDao());
		model.addAttribute("list", one2one_dao.listPageDao(String.valueOf(startRowNum), String.valueOf(endRowNum)));  //최상위 10개
		
		
		System.out.println("리다이렉트 받은후 one2one_list로 model 넘김");
		return "admin/one2one_list";  //"admin/one2one_list.jsp" 페이지를 디스패치 해줌.
	}
	
	//호출 URL : localhost:8090/one2one_view
	//실제호출될 페이지 "/WEB-INF/views/admin/one2one_view.jsp"가 호출됨.
	@RequestMapping(value="/one2one_view", method=RequestMethod.GET)
	public String one2one_view(@RequestParam("one2one_idx") String one2one_idx,							  
							   Model model) {
		
		model.addAttribute("dto", one2one_dao.viewDao(one2one_idx) );
		model.addAttribute("list", reply_dao.list(one2one_idx));
		
		return "admin/one2one_view";  //"admin/one2one_view.jsp" 페이지를 디스패치 해줌.
	}
	
	@RequestMapping("/reply.do")
	public String reply( @RequestParam("one2one_reply_idx") String one2one_reply_idx,
						 @RequestParam("one2one_reply_name") String one2one_reply_name,
						 @RequestParam("one2one_reply_title") String one2one_reply_title,
						 @RequestParam("one2one_reply_content") String one2one_reply_content,
						 Model model) {
		System.out.println("reply.do 호출됨");
		
		System.out.println(one2one_reply_idx);
		System.out.println(one2one_reply_name);
		System.out.println(one2one_reply_title);
		System.out.println(one2one_reply_content);
		
		int result = reply_dao.reply(one2one_reply_idx, one2one_reply_name, one2one_reply_title, one2one_reply_content);
	    System.out.println( "result:" + result); //성공시 insert갯수(1)로 리턴함.
				
		return "redirect:one2one";
	}

	
	//@RequestMapping( value="/one2one", method=RequestMethod.GET)
	//public String one2one(Model model) {
		
	//	model.addAttribute("list", one2one_dao.list());
	//	System.out.println("리다이렉트 받은후 one2one_list로 model 넘김");
	//	return "admin/one2one_list";  //"admin/one2one_list.jsp" 페이지를 디스패치 해줌.
	//}
	
}
