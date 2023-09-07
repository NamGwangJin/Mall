package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BbsDAO {

	
	ArrayList<BbsDTO> getList(int start, int psize);
	
	BbsDTO view(int num);
	
	void hitUp(int num);
	
	void delPost(int num);
	
	void insPost(String title, String content, String writer, String created, String updated, String bbs_img);
	
	void udPost(int num, String title, String content, String updated, String bbs_img);
	
	int getTotal();
	
	
	 void insertReply(int bbsnum, String content, String writer, String regdate);
	 
	 ArrayList<BbscmtDTO> getReply(int bbscmtnum);
	 
	 BbscmtDTO Reply(int num);
	 
	 void delReply(int num);
	 
	 void udReply(int num, String content);
	 
}
