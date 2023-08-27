package com.himedia.springboot;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
public class ProductController {
	@Autowired
	private ProductDAO pDao;
	
	@GetMapping("/")
	public String home(HttpServletRequest req, Model model) {
		
		// 페이징 시작
		int start;
		int psize;
		String page = req.getParameter("pageno");
		if(page==null||page.equals("")) {
			page="1";
		}
		int pno = Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		ArrayList<ProductDTO> alMall = pDao.getList(start, psize);
	
		int cnt = pDao.getTotal();
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
		// 페이징 끝
		
		// 비회원, 회원 화면 구분 출력
    	HttpSession s = req.getSession();
	
		String id = (String) s.getAttribute("id");
		if(id==null || id.equals("")) {
			model.addAttribute("bbs","<a href='/bbs'>게시판</a>");
			model.addAttribute("infoline","<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
			model.addAttribute("review","<a href='/review'>리뷰</a>");
		}else {
			model.addAttribute("bbs","<a href='/bbs'>게시판</a>");
			model.addAttribute("review","<a href='/review'>리뷰</a>");
			model.addAttribute("infoline",id+"&nbsp;&nbsp;<button id=logout>로그아웃</button>");
			model.addAttribute("inforeg","<a href='/goreg'>상품등록하기</a>");
			model.addAttribute("write","<td style='text-align:right;'><a href='/write'><h3>게시물 작성</h3></a></td>");
			model.addAttribute("id", id);
		}
		// 비회원, 회원 화면 구분 출력 끝
		return "home";
	}
	
	@GetMapping("/product")
	public String view(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String id = (String) s.getAttribute("id");
		String name = req.getParameter("name");
		ProductDTO mdto = pDao.product(name);
		model.addAttribute("id",id);
		model.addAttribute("product",mdto);

		return "product/product";
	}

	@PostMapping("/insert")
	public String insert(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String prod_name=req.getParameter("prod_name");
		String prod_price=req.getParameter("prod_price");
		String prod_msg=req.getParameter("prod_msg");
		String prod_img=req.getParameter("prod_img");		
		
		pDao.insert(prod_name, prod_price, prod_msg, prod_img);
		
		return "redirect:/";
	}
	
	@GetMapping("/goreg")
	public String goreg() {
		return "product/ProductReg";
	}
	
	//file upload
	@Value("${upload.directory}")
    private String uploadDirectory;

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, Model model) {
        if (!file.isEmpty()) {
            try {
                String fileName = file.getOriginalFilename();
                String fileRealName = fileName;

                // 파일 저장 경로로 파일 이동
                File targetFile = new File(uploadDirectory + File.separator + fileRealName);
                file.transferTo(targetFile);

                model.addAttribute("fileName", fileName);
                model.addAttribute("fileRealName", fileRealName);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("errorMessage", "파일 업로드 실패");
            }
        } else {
            model.addAttribute("errorMessage", "업로드할 파일을 선택하세요.");
        }

        return "product/uploadResult";
    }
}
