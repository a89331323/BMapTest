package com.map.service;

import java.util.List;

import com.map.page.Page;
import com.map.pojo.OverLay;


public interface OverLayService {
	List<OverLay> list();
	int total();
	List<OverLay> list(Page page);
	void add(OverLay overLay);
	void update(OverLay overLay);
	void delete(int id);
	OverLay get(int id);
}
