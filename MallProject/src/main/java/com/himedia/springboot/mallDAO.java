package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface mallDAO {
	int signup(String id, String passcode1,  String name,
					String mobile, String email, String address);
	
	int login(String id, String passcode1);
	mallDTO loginOk(String id);
	
	void insert(String p1, String p2, String p3, String p4);
	
	ArrayList<mallDTO> getList(int start, int psize);
	int getTotal();
	mallDTO product(String name);
	
	mallDTO getpage(String p1);
	void quit(String id);
}
