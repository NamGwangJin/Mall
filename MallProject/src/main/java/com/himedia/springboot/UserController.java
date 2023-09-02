package com.himedia.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.springboot.ProductController.AbstractUserController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserDAO uDao;
	
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
	}
	
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
			session.setAttribute("admin_user", member.getAdmin_user());
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
		handleUserInterface(req, model);
		String id = (String) s.getAttribute("id");
		UserDTO user = uDao.getpage(id);

		model.addAttribute("info",id);
		model.addAttribute("imp",user);
		
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
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idcheck(HttpServletRequest req) {
		String id = req.getParameter("id");
		
		int data = uDao.idCheck(id);
		
		return String.valueOf(data);
	}
	
	@GetMapping("/profile")
	public String goProfile(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		HttpSession s = req.getSession();
		String id = (String)s.getAttribute("id");
		UserDTO user = uDao.getprof(id);

		model.addAttribute("info",id);
		model.addAttribute("imp",user);
		
		return "user/profile";
	}
	
	@GetMapping("/delivery")
	public String goDelivery(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		handleUserInterface(req, model);
		
		String id = (String)s.getAttribute("id");
		UserDTO user = uDao.getdel(id);
		
		model.addAttribute("info",id);
		model.addAttribute("imp",user);
				
		return("user/delivery");
	}
}
