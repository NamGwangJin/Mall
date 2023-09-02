package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BbsDAO {
	ArrayList<BbsDTO> getList(int start, int psize);
	
	
	int signup(String user_id, String user_pw,  String user_name,
				String user_mobile, String user_email, String user_address);
	
	BbsDTO login(String user_id, String user_pw);
	
	
	BbsDTO view(int num);
	
	void hitUp(int num);
	
	void delPost(int num);
	
	void insPost(String title, String content, String writer, String created, String updated);
	
	void udPost(int num, String title, String content, String updated);
	
	int getTotal();
	
	void insertReply(int bbsnum, String content, String writer, String regdate);
	
	ArrayList<BbscmtDTO> getReply(int bbscmtnum);
	
	BbscmtDTO Reply(int num);
	
	void delReply(int num);
	
	void udReply(int bbscmtnum, int num, String content, String regdate);
}
