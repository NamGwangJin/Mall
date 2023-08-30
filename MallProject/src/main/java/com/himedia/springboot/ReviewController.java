package com.himedia.springboot;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller

public class ReviewController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
	@Autowired
	private ReviewDAO rdao;
	
//	@GetMapping("/review")
//	public String review(HttpServletRequest req, Model model) {
//		HttpSession session = req.getSession();
//		String id= (String) session.getAttribute("id");
//		if(id==null || id.equals("")) {
//			model.addAttribute("review","<a href='/review'>리뷰게시판</a>");
//			model.addAttribute("id", "");
//			int start,psize;
//			String page = req.getParameter("pageno");
//			if(page==null || page.equals("")) {
//				page="1";
//			}
//			int pno = Integer.parseInt(page);
//			start = (pno-1)*10;
//			psize = 10;
//			ArrayList<ReviewDTO> alBoard = rdao.getList(start, psize);
//			
//			int cnt=rdao.getTotal();
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
//			model.addAttribute("rlist", alBoard);
//		} else {
//			model.addAttribute("review","<a href='/review'>리뷰게시판</a>");
//			model.addAttribute("reviewwrite","<td style='text-align:right;'><a href='/review'><h3>게시물 작성</h3></a></td>");
//			model.addAttribute("id", id);
//			int start,psize;
//			String page = req.getParameter("pageno");
//			if(page==null || page.equals("")) {
//				page="1";
//			}
//			int pno = Integer.parseInt(page);
//			start = (pno-1)*10;
//			psize = 10;
//			ArrayList<ReviewDTO> alMall = rdao.getList(start, psize);
//			
//			int cnt=rdao.getTotal();
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
//			model.addAttribute("pagestr",pagestr);
//			model.addAttribute("rlist",alMall);
//		}
//		return "review/review";
//	}
	
	@GetMapping("/reviewwrite")
	public String write(HttpServletRequest req, Model model) {
		String prod_name = req.getParameter("prod_name");
		model.addAttribute("prod_name",prod_name);
		
		return "review/reviewwrite";
	}
	@PostMapping("/insert1")
	public String insert(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String rating = req.getParameter("rating");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String img = req.getParameter("img");
		String id= (String) session.getAttribute("id");
		String prod_name = req.getParameter("prod_name");
		rdao.insPost(rating,title, content, img, id, now, now, prod_name);
		return "redirect:/product?name=" + prod_name;
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
		int rating = Integer.parseInt(req.getParameter("rating"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String img = req.getParameter("img");
		rdao.udPost(num, rating, title, content, img, now);
		return "redirect:/review";
	}
	
	//file upload
		@Value("${upload.directory}")
	    private String uploadDirectory;

	    @PostMapping("/upload1")
	    public String uploadFile(@RequestParam("file1") MultipartFile file, Model model) {
	        if (!file.isEmpty()) {
	            try {
	                String fileName1 = file.getOriginalFilename();
	                String fileRealName1 = fileName1;

	                // 파일 저장 경로로 파일 이동
	                File targetFile1 = new File(uploadDirectory + File.separator + fileRealName1);
	                file.transferTo(targetFile1);

	                model.addAttribute("fileName1", fileName1);
	                model.addAttribute("fileRealName1", fileRealName1);
	            } catch (IOException e) {
	                e.printStackTrace();
	                model.addAttribute("errorMessage1", "파일 업로드 실패");
	            }
	        } else {
	            model.addAttribute("errorMessage1", "업로드할 파일을 선택하세요.");
	        }
	        
	        return "review/reviewUploadResult";
	    }
	
	
}
