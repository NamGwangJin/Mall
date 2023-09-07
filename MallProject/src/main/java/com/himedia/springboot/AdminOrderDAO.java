package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminOrderDAO {
	int adminEndOrder(int order_num);
	
	
	int addCart(String userid, int prod_id, int qty, int price);
	int deleteItem(String user_id, int prod_id);
	void dropCart(String user_id);
	int checkCart(int prod_id);
	int otherCart(String user_id);
	void cartUpdate(String user_id, int qty, int total, int prod_id);
	
	ArrayList<CartDTO> getCart(String id);
	CartDTO getChoiceCart(String id, int prod_id);
	
	String getName(String id);
	
	int order(String name, String mobile, String img, String prodName, int qty, int total, String address, String payment, String id);

	ArrayList<OrderDTO> getOrder();


	int adminOrderCancel(int order_num);


	ArrayList<AdminOrderDTO> getOrderCancelList();
	


	ArrayList<AdminOrderDTO> getorderdelay();


	ArrayList<AdminOrderDTO> cancelplease();


	ArrayList<AdminOrderDTO> orderreturn();


	ArrayList<AdminOrderDTO> reviewEnd();


	ArrayList<AdminOrderDTO> ordersuccess();


	ArrayList<AdminOrderDTO> selectedValue(String selectedValue);


	ArrayList<AdminOrderDTO> getuserlist();


	void userDeleteProduct(String user_id);
}
