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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.himedia.springboot.ProductController.AbstractUserController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BbsController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
	}
	
	@Autowired
	private BbsDAO bdao;
	
	@PostMapping("/replyInsert")
	public String replyInsert(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("id");
		int num = Integer.parseInt(req.getParameter("num"));
		String content = req.getParameter("content");
		bdao.insertReply(num, content, writer, now);
		return "redirect:/view?num=" + num;
	}
	
	@GetMapping("/delete1")
	public String delete1(HttpServletRequest req) {
		int bbscmtnum = Integer.parseInt(req.getParameter("bbscmtnum"));
		int num = Integer.parseInt(req.getParameter("num"));
		bdao.delReply(num);
		return "redirect:/view?num=" + bbscmtnum;
	}
	
	
	@PostMapping("/update1")
	@ResponseBody
	public String update10(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		int num = Integer.parseInt(req.getParameter("num"));
		String content = req.getParameter("content");
		
		bdao.udReply(num, content);
		
		return "/view";
	}
	
	
	@GetMapping("/view")
	public String view(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		handleUserInterface(req, model);
		String id= (String) session.getAttribute("id");
		model.addAttribute("id", id);
		int num = Integer.parseInt(req.getParameter("num"));
		bdao.hitUp(num);
		BbsDTO bdto = bdao.view(num);
		model.addAttribute("bPost",bdto);
		
		ArrayList<BbscmtDTO> cdto = bdao.getReply(num);
		model.addAttribute("cList",cdto);
		
		return "bbs/view";
	}
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		bdao.delPost(num);
		return "redirect:/bbs";
	}
	
	@GetMapping("/write")
	public String write(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		return "bbs/write";
	}
	@PostMapping("/insert2")
	public String insert2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String title = req.getParameter("hp_tail1");
		String content = req.getParameter("hp_tail");
		String id= (String) session.getAttribute("id");
		String bimg = req.getParameter("bbs_img");
		bdao.insPost(title, content, id, now, now, bimg);
		return "redirect:/bbs";
	}
	
	@GetMapping("/update")
	public String update(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		handleUserInterface(req, model);
		BbsDTO bdto = bdao.view(num);
		model.addAttribute("bPost",bdto);
		return "bbs/update";
	}
	
	@PostMapping("/modify")
	public String modfiy(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String bimg = req.getParameter("bbs_img");
		bdao.udPost(num, title, content, bimg, now);
		return "redirect:/bbs";
	}

	@GetMapping("/bbs")
	public String bbs(HttpServletRequest req, Model model) {
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
		return "bbs/bbs";
	}
	
	@Value("${upload.directory}")
    private String uploadDirectory;

    @PostMapping("/upload2")
    public String uploadFile(@RequestParam("file2") MultipartFile file, Model model) {
        if (!file.isEmpty()) {
            try {
                String fileName2 = file.getOriginalFilename();
                String fileRealName2 = fileName2;

                // 파일 저장 경로로 파일 이동
                File targetFile2 = new File(uploadDirectory + File.separator + fileRealName2);
                file.transferTo(targetFile2);

                model.addAttribute("fileName2", fileName2);
                model.addAttribute("fileRealName2", fileRealName2);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("errorMessage2", "파일 업로드 실패");
            }
        } else {
            model.addAttribute("errorMessage2", "업로드할 파일을 선택하세요.");
        }
        
        return "bbs/UploadResult";
    }
   
}