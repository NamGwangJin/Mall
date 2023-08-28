package com.himedia.springboot;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private CartDAO cDao;
	
	@GetMapping("/cartList")
	public String cartList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<CartDTO> cList = cDao.getCart(id);
		if(cList.size() == 0) {
			session.setAttribute("cList", "없음");
			return "cart/cartList";
		}
		session.setAttribute("cList", cList);
		return "cart/cartList";
	}
	
	@PostMapping("/cart")
	@ResponseBody
	public String goCart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("id");
		int prodId=Integer.parseInt(req.getParameter("prodId"));
		int qty=Integer.parseInt(req.getParameter("qty"));
		int totalPrice=Integer.parseInt(req.getParameter("totalPrice"));

		int data = cDao.addCart(userId, prodId, qty, totalPrice);
		
		System.out.println(data);
		return String.valueOf(data);
	}
	
	@PostMapping("/deleteCartItem")
	@ResponseBody
	public String delCartItem(HttpServletRequest req) {
		int prodId = Integer.parseInt(req.getParameter("prod_id"));
		String userId = req.getParameter("user_id");
		int data = cDao.deleteItem(userId, prodId);
		
		return String.valueOf(data);
	}
	
	@PostMapping("/dropCart")
	@ResponseBody
	public String dropCart(HttpServletRequest req) {
		String user_id = req.getParameter("user_id");
		cDao.dropCart(user_id);
		
		return "/cartList";
	}
	
	@GetMapping("/buy")
	public String gobuy(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("user_id");
		String prod_name = req.getParameter("prod_name");
		int prod_id = Integer.parseInt(req.getParameter("prod_id"));
		int qty = Integer.parseInt(req.getParameter("qty"));
		int price = Integer.parseInt(req.getParameter("price"));
		int total = Integer.parseInt(req.getParameter("total"));
		String img = req.getParameter("img");
		
		cDao.addCart(user_id, prod_id, qty, total);
		
		model.addAttribute("prod_id",prod_id);
		model.addAttribute("prod_name",prod_name);
		model.addAttribute("qty",qty);
		model.addAttribute("price",price);
		model.addAttribute("total",total);
		model.addAttribute("img",img);
		return "order/buy";
	}
	
	@GetMapping("/listbuy")
	public String listBuy(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("user_id");
		String prod_id = req.getParameter("prod_id");
		String[] prodList = prod_id.split("");
		ArrayList<CartDTO> cList = new ArrayList<CartDTO>();
		for(int i = 0; i<prodList.length; i++) {
			cList.add(cDao.getChoiceCart(user_id, Integer.parseInt(prodList[i])));
		}
		model.addAttribute("cList",cList);
		model.addAttribute("size",cList.size());
		return "cart/listbuy";
	}
	
	@GetMapping("/listorder")
	public String listorder(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String name = req.getParameter("orderer");
		String mobile = req.getParameter("hp");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String address = zip + " " + addr1 + " " + addr2;
		String payment = req.getParameter("payment");
				
		String prod_id = req.getParameter("prod_id");
		String[] prodList = prod_id.split("");
		
		String prod_img = req.getParameter("prod_img");
		String[] imgList = prod_img.split(","); 
		
		String prod_name = req.getParameter("prod_name");
		String[] nameList = prod_name.split(",");
		
		String prod_qty = req.getParameter("prod_qty");
		String[] qtyList = prod_qty.split(",");
		
		String prod_total = req.getParameter("prod_total");
		String[] totalList = prod_total.split(",");
		
		for(int i = 0 ; i < prodList.length ; i++) {
			cDao.order(name, mobile, imgList[i], nameList[i], 
							Integer.parseInt(qtyList[i]), Integer.parseInt(totalList[i]), 
							address, payment, id);
			cDao.deleteItem(id, Integer.parseInt(prodList[i]));
		}
		
		return "redirect:/orderList";
	}
	
	@PostMapping("/order")
	public String order(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int prodid = Integer.parseInt(req.getParameter("prodid"));
		String name = req.getParameter("orderer");
		String img = req.getParameter("img");
		String prodName = req.getParameter("prodName");
		String mobile = req.getParameter("hp");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int total = Integer.parseInt(req.getParameter("total"));
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String address = zip + " " + addr1 + " " + addr2;
		String payment = req.getParameter("payment");
		
		cDao.deleteItem(id, prodid);
		cDao.order(name, mobile, img, prodName, qty, total, address, payment, id);
		
		return "redirect:/orderList";
	}
	
	@GetMapping("/orderList")
	public String orderList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
			return "redirect:/gologin";
		}
		ArrayList<OrderDTO> oList = cDao.getOrder(id);
		if (oList.size() == 0) {
			model.addAttribute("oList","없음");
			return "order/orderList";
		}
		model.addAttribute("oList",oList);
		return "order/orderList";
	}
	
}