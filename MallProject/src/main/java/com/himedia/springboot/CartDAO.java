package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartDAO {
	int addCart(String userid, int prod_id, int qty, int price);
	int deleteItem(String user_id, int prod_id);
	void dropCart(String user_id);
	int checkCart(int prod_id, String user_id);
	int otherCart(String user_id);
	void plusCart(String user_id, int qty, int total, int prod_id);
	void cartUpdate(String user_id, int qty, int total, int prod_id);
	
	ArrayList<CartDTO> getCart(String id);
	CartDTO getChoiceCart(String id, int prod_id);
	
	String getName(String id);
	
	int order(String name, String mobile, String img, String prod_name, int prod_id, int qty, int total, String address, String payment, String id);
	ArrayList<OrderDTO> getOrder(String id);
	ArrayList<OrderDTO> getOrderList(String id, String order_time);
	ArrayList<OrderDTO> getDate(String id);
	
	String getState(int orderNum);
	void updateState(int orderNum, String state);
	
	ProductDTO getProduct(int prod_id);
}
