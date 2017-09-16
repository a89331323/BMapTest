package com.map.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.map.pojo.Image;

@Repository
public interface ImageMapper {
	
	void insert(Image image);
	void deleteById(int id);
	void update(Image image);
	Image selectById(int id);
	List<Image> selectAll();
	int getTotal();
}
