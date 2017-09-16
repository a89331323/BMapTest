package com.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.map.pojo.Image;
import com.map.service.ImageService;

@Controller
public class ImageController {

	@Autowired
	private ImageService iService;
	
	@RequestMapping("listImages")
	public @ResponseBody List<Image> listImages(){
		List<Image> is = iService.list();
		return is;
	}
	
}
