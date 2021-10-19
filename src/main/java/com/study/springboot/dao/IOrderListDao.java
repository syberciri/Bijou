package com.study.springboot.dao;

import java.util.List;
<<<<<<< HEAD

import org.apache.ibatis.annotations.Mapper;

=======
import org.apache.ibatis.annotations.Mapper;
>>>>>>> db71145a7dc7060e80cd70eddca983ed27b30357
import com.study.springboot.dto.OrderListDto;

@Mapper
public interface IOrderListDao {
<<<<<<< HEAD
	public List<OrderListDto> OrderList();
	public OrderListDto OrderListView(String order_list_idx);
	public int deleteOrderList(String order_list_idx);
	
	public List<OrderListDto> MyOrderList(String order_user_id);
	public OrderListDto MyOrderInfo(String order_number);
	
=======
	public List<OrderListDto> list();
	public OrderListDto contentView(String order_list_idx);
	public int updateOrderList(String order_list_idx, String order_status);
>>>>>>> db71145a7dc7060e80cd70eddca983ed27b30357
}
