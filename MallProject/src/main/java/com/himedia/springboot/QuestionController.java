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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	 
		@Autowired
		private BbsDAO bdao;
		
		@Autowired
		private LikeCountDAO lcDAO;
	 
    @GetMapping("/question")
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
    	return "question/faq";
    }
    

	@GetMapping("/questionview")
	public String view(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		handleUserInterface(req, model);
		String id= (String) session.getAttribute("id");
		model.addAttribute("id", id);
		int num = Integer.parseInt(req.getParameter("num"));
		qdao.hitUp(num);
		QuestionDTO qdto = qdao.view(num);
		model.addAttribute("qPost",qdto);
 	
		
		ArrayList<QuestioncmtDTO> cdto = qdao.getReply(num);
		model.addAttribute("qList",cdto);
		
		return "question/questionview";
	}
	
	@GetMapping("/delete3")
	public String delete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		qdao.delPost(num);
		return "redirect:/question";
	}
	
	@GetMapping("/questionwrite")
	public String questionwrite(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		return "question/questionwrite";
	}
	@PostMapping("/insert3")
	public String insert2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String title = req.getParameter("hp_tail3");
		String content = req.getParameter("hp_tail2");
		String id= (String) session.getAttribute("id");
		String qimg = req.getParameter("question_img");
		qdao.insPost(title, content, id, now, now, qimg);
		return "redirect:/question";
	}
	
	@GetMapping("/update3")
	public String update(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		handleUserInterface(req, model);
		QuestionDTO qdto = qdao.view(num);
		model.addAttribute("qPost",qdto);
		return "question/questionupdate";
	}
	
	@PostMapping("/modify3")
	public String modfiy(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
//		String qimg = req.getParameter("que_img");
		qdao.udPost(num, title, content, now);
		return "redirect:/question";
	}
	
	@PostMapping("/replyInsert1")
	public String replyInsert(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("id");
		int num = Integer.parseInt(req.getParameter("num"));
		String content = req.getParameter("content");
		qdao.insertReply(num, content, writer, now);
		return "redirect:/questionview?num=" + num;
	}
	
	@GetMapping("/delete4")
	public String delete1(HttpServletRequest req) {
		int quecmtnum = Integer.parseInt(req.getParameter("quecmtnum"));
		int num = Integer.parseInt(req.getParameter("num"));
		qdao.delReply(num);
		return "redirect:/questionview?num=" + quecmtnum;
	}

	@PostMapping("/update4")
	@ResponseBody
	public String update10(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		int num = Integer.parseInt(req.getParameter("num"));
		String content = req.getParameter("content");
		
		qdao.udReply(num, content);
		
		return "/questionview";
	}
	
	@Value("${upload.directory}")
    private String uploadDirectory;

    @PostMapping("/upload3")
    public String uploadFile(@RequestParam("file3") MultipartFile file, Model model) {
        if (!file.isEmpty()) {
            try {
                String fileName3 = file.getOriginalFilename();
                String fileRealName3 = fileName3;

                // 파일 저장 경로로 파일 이동
                File targetFile3 = new File(uploadDirectory + File.separator + fileRealName3);
                file.transferTo(targetFile3);

                model.addAttribute("fileName3", fileName3);
                model.addAttribute("fileRealName3", fileRealName3);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("errorMessage3", "파일 업로드 실패");
            }
        } else {
            model.addAttribute("errorMessage3", "업로드할 파일을 선택하세요.");
        }
        
        return "question/UploadResult";
    }
}
