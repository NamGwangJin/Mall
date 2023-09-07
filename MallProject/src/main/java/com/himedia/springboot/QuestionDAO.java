package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionDAO {
	
	
	ArrayList<QuestionDTO> getList(int start, int psize);
	
	QuestionDTO view(int num);
	
	void hitUp(int num);
	
	void delPost(int num);
	
	void insPost(String title, String content, String writer, String created, String updated, String question_img);
	
	void udPost(int num, String title, String content, String updated, String question_img);
	
	int getTotal();
	
}
