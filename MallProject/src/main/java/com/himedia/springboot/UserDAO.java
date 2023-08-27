package com.himedia.springboot;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	int signup(String id, String passcode1,  String name,
			String mobile, String email, String address, String bd);

	int login(String id, String passcode1);

	UserDTO loginOk(String id);
	
	UserDTO getpage(String p1);
	
	void quit(String id);
}
