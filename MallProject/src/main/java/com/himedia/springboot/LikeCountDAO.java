package com.himedia.springboot;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeCountDAO {

    void decreaseLikeCount(int num, String user_id);
    int getLikeCountByTitle(int num);
	void increaseLikeCount(int num, String user_id);
	
	int likecheck(String user_id, int num);
	

}
