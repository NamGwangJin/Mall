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
	
	void insPost(String rating , String title, String content, String img, String writer, String prod_name);
	
	void udPost(int num, int rating, String title, String content, String img);
	
	int getTotal();

	int getReviewSize(String prod_name);
	int getPhotoReview(String prod_name);
	int getLike(String prod_name);
	float getRatingAvg(String prod_name);
	
	int getRating1(String prod_name);
	int getRating2(String prod_name);
	int getRating3(String prod_name);
	int getRating4(String prod_name);
	int getRating5(String prod_name);
	
	ArrayList<ReviewDTO> orderByRating(int start, int psize, String prod_name);
	ArrayList<ReviewDTO> orderByDate(int start, int psize, String prod_name);
	ArrayList<ReviewDTO> orderByPhoto(int start, int psize, String prod_name, String ob);
	ArrayList<ReviewDTO> reviewSearch(int start, int psize, String prod_name, String keyword);
}

