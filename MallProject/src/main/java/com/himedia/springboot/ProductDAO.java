package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDAO {
	void insert(String p1, String p2, String p3, String p4);
	
	ArrayList<ProductDTO> getList(int start, int psize);
	
	int getTotal();
	
	ProductDTO product(String name);
}
