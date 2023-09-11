package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	int signup(String id, String passcode1,  String name,
					String mobile, String email, String address);
	
	ReviewDTO login(String id, String passcode1);
	
	ArrayList<ReviewDTO> getList(int start, int psize, int prod_id);
	
	ReviewDTO view(int num);
	
	void hitUp(int num);
	
	void delPost(int num);
	
	void insPost(String rating , String title, String content, String img, String writer, int prod_id, int order_num);
	
	void udPost(int num, int rating, String title, String content, String img);
	
	int getTotal();

	int getReviewSize(int prod_id);
	int getPhotoReview(int prod_id);
	int getLike(int prod_id);
	float getRatingAvg(int prod_id);
	
	int getRating1(int prod_id);
	int getRating2(int prod_id);
	int getRating3(int prod_id);
	int getRating4(int prod_id);
	int getRating5(int prod_id);
	
	ArrayList<ReviewDTO> orderByRating(int start, int psize, int prod_id);
	ArrayList<ReviewDTO> orderByDate(int start, int psize, int prod_id);
	ArrayList<ReviewDTO> orderByPhoto(int start, int psize, int prod_id, String ob);
	ArrayList<ReviewDTO> reviewSearch(int start, int psize, int prod_id, String keyword);
}

