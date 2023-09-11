package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDAO {
	void insert(String p1, String p2, String p3, String p4);
	
	ArrayList<ProductDTO> getList(int start, int psize);
	ArrayList<ProductDTO> getRegProduct(String id);
	
	int getTotal();
	
	ProductDTO product(int id);

	void insertRegProduct(String user_id, String prod_name, String prod_price, String prod_msg, String prod_img);
	void regEdit(String prod_name, String prod_price, String prod_msg, String prod_img, String beforename);
	void regDelete(String prod_name, String prod_img);

	void regEditProduct(String prod_name, String prod_price, String prod_msg, String prod_img, String before_name);

	void regDeleteProduct(String prod_name, String prod_img);
	
}
