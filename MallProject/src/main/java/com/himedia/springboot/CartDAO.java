package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartDAO {
	int cart(String userid, int prod_id, int qty, int price);
	int deleteItem(String user_id, int prod_id);
	void dropCart(String user_id);
	
	ArrayList<CartDTO> getCart(String id);
	CartDTO getChoiceCart(String id, int prod_id);
	
	String getName(String id);
	
	int order(String name, String mobile, String img, String prodName, int qty, int total, String address, String payment, String id);

	ArrayList<OrderDTO> getOrder(String id);
}
