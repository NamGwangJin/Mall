package com.himedia.springboot;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class MallController {
	@Autowired
	private mallDAO mdao;
	
	@GetMapping("/test")
	public String gotest(HttpServletRequest req,Model model) {
	
		return "test";
	}
	
	@GetMapping("/")
	public String home(HttpServletRequest req, Model model) {
		int start;
		int psize;
		String page = req.getParameter("pageno");
		if(page==null||page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		ArrayList<mallDTO> alMall = mdao.getList(start, psize);
		
		int cnt = mdao.getTotal();
		int pagecount = (int) Math.ceil(cnt/10.0);

		
		String pagestr="";
		for(int i=1; i<=pagecount; i++) {
			if(pno==i) {
				pagestr += i+"&nbsp;&nbsp;";
			}else {				
				pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;&nbsp;"; 
			}
		}
		
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("mlist",alMall);
		
//		String list="";
//		ArrayList<mallDTO> alMall = mdao.getList(list);
//		model.addAttribute("bpost",alMall);
	
		
    	HttpSession s = req.getSession();
	
		String id = (String) s.getAttribute("id");
		if(id==null || id.equals("")) {
			model.addAttribute("infoline","<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
			
		}else {
//			model.addAttribute("img","<img src='img/"+s.getAttribute("selficon")+"'>");
			
			model.addAttribute("infoline",id+"&nbsp;&nbsp;<button id=logout>로그아웃</button>");
			model.addAttribute("inforeg","<a href='/goreg'>상품등록하기</a>");
		}
		return "home";
	}
	
	@GetMapping("/gosignup")
	public String gosignup() {
		return "signup";
	}
	
	@GetMapping("/gologin")
	public String gologin() {
		return "login";
	}
//	@GetMapping("/signup")
//		public String dosignup() {
//		return "signup";
//	}
	
	
	@PostMapping("/signup")
	@ResponseBody
	public String dosignup(HttpServletRequest req) {
		String url="";
		try {	
			String id = req.getParameter("id");
			String passcode1 = req.getParameter("passcode1");
			String passcode2 =req.getParameter("passcode2");
			String name =req.getParameter("name");
			String mobile =req.getParameter("mobile");
			String email =req.getParameter("email");
			String birthday =req.getParameter("birthday");
	
			int cnt = mdao.signup(id, passcode1,passcode2, name,birthday, mobile,
											 email);
			
			if(cnt>0) {
				url= "/login";
			}else {
				url= "/signup";
			}
		} catch(Exception e) {
			url="insert실패";
		}
		return url;
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String totalview(HttpServletRequest req) {
		try {
		String id = req.getParameter("id");
		String passcode1 = req.getParameter("passcode1");			
		
		mallDTO mdto = mdao.login(id, passcode1);
			if(mdto!=null) {
				HttpSession s= req.getSession();
				s.setAttribute("id",id);
				if(mdto.getSelficon()==null) {
					s.setAttribute("selficon", "zzang9che.jpg");
				} else {
					s.setAttribute("selficon", mdto.getSelficon());
				}
				return "/";
			} else {
					return "/login";
			}
		} catch(Exception e) {
			return "login";
		}

	}
	
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession s = req.getSession();
		s.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/product1")
	public String goproduct1(){
		return "product1";
	}
	
//	@GetMapping("/product")
//	public String goproduct(Model model){
//		String list="";
//		ArrayList<mallDTO> alMall = mdao.getList(list);
//		model.addAttribute("bpost",alMall);
//		
//		return "product";
//	}
	
	
	@GetMapping("/WeverseloginHTML")
	public String gobduy() {
		return "WeverseloginHTML";
	}

	@GetMapping("/buy")
	public String gobuy() {
		return "buy";
	}

	@PostMapping("/cart")
	public String goCart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("id");
		String productName=req.getParameter("hiddenProductName");
		String numInput=req.getParameter("hiddenNumInput");
		String productPrice=req.getParameter("hiddenProductPrice");
		String totalPrice=req.getParameter("hiddenTotalPrice");
		
		
	
	
		mdao.cart(userId,productName, numInput,productPrice,totalPrice);
		return "redirect:/";
	}
	
	@PostMapping("/insert")
	public String insert(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String title=req.getParameter("name");
		String price=req.getParameter("price");
		String content=req.getParameter("comment");
		String img=req.getParameter("img");		
		
		mdao.insert(title, price, content, img);
		
		
		return "redirect:/";
	}
	
	@GetMapping("/goreg")
	public String goreg() {
		return "ProductReg";
	}
	
	@GetMapping("/product")
	public String view(HttpServletRequest req, Model model) {

		String name = req.getParameter("name");
		mallDTO mdto = mdao.product(name);
		
		model.addAttribute("product",mdto);
				

		return "product" ;
	}
	
	
}
