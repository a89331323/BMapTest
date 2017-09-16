package com.map.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.map.mapper.ImageMapper;
import com.map.page.Page;
import com.map.pojo.Image;
import com.map.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService{

	@Autowired
	private ImageMapper imgMapper;
	
	@Override
	public List<Image> list() {
		return imgMapper.selectAll();
	}

	@Override
	public int total() {
		return imgMapper.getTotal();
	}

	@Override
	public List<Image> list(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(Image image) {
		imgMapper.insert(image);
	}

	@Override
	public void update(Image image) {
		// TODO Auto-generated method stub
		imgMapper.update(image);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		imgMapper.deleteById(id);
	}

	@Override
	public Image get(int id) {
		return imgMapper.selectById(id);
	}
	
	
	
}
