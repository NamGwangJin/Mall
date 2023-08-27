package com.himedia.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BbsController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
	@Autowired
	private BbsDAO bdao;
	
//	@GetMapping("/")
//	public String home(HttpServletRequest req, Model model) {
//		HttpSession session = req.getSession();
//		String id= (String) session.getAttribute("id");
//		if(id==null || id.equals("")) {
//			model.addAttribute("bbs","<a href='/bbs'>게시판</a>");
//			model.addAttribute("infoline","<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
//			model.addAttribute("id", "");
//			int start,psize;
//			String page = req.getParameter("pageno");
//			if(page==null || page.equals("")) {
//				page="1";
//			}
//			int pno = Integer.parseInt(page);
//			start = (pno-1)*10;
//			psize = 10;
//			ArrayList<BbsDTO> alBoard = bdao.getList(start, psize);
//			
//			int cnt=bdao.getTotal();
//			int pagecount = (int) Math.ceil(cnt/10.0);
//
//			String pagestr="";
//			for(int i=1; i<=pagecount; i++) {
//				if(pno==i) {
//					pagestr+=i+"&nbsp;";
//				} else {
//					pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
//				}
//			}
//			model.addAttribute("pagestr", pagestr);
//			model.addAttribute("mlist", alBoard);
//		} else {
//			model.addAttribute("bbs","<a href='/bbs'>게시판</a>");
//			model.addAttribute("infoline",id+"&nbsp;&nbsp;<button id=btnLogout>로그아웃</button>");
//			model.addAttribute("inforeg","<a href='/goreg'>상품등록하기</a>"); 
//			model.addAttribute("write","<td style='text-align:right;'><a href='/write'><h3>게시물 작성</h3></a></td>");
//			model.addAttribute("id", id);
//			int start,psize;
//			String page = req.getParameter("pageno");
//			if(page==null || page.equals("")) {
//				page="1";
//			}
//			int pno = Integer.parseInt(page);
//			start = (pno-1)*10;
//			psize = 10;
//			ArrayList<BbsDTO> alMall = bdao.getList(start, psize);
//			
//			int cnt=bdao.getTotal();
//			int pagecount = (int) Math.ceil(cnt/10.0);
//			System.out.println("pagecount="+pagecount);
//			
//			String pagestr="";
//			for(int i=1; i<=pagecount; i++) {
//				if(pno==i) {
//					pagestr+=i+"&nbsp;";
//				} else {
//					pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
//				}
//			}
//			model.addAttribute("pagestr",pagestr);
//			model.addAttribute("mlist",alMall);
//		}
//		return "home";
//	}
	
//	@GetMapping("/gosignup")
//	public String gosignup() {
//		return "signup";
//	}
//
//	@GetMapping("/gologin")
//	public String gologin() {
//		return "login";
//	}
//	
//	 @PostMapping("/logout")
//	 @ResponseBody 
//	 public String execLogout(HttpServletRequest req) {
//			HttpSession session = req.getSession();
//			session.invalidate();	//session 전부 지우기
//			return "/";
//		}

	@GetMapping("/view")
	public String view(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id= (String) session.getAttribute("id");
		model.addAttribute("id", id);
		int num = Integer.parseInt(req.getParameter("num"));
		bdao.hitUp(num);
		BbsDTO bdto = bdao.view(num);
		model.addAttribute("bPost",bdto);
		return "view";
	}
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		bdao.delPost(num);
		return "redirect:/";
	}
	
	@GetMapping("/write")
	public String write(HttpServletRequest req, Model model) {
		return "write";
	}
	@PostMapping("/insert2")
	public String insert2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id= (String) session.getAttribute("id");
		bdao.insPost(title, content, id, now, now);
		return "redirect:/bbs";
	}
	
	@GetMapping("/update")
	public String update(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		BbsDTO bdto = bdao.view(num);
		model.addAttribute("bPost",bdto);
		return "update";
	}
	
	@PostMapping("/modify")
	public String modfiy(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		bdao.udPost(num, title, content, now);
		return "redirect:/";
	}

	@GetMapping("/bbs")
	public String Bbs(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id= (String) session.getAttribute("id");
		if(id==null || id.equals("")) {
			model.addAttribute("home","<a href='/'>홈으로</a>");
			model.addAttribute("infoline","<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
			model.addAttribute("id", "");
			int start,psize;
			String page = req.getParameter("pageno");
			if(page==null || page.equals("")) {
				page="1";
			}
			int pno = Integer.parseInt(page);
			start = (pno-1)*10;
			psize = 10;
			ArrayList<BbsDTO> alBoard = bdao.getList(start, psize);
			
			int cnt=bdao.getTotal();
			int pagecount = (int) Math.ceil(cnt/10.0);

			String pagestr="";
			for(int i=1; i<=pagecount; i++) {
				if(pno==i) {
					pagestr+=i+"&nbsp;";
				} else {
					pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
				}
			}
			model.addAttribute("pagestr", pagestr);
			model.addAttribute("mlist", alBoard);
		} else {
			model.addAttribute("home","<a href='/'>홈으로</a>");
			model.addAttribute("infoline",id+"&nbsp;&nbsp;<button id=btnLogout>로그아웃</button>");
			model.addAttribute("write","<td style='text-align:right;'><a href='/write'><h3>게시물 작성</h3></a></td>");
			model.addAttribute("id", id);
			int start,psize;
			String page = req.getParameter("pageno");
			if(page==null || page.equals("")) {
				page="1";
			}
			int pno = Integer.parseInt(page);
			start = (pno-1)*10;
			psize = 10;
			ArrayList<BbsDTO> alMall = bdao.getList(start, psize);
			
			int cnt=bdao.getTotal();
			int pagecount = (int) Math.ceil(cnt/10.0);
			System.out.println("pagecount="+pagecount);
			
			String pagestr="";
			for(int i=1; i<=pagecount; i++) {
				if(pno==i) {
					pagestr+=i+"&nbsp;";
				} else {
					pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
				}
			}
			model.addAttribute("pagestr",pagestr);
			model.addAttribute("mlist",alMall);
		}
		return "bbs";
	}

}