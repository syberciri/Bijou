package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderListDto;

@Mapper
public interface IOrderListDao {
	public List<OrderListDto> OrderList();
	public OrderListDto OrderListView(String order_list_idx);
	public int deleteOrderList(String order_list_idx);
	
	public List<OrderListDto> MyOrderList(String order_user_id);
	public OrderListDto MyOrderInfo(String order_number);
	
}
