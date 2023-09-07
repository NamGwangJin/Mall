package com.himedia.springboot;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeCountDAO {

    void decreaseLikeCount(String title, String user_id);
    int getLikeCountByTitle(String title);
	void increaseLikeCount(String title, String user_id);
	
	int likecheck(String user_id, String title);
	

}
