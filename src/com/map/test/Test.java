package com.map.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.map.mapper.ImageMapper;
import com.map.pojo.Image;
import com.map.pojo.OverLay;
import com.map.service.ImageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class Test {

	@Autowired
	private ImageMapper iMapper;
	
	@org.junit.Test
	public void addImage() {
		Image image = new Image();
		System.out.println(222);
		image.setName("³¬ÊÐ");
		iMapper.insert(image);
		System.out.println(111);
	}
	@org.junit.Test
	public void selectImage() {
		Image image = iMapper.selectById(1);
		System.out.println(image.getName());
		
		for(OverLay overlay: image.getOverLays()) {
			System.out.println(overlay.getId());
		}
		/*List<Image> images = iMapper.selectAll();
		for(Image i: images) {
			System.out.println(i.getName());
		}*/
	}

}
