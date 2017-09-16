package com.map.mapper;

import java.util.List;

import com.map.pojo.OverLay;

public interface OverLayMapper {

	int deleteById(int id);

    int insert(OverLay overLay);

    int insertSelective(OverLay overLay);

    OverLay selectById(int id);

    int update(OverLay overLay);
	
    List<OverLay> selectAll();

	int getTotal();
}
