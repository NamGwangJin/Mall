package com.himedia.springboot;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.himedia.springboot.ProductController.AbstractUserController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewDAO rdao;
	
	@Autowired
	private CartDAO cdao;
	
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
	}
	
	@GetMapping("/reviewwrite")
	public String write(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		String prod_name = req.getParameter("prod_name");
		int order_num = Integer.parseInt(req.getParameter("order_num"));
		
		model.addAttribute("prod_name",prod_name);
		model.addAttribute("order_num",order_num);
		
		return "review/reviewwrite";
	}
	@PostMapping("/insert1")
	public String insert(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String rating = req.getParameter("rating");
		String title = req.getParameter("hp_tail1");
		String content = req.getParameter("hp_tail");
		String img = req.getParameter("img");
		String id= (String) session.getAttribute("id");
		String prod_name = req.getParameter("prod_name");
		int order_num = Integer.parseInt(req.getParameter("order_num"));
		rdao.insPost(rating,title, content, img, id, prod_name);
		cdao.updateState(order_num, "리뷰 작성 완료");
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
		rdao.udPost(num, rating, title, content, img);
		return "redirect:/review";
	}
	
	@PostMapping("/orderByRating")
	@ResponseBody
	public String orderByRating(HttpServletRequest req) {
		String prod_name = req.getParameter("prod_name");
		
		int start, psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		
		ArrayList<ReviewDTO> rList = rdao.orderByRating(start, psize, prod_name);
		JSONArray ja = new JSONArray();
		for (int i=0; i<rList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("img", rList.get(i).getImg());
			jo.put("rating", rList.get(i).getRating());
			jo.put("title", rList.get(i).getTitle());
			jo.put("created", rList.get(i).getCreated());
			jo.put("updated", rList.get(i).getUpdated());
			jo.put("writer", rList.get(i).getWriter());
			jo.put("content", rList.get(i).getContent());
			ja.add(jo);
		}
		
		return ja.toJSONString();
		
	}
	
	@PostMapping("/orderByDate")
	@ResponseBody
	public String orderByDate(HttpServletRequest req) {
		String prod_name = req.getParameter("prod_name");
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		
		ArrayList<ReviewDTO> rList = rdao.orderByDate(start, psize, prod_name);
		JSONArray ja = new JSONArray();
		for (int i=0; i<rList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("img", rList.get(i).getImg());
			jo.put("rating", rList.get(i).getRating());
			jo.put("title", rList.get(i).getTitle());
			jo.put("created", rList.get(i).getCreated());
			jo.put("updated", rList.get(i).getUpdated());
			jo.put("writer", rList.get(i).getWriter());
			jo.put("content", rList.get(i).getContent());
			ja.add(jo);
		}
		
		return ja.toJSONString();
		
	}
	
	@PostMapping("/orderByPhoto")
	@ResponseBody
	public String orderByPhoto(HttpServletRequest req) {
		String prod_name = req.getParameter("prod_name");
		String ob = req.getParameter("ob");
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		
		ArrayList<ReviewDTO> rList = rdao.orderByPhoto(start, psize, prod_name, ob);
		JSONArray ja = new JSONArray();
		for (int i=0; i<rList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("img", rList.get(i).getImg());
			jo.put("rating", rList.get(i).getRating());
			jo.put("title", rList.get(i).getTitle());
			jo.put("created", rList.get(i).getCreated());
			jo.put("updated", rList.get(i).getUpdated());
			jo.put("writer", rList.get(i).getWriter());
			jo.put("content", rList.get(i).getContent());
			ja.add(jo);
		}
		
		return ja.toJSONString();
		
	}
	
	@PostMapping("/reviewSearch")
	@ResponseBody
	public String reviewSearch(HttpServletRequest req) {
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		
		String prod_name = req.getParameter("prod_name");
		String keyword = req.getParameter("keyword");
		
		ArrayList<ReviewDTO> rList = rdao.reviewSearch(start, psize, prod_name, "%"+keyword+"%");
		JSONArray ja = new JSONArray();
		for (int i=0; i<rList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("img", rList.get(i).getImg());
			jo.put("rating", rList.get(i).getRating());
			jo.put("title", rList.get(i).getTitle());
			jo.put("created", rList.get(i).getCreated());
			jo.put("updated", rList.get(i).getUpdated());
			jo.put("writer", rList.get(i).getWriter());
			jo.put("content", rList.get(i).getContent());
			ja.add(jo);
		}
		
		return ja.toJSONString();
		
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
