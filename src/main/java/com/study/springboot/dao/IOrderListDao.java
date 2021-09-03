package com.study.springboot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.OrderListDto;

@Mapper
public interface IOrderListDao {
	public List<OrderListDto> list();
	public OrderListDto contentView(String order_list_idx);
	public int modify( String order_list_idx, String order_status, 
            				String order_item_info, String order_date );
	public int delete(String order_list_idx);
	public int write(String order_user, String order_status, String order_item_info );
	public int hit(String order_list_idx);
}
