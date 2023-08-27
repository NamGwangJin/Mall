package com.himedia.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller

public class ReviewController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
	@Autowired
	private ReviewDAO rdao;
	
	@GetMapping("/review")
	public String review(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id= (String) session.getAttribute("id");
		if(id==null || id.equals("")) {
			model.addAttribute("review","<a href='/review'>리뷰게시판</a>");
			model.addAttribute("id", "");
			int start,psize;
			String page = req.getParameter("pageno");
			if(page==null || page.equals("")) {
				page="1";
			}
			int pno = Integer.parseInt(page);
			start = (pno-1)*10;
			psize = 10;
			ArrayList<ReviewDTO> alBoard = rdao.getList(start, psize);
			
			int cnt=rdao.getTotal();
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
			model.addAttribute("rlist", alBoard);
		} else {
			model.addAttribute("review","<a href='/review'>리뷰게시판</a>");
			model.addAttribute("reviewwrite","<td style='text-align:right;'><a href='/reviw'><h3>게시물 작성</h3></a></td>");
			model.addAttribute("id", id);
			int start,psize;
			String page = req.getParameter("pageno");
			if(page==null || page.equals("")) {
				page="1";
			}
			int pno = Integer.parseInt(page);
			start = (pno-1)*10;
			psize = 10;
			ArrayList<ReviewDTO> alMall = rdao.getList(start, psize);
			
			int cnt=rdao.getTotal();
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
			model.addAttribute("rlist",alMall);
		}
		return "review/review";
	}
	
	@GetMapping("/reviewwrite")
	public String write(HttpServletRequest req, Model model) {
		return "reviw/reviewwrite";
	}
	@PostMapping("/insert1")
	public String insert(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id= (String) session.getAttribute("id");
		rdao.insPost(title, content, id, now, now);
		return "redirect:/review";
	}
	
	@GetMapping("/reviewupdate")
	public String update(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		ReviewDTO rdto = rdao.view(num);
		model.addAttribute("rPost",rdto);
		return "review/reviewupdate";
	}
	
	@PostMapping("/modify1")
	public String modfiy(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		rdao.udPost(num, title, content, now);
		return "redirect:/review";
	}
}
