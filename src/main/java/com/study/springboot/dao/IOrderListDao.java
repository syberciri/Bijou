package com.study.springboot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.OrderListDto;

@Mapper
public interface IOrderListDao {
	public List<OrderListDto> list();
	public OrderListDto contentView(String order_list_idx);
	public int updateOrderList(String order_list_idx, String order_status);
}
