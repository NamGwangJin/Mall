package com.himedia.springboot;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	int idCheck(String id);
	
	int signup(String id, String passcode1,  String name,
			String mobile, String email, String address, String bd);

	int login(String id, String passcode1);

	UserDTO loginOk(String id);
	
	UserDTO getpage(String p1);
	
	void quit(String id);
	
	UserDTO getprof(String p1);
	
	UserDTO sameUser(String id);
	
	UserDTO getdel(String p1);
	
	UserDTO getcou(String p1);
	
	int getPoint(String id);
	int usePoint(String id, int point);
	void savePoint(String id, int point);
}
