package com.himedia.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.himedia.springboot.ProductController.AbstractUserController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
public class QuestionController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
	
	 public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
	}
	 @Autowired
	 private QuestionDAO qdao;
	 
    @GetMapping("/questionview")
	public String questionview(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		handleUserInterface(req, model);
		String id= (String) session.getAttribute("id");
		if(id==null || id.equals("")) {
			int start,psize;
			String page = req.getParameter("pageno");
			if(page==null || page.equals("")) {
				page="1";
			}
			int pno = Integer.parseInt(page);
			start = (pno-1)*10;
			psize = 10;
			ArrayList<QuestionDTO> alBoard1 = qdao.getList(start, psize);
			
			int cnt=qdao.getTotal();
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
			model.addAttribute("qlist", alBoard1);
		} else {
			int start,psize;
			String page = req.getParameter("pageno");
			if(page==null || page.equals("")) {
				page="1";
			}
			int pno = Integer.parseInt(page);
			start = (pno-1)*10;
			psize = 10;
			ArrayList<QuestionDTO> alMall0 = qdao.getList(start, psize);
			
			int cnt=qdao.getTotal();
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
			model.addAttribute("qlist",alMall0);
		}
		return "question/question";
	}
    
    
    @GetMapping("/faq")
    public String faq() {
    	return "bbs/faq";
    }
}
