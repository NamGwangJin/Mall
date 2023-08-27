package com.himedia.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserDAO uDao;
	
	@GetMapping("/gosignup")
	public String gosignup() {
		return "user/signup";
	}
	
	@PostMapping("/signup")
	@ResponseBody
	public String dosignup(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String bd = req.getParameter("bd");
		String mobile = req.getParameter("mobile");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		
		int data = uDao.signup(id, pw, name, mobile, email, address, bd);
		return String.valueOf(data);
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String totalview(HttpServletRequest req) {
		String id = req.getParameter("id");
		String passcode1 = req.getParameter("passcode1");			
		int data = uDao.login(id, passcode1);
		if(data == 1) {
			HttpSession session = req.getSession();
			UserDTO member = uDao.loginOk(id);
			session.setAttribute("name", member.getUser_name());
			session.setAttribute("id", member.getUser_id());
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("id", null);
		}
		return String.valueOf(data);
	}
	
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession s = req.getSession();
		s.invalidate();
		return "redirect:/";
	}

	@GetMapping("/gologin")
	public String gobduy() {
		return "user/login";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String id = (String) s.getAttribute("id");
		UserDTO user = uDao.getpage(id);
		if(id==null || id.equals("")) {
			model.addAttribute("infoline","<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
		}else {
			model.addAttribute("infoline","<a href='/mypage'>"+id+"</a>"+"&nbsp;&nbsp;<button id=logout>로그아웃</button>");
			model.addAttribute("inforeg","<a href='/goreg'>상품등록하기</a>");
			model.addAttribute("info",id);
			model.addAttribute("imp",user);
		}
		return "user/mypage";
	}
	
	@GetMapping("/quit")
	public String quit(HttpServletRequest req) {
		HttpSession s = req.getSession();
		String user_id = req.getParameter("user_id");
		uDao.quit(user_id);
		s.invalidate();
		return "redirect:/";
	}
}
