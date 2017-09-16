package com.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.map.pojo.OverLay;
import com.map.service.OverLayService;

@Controller
public class OverLayController {

	@Autowired
	private OverLayService oService;
	
	@RequestMapping("addOverLay")
	public @ResponseBody String addOverLay(OverLay overLay) {
		oService.add(overLay);
		return "ok";
	}
	
	@RequestMapping("listOverLay")
	public @ResponseBody List<OverLay> listOverLay(){
		List<OverLay> os = oService.list();
		return os;
	}
}
