package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	int signup(String id, String passcode1,  String name,
					String mobile, String email, String address);
	
	ReviewDTO login(String id, String passcode1);
	
	ArrayList<ReviewDTO> getList(int start, int psize, String prod_name);
	
	ReviewDTO view(int num);
	
	void hitUp(int num);
	
	void delPost(int num);
	
	void insPost(String rating , String title, String content, String img, String writer, String created, String updated, String prod_name);
	
	void udPost(int num, int rating, String title, String content, String img, String updated);
	
	int getTotal();

	
}

