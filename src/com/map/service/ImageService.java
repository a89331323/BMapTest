package com.map.service;

import java.util.List;

import com.map.page.Page;
import com.map.pojo.Image;

public interface ImageService {

	List<Image> list();
	int total();
	List<Image> list(Page page);
	void add(Image image);
	void update(Image image);
	void delete(int id);
	Image get(int id);
	
}
