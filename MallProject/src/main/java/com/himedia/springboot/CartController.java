package com.himedia.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
public class CartController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
	@Autowired
	private CartDAO cDao;
	
	@Autowired
	private UserDAO uDao;
	
	@Autowired
	private ReviewDAO rDao;
	
	@Autowired
	private ProductDAO pDao;
	
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
	}
	
    @GetMapping("/main")
    public String main(HttpServletRequest req) {
    	return "main";
    }
    
	@GetMapping("/cartList")
	public String cartList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		handleUserInterface(req, model);
		String id = (String) session.getAttribute("id");
		if(id == null || id.equals("")) {
			return "redirect:/gologin";
		}
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
		if (userId==null || userId.equals("")) {
			return "/gologin";
		}
		int prodId=Integer.parseInt(req.getParameter("prodId"));
		int qty=Integer.parseInt(req.getParameter("qty"));
		int totalPrice=Integer.parseInt(req.getParameter("totalPrice"));
		
		int check = cDao.checkCart(prodId,userId); // 장바구니에 이미 있는 상품인지 체크
		if ( check > 0 ) {
			return "있음";
		}
		
		int data = cDao.addCart(userId, prodId, qty, totalPrice);
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
	
	@PostMapping("/cartUpdate")
	@ResponseBody
	public String cartUpdate(HttpServletRequest req) {
		HttpSession s = req.getSession();
		String user_id = (String) s.getAttribute("id");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int total = Integer.parseInt(req.getParameter("total"));
		int prod_id = Integer.parseInt(req.getParameter("prod_id"));
		
		cDao.cartUpdate(user_id, qty, total, prod_id);
		
		return "success";
	}
	
	@PostMapping("/buy")
	@ResponseBody
	public String buy(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("user_id");
		String prod_name = req.getParameter("prod_name");
		int prod_id = Integer.parseInt(req.getParameter("prod_id"));
		int qty = Integer.parseInt(req.getParameter("qty"));
		int price = Integer.parseInt(req.getParameter("price"));
		int total = Integer.parseInt(req.getParameter("total"));
		String img = req.getParameter("img");
		
		int check = cDao.checkCart(prod_id, user_id); // 장바구니에 이미 있는 상품인지 체크
		if ( check > 0 ) {
			return "same";
		}
		
		int other = cDao.otherCart(user_id); // 장바구니에 다른 상품 있는지 체크
		if ( other > 0) {
			cDao.addCart(user_id, prod_id, qty, total);
			return "other";
		}
		
		int data = cDao.addCart(user_id, prod_id, qty, total);
		
		return String.valueOf(data);
	}
	
	@GetMapping("/buy")
	public String gobuy(HttpServletRequest req, Model model) {
		String user_id = (String) req.getSession().getAttribute("id");
		String prod_name = req.getParameter("prod_name");
		int prod_id = Integer.parseInt(req.getParameter("prod_id"));
		int qty = Integer.parseInt(req.getParameter("qty"));
		int price = Integer.parseInt(req.getParameter("price"));
		int total = Integer.parseInt(req.getParameter("total"));
		String img = req.getParameter("img");
		
		int point = uDao.getPoint(user_id);
		
		model.addAttribute("point",point);
		model.addAttribute("prod_id",prod_id);
		model.addAttribute("prod_name",prod_name);
		model.addAttribute("qty",qty);
		model.addAttribute("price",price);
		model.addAttribute("total",total);
		model.addAttribute("img",img);
		handleUserInterface(req, model);
		
		return "order/buy";
	}
	
	@GetMapping("/listbuy")
	public String listBuy(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("user_id");
		String prod_id = req.getParameter("prod_id");
		String[] prodList = prod_id.split(",");
		
		int point = uDao.getPoint(user_id);
		ArrayList<CartDTO> cList = new ArrayList<CartDTO>();
		
		for(int i = 0; i<prodList.length; i++) {
			cList.add(cDao.getChoiceCart(user_id, Integer.parseInt(prodList[i])));
		}
		
		model.addAttribute("point",point);
		model.addAttribute("cList",cList);
		model.addAttribute("size",cList.size());
		handleUserInterface(req, model);
		
		return "cart/listbuy";
	}
	
	@PostMapping("/same")
	@ResponseBody
	public String same(HttpServletRequest req) {
		String user_id = (String) req.getSession().getAttribute("id");
		UserDTO sameUser = uDao.sameUser(user_id);
		String user_name = sameUser.getUser_name();
		String mobile = sameUser.getUser_mobile();
		String address = sameUser.getUser_address();
		
		return user_name + "/" + mobile + "/" + address;
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
		int usePoint = Integer.parseInt(req.getParameter("sale"));
		
		String prod_id = req.getParameter("prod_id");
		String[] prodList = prod_id.split(",");
		
		String prod_img = req.getParameter("prod_img");
		String[] imgList = prod_img.split(","); 
		
		String prod_name = req.getParameter("prod_name");
		String[] nameList = prod_name.split(",");
		
		String prod_qty = req.getParameter("prod_qty");
		String[] qtyList = prod_qty.split(",");
		
		String prod_total = req.getParameter("prod_total");
		String[] totalList = prod_total.split(",");
		
		int qty = 0;
		int total = 0;
		for(int i = 0 ; i < prodList.length ; i++) {
			cDao.order(name, mobile, imgList[i], nameList[i], Integer.parseInt(prodList[i]), 
							Integer.parseInt(qtyList[i]), Integer.parseInt(totalList[i]), 
							address, payment, id);
			cDao.deleteItem(id, Integer.parseInt(prodList[i]));
			qty += Integer.parseInt(qtyList[i]);
			total += Integer.parseInt(totalList[i]);
		}
		
		uDao.usePoint(id, usePoint);
		total -= usePoint;
		int savePoint = (int) Math.round(total * 0.1);
		uDao.savePoint(id, savePoint);
		
		model.addAttribute("name",name);
		model.addAttribute("img",imgList[0]);
		model.addAttribute("prodname",nameList[0]);
		model.addAttribute("qty",qty);
		model.addAttribute("usePoint",usePoint);
		model.addAttribute("savePoint",savePoint);
		model.addAttribute("total",total);
		model.addAttribute("mobile",mobile);
		model.addAttribute("address",address);
		model.addAttribute("payment",payment);
		model.addAttribute("now",now);
		model.addAttribute("size",prodList.length - 1);
		
		return "order/listOrderSuccess";
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
		int usePoint = Integer.parseInt(req.getParameter("sale"));
		int savePoint = (int) Math.round(total * 0.1);
		
		uDao.savePoint(id, savePoint);
		
		model.addAttribute("name",name);
		model.addAttribute("img",img);
		model.addAttribute("prodname",prodName);
		model.addAttribute("qty",qty);
		model.addAttribute("usePoint",usePoint);
		model.addAttribute("savePoint",savePoint);
		model.addAttribute("total",total);
		model.addAttribute("mobile",mobile);
		model.addAttribute("address",address);
		model.addAttribute("payment",payment);
		model.addAttribute("now",now);
		
		uDao.usePoint(id, usePoint);
		cDao.deleteItem(id, prodid);
		cDao.order(name, mobile, img, prodName, prodid, qty, total, address, payment, id);
		
		return "order/orderSuccess";
	}
	
	@GetMapping("/orderList")
	public String orderList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		handleUserInterface(req, model);
		if (id == null || id.equals("")) {
			return "redirect:/gologin";
		}
		
		ArrayList<OrderDTO> oList = cDao.getOrder(id);
		if (oList.size() == 0) {
			model.addAttribute("oList","없음");
			return "order/orderList";
		}
		
		ArrayList<OrderDTO> dateList = cDao.getDate(id);
		model.addAttribute("dList",dateList);
		
		Map<String, List<OrderDTO>> orderMap = new LinkedHashMap<>(); // 날짜별 주문 내역을 저장할 맵
		for (OrderDTO date : dateList) {
		    String orderDate = date.getOrder_time(); // 주문 날짜
		    ArrayList<OrderDTO> orderList = cDao.getOrderList(id, orderDate);
		    orderMap.put(orderDate, orderList); // 날짜별 주문 내역을 맵에 추가
		}
		model.addAttribute("orderMap", orderMap); // 모델에 맵을 추가
		
		return "order/orderList";
	}
	
	@GetMapping("/product")
	public String view(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String id = (String) s.getAttribute("id");
		int name = Integer.parseInt(req.getParameter("name"));
		ProductDTO mdto = pDao.product(name);
		model.addAttribute("id",id);
		model.addAttribute("product",mdto);
		
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		
		ArrayList<ReviewDTO> alMall = rDao.getList(start, psize, name);
		model.addAttribute("rlist",alMall);

		int cnt=rDao.getTotal();
		if (cnt == 0) {
			cnt = 1;
		}
		int pagecount = (int) Math.ceil(cnt/10.0);
		
		String pagestr="";
		for(int i=1; i<=pagecount; i++) {
			if(pno==i) {
				pagestr+=i+"&nbsp;";
			} else {
				pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		
		model.addAttribute("pagestr",pagestr);
		
		int reviewSize = rDao.getReviewSize(name);
		model.addAttribute("reviewSize",reviewSize);
		
		int photoSize = rDao.getPhotoReview(name);
		model.addAttribute("photoSize",photoSize);
		
		try {
			float ratingAvg = rDao.getRatingAvg(name);
		    String formattedNumber = String.format("%.1f", ratingAvg);
		    double doubleValue = Double.parseDouble(formattedNumber);
			model.addAttribute("ratingAvg", doubleValue);
		} catch (Exception e) {
			model.addAttribute("ratingAvg", 0);
		}

		int getLike = rDao.getLike(name);
		model.addAttribute("like", Math.round( (double) getLike / reviewSize * 100) );
		
		int getRating1 = rDao.getRating1(name);
		model.addAttribute("rating1", Math.round( (double) getRating1 / reviewSize * 100 ));
		
		int getRating2 = rDao.getRating2(name);
		model.addAttribute("rating2", Math.round( (double) getRating2 / reviewSize * 100 ));
		
		int getRating3 = rDao.getRating3(name);
		model.addAttribute("rating3", Math.round( (double) getRating3 / reviewSize * 100 ));
		
		int getRating4 = rDao.getRating4(name);
		model.addAttribute("rating4", Math.round( (double) getRating4 / reviewSize * 100 ));
		
		int getRating5 = rDao.getRating5(name);
		model.addAttribute("rating5", Math.round( (double) getRating5 / reviewSize * 100 ));
		
		// 비회원, 회원 화면 구분 출력 메소드
		 handleUserInterface(req, model);
		
		return "product/product";
	}
	
	@PostMapping("/updateState")
	@ResponseBody
	public String updateState(HttpServletRequest req) {
		int orderNum = Integer.parseInt(req.getParameter("orderNum"));
		String state = req.getParameter("state");
		
		if(state.equals("취소 요청")) {
			cDao.updateState(orderNum, state);
		} else if (state.equals("취소 요청 철회")) {
			cDao.updateState(orderNum, "배송 대기중");
		} else if (state.equals("반품 요청")) {
			cDao.updateState(orderNum, state);
		} else if (state.equals("반품 요청 철회")) {
			cDao.updateState(orderNum, "배송 완료");
		}
		
		String getState = cDao.getState(orderNum);
		
		return getState;
	}
	
	@GetMapping("/cookieList")
	@ResponseBody
	public String cookieList(HttpServletRequest req) {
		String prodList = req.getParameter("prodCookie");
		String[] prodListArray = prodList.split(",");

		int[] prod_id = new int[prodListArray.length];
		for (int i = 0; i < prodListArray.length; i++) {
		    prod_id[i] = Integer.parseInt(prodListArray[i]);
		}
		
		ArrayList<ProductDTO> pList = new ArrayList<ProductDTO>();
		for (int i = prod_id.length-1; i >= 0; i--) {
			ProductDTO pDto = cDao.getProduct(prod_id[i]);
			pList.add(pDto);
		}
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<pList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("prod_img", pList.get(i).getProd_img());
			jo.put("prod_name", pList.get(i).getProd_name());
			ja.add(jo);
		}
		
		return ja.toJSONString();
	}
}