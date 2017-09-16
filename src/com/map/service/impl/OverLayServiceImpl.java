package com.map.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.map.mapper.OverLayMapper;
import com.map.page.Page;
import com.map.pojo.OverLay;
import com.map.service.OverLayService;

@Service
public class OverLayServiceImpl implements OverLayService {

	@Autowired
	private OverLayMapper oMapper;
	
	@Override
	public List<OverLay> list() {
		// TODO Auto-generated method stub
		return oMapper.selectAll();
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return oMapper.getTotal();
	}

	@Override
	public List<OverLay> list(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(OverLay overLay) {
		// TODO Auto-generated method stub
		oMapper.insert(overLay);
	}

	@Override
	public void update(OverLay overLay) {
		// TODO Auto-generated method stub
		oMapper.update(overLay);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		oMapper.deleteById(id);
	}

	@Override
	public OverLay get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
