package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController5 {
	//호출 url : local=host:8090/order_list
	//실제호출될 페이지 : "/WEB_INF/views/admin/order_list.jsp"가 호출됨.
	
	@RequestMapping("order_list")
	public String order_list() {
		return"admin/order_list"; //"admin/order_list.jsp"페이지를 디스패치 해줌.
	}
	
	@RequestMapping("updateOrderList")
	public String updateOrderList(){
		return"admin/updateOrderList"; //"admin/order_list.jsp"페이지를 디스패치 해줌.
	}
	
}
