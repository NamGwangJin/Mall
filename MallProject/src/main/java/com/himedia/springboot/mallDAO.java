package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface mallDAO {
	int signup(String id, String passcode1, String passcode2, String name,
					String birthday, String mobile, String email);
	
	mallDTO login(String id, String passcode1);
	
	void insert(String p1, String p2, String p3, String p4);
	
//	ArrayList<mallDTO> getList(String list);
	ArrayList<mallDTO> getList(int start, int psize);
	int getTotal();
	mallDTO product(String name);
	void cart(String p1, String p2, String p3, String p4, String p5);
}
