package com.himedia.springboot;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.springboot.ProductController.AbstractUserController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
public class AdminOrderController {
	@Autowired
	private AdminOrderDAO adoDao;
	
	@Autowired
	private ProductDAO pDao;
	//전체주문상태보기
	
	@GetMapping("/rtest")
	public String rtest(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
	

		return "/product/regtest";
	}
	
	@GetMapping("/goreglist")
	public String goreglist(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<ProductDTO> rList = pDao.getRegProduct(id);
		session.setAttribute("rList", rList);

		return "/admin/regProductList";
	}
	
	@GetMapping("/adminOrder")
	public String orderList(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
	
		ArrayList<OrderDTO> oList = adoDao.getOrder();
		if (oList.size() == 0) {
			model.addAttribute("oList","없음");
			return "admin/adminOrder";
		}
		model.addAttribute("oList",oList);

		return "admin/adminOrder";
	}
	
	
	
	@PostMapping("/adminEndOrder")
	@ResponseBody
	public String adminEndOrder(@RequestParam("order_num") int order_num) {

	    adoDao.adminEndOrder(order_num);
	   int resultval = adoDao.adminEndOrder(order_num);
	
	    
	    return String.valueOf("success"); 
	}


	@GetMapping("/adminOrderCancelList")
	public String adminOrderCancelList(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
	
		ArrayList<AdminOrderDTO> oList = adoDao.getOrderCancelList();
		if (oList.size() == 0) {
			model.addAttribute("oList","없음");
			return "admin/adminOrderCancelList";
		}
		model.addAttribute("oList",oList);
	
		return "admin/adminOrderCancelList";
	}
	
	@PostMapping("/adminOrderCancel")
	@ResponseBody
	public String adminOrderCancel(@RequestParam("order_num") int order_num) {

	    adoDao.adminOrderCancel(order_num);
	   int resultval = adoDao.adminOrderCancel(order_num);
	
	    
	    return String.valueOf("success"); 
	}
	
	@PostMapping("/deliverstates")
	@ResponseBody
	public String deliverstates(@RequestParam("selectedValue") String selectedValue, Model model) {
		
		
	    ArrayList<AdminOrderDTO> oList = new ArrayList<>();
	    JSONArray ja = new JSONArray();
	   
	    System.out.print(selectedValue);

        System.out.print(oList);
        
	    if ("orderdelay".equals(selectedValue)) {
	        oList = adoDao.getorderdelay();
	    } else if ("cancelplease".equals(selectedValue)) {
	        oList = adoDao.cancelplease();
	    } else if ("orderreturn".equals(selectedValue)) {
	        oList = adoDao.orderreturn();
	    } else if ("reviewEnd".equals(selectedValue)) {
	        oList = adoDao.reviewEnd();
	    } else if ("ordersuccess".equals(selectedValue)) {
	        oList = adoDao.ordersuccess();
        }
	   
		for(int i=0; i<oList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("orderNum", oList.get(i).getOrder_num());
			jo.put("ordertime", oList.get(i).getOrder_time());
			jo.put("orderimg", oList.get(i).getProd_img());
			jo.put("orderqty", oList.get(i).getOrder_qty());
			jo.put("orderprice", oList.get(i).getOrder_price());
			jo.put("prodname", oList.get(i).getProd_name());
		    jo.put("orderusername", oList.get(i).getUser_name());
			jo.put("orderusermobile", oList.get(i).getUser_mobile());
			jo.put("orderuseraddress", oList.get(i).getUser_address());
			jo.put("orderstate", oList.get(i).getOrder_state());
			ja.add(jo);
		}
		

	   return ja.toJSONString();
	}
	
	
	@GetMapping("/adminuserlist")
	public String goadminuserlist(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		
		ArrayList<AdminOrderDTO> uList = adoDao.getuserlist();
		if (uList.size() == 0) {
			model.addAttribute("oList","없음");
			return "admin/adminuserlist";
		}
		model.addAttribute("uList",uList);

	

		return "/admin/adminuserlist";
	}

	
	private void handleUserInterface(HttpServletRequest req, Model model) {
		 AbstractUserController.handleUserInterface(req, model);
		
	}
	
}
