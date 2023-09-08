package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionDAO {
	
	ArrayList<QuestionDTO> getList(int start, int psize);
	
	QuestionDTO view(int num);
	
	void hitUp(int num);
	
	void delPost(int num);
	
	void insPost(String title, String content, String writer, String created, String updated);
	
	void udPost(int num, String title, String content, String updated);
	
	int getTotal();
	
	void insertReply(int quenum, String content, String writer, String quedate);
	 
	 ArrayList<QuestioncmtDTO> getReply(int quecmtnum);
	 
	 QuestioncmtDTO Reply(int num);
	 
	 void delReply(int num);
	 
	 void udReply(int num, String content);
}
