package com.map.pojo;

import java.util.List;

public class Image {
	private int id;
	private String name;
	private List<OverLay> overLays;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<OverLay> getOverLays() {
		return overLays;
	}
	public void setOverLays(List<OverLay> overLays) {
		this.overLays = overLays;
	}
}
