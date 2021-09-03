package com.study.springboot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.One2oneDto;




@Mapper
public interface IOne2oneDao {
	List<One2oneDto> list();

	List<One2oneDto> listPageDao(String start, String end);

	One2oneDto viewDao(String one2one_idx);
}

