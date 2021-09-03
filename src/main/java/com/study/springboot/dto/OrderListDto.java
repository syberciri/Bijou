package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListDto {
	
	private int order_list_idx;
	private int order_number;
	private String order_user;
	private String order_item_info;
	private String order_status;
	private Date order_date;

	
	public OrderListDto() {
		
	}

	public OrderListDto(int order_list_idx, int order_number, String order_item_info, 
			String order_user, Date order_date, String order_status) 
	{
		super();
		this.order_list_idx = order_list_idx;
		this.order_number = order_number;
		this.order_user = order_user;
		this.order_item_info = order_item_info;
		this.order_date = order_date;
		this.order_status = order_status;
	}
}
