package com.himedia.springboot;

public class ProductDTO {
	int prod_id;
	String prod_name; 
	String prod_price; 
	String prod_msg;
	String prod_img;
	String prod_update;
	
	public int getProd_id() {
		return prod_id;
	}
	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_msg() {
		return prod_msg;
	}
	public void setProd_msg(String prod_msg) {
		this.prod_msg = prod_msg;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public String getProd_update() {
		return prod_update;
	}
	public void setProd_update(String prod_update) {
		this.prod_update = prod_update;
	}
}
