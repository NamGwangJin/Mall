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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MallController {
	@Autowired
	private mallDAO mdao;
	
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
		ArrayList<mallDTO> alMall = mdao.getList(start, psize);
	
		int cnt = mdao.getTotal();
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
//			s.setAttribute("infoline", "<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
		}else {
			model.addAttribute("bbs","<a href='/bbs'>게시판</a>");
			model.addAttribute("infoline",id+"&nbsp;&nbsp;<button id=logout>로그아웃</button>");
			model.addAttribute("inforeg","<a href='/goreg'>상품등록하기</a>");
			model.addAttribute("write","<td style='text-align:right;'><a href='/write'><h3>게시물 작성</h3></a></td>");
			model.addAttribute("id", id);
//			s.setAttribute("infoline",id+"&nbsp;&nbsp;<button id=logout>로그아웃</button>");
//			s.setAttribute("inforeg","<a href='/goreg'>상품등록하기</a>");
			
		}
		// 비회원, 회원 화면 구분 출력 끝
		return "home";
	}
	@GetMapping("/product")
	public String view(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String id = (String) s.getAttribute("id");
		String name = req.getParameter("name");
		mallDTO mdto = mdao.product(name);
		model.addAttribute("id",id);
		model.addAttribute("product",mdto);

		return "product";
	}
	
	@GetMapping("/gosignup")
	public String gosignup() {
		return "signup";
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
		
		int data = mdao.signup(id, pw, name, mobile, email, address, bd);
		return String.valueOf(data);
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String totalview(HttpServletRequest req) {
		String id = req.getParameter("id");
		String passcode1 = req.getParameter("passcode1");			
		int data = mdao.login(id, passcode1);
		if(data == 1) {
			HttpSession session = req.getSession();
			mallDTO member = mdao.loginOk(id);
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
		return "login";
	}

	@PostMapping("/insert")
	public String insert(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String prod_name=req.getParameter("prod_name");
		String prod_price=req.getParameter("prod_price");
		String prod_msg=req.getParameter("prod_msg");
		String prod_img=req.getParameter("prod_img");		
		
		mdao.insert(prod_name, prod_price, prod_msg, prod_img);
		
		return "redirect:/";
	}
	
	@GetMapping("/goreg")
	public String goreg() {
		return "ProductReg";
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

        return "uploadResult";
    }
    
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		String id = (String) s.getAttribute("id");
		mallDTO user = mdao.getpage(id);
		if(id==null || id.equals("")) {
			model.addAttribute("infoline","<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
		}else {
			model.addAttribute("infoline","<a href='/mypage'>"+id+"</a>"+"&nbsp;&nbsp;<button id=logout>로그아웃</button>");
			model.addAttribute("inforeg","<a href='/goreg'>상품등록하기</a>");
			model.addAttribute("info",id);
			model.addAttribute("imp",user);
		}
		return "mypage";
	}
	@GetMapping("/quit")
	public String quit(HttpServletRequest req) {
		HttpSession s = req.getSession();
		String user_id = req.getParameter("user_id");
		mdao.quit(user_id);
		s.invalidate();
		return "redirect:/";
	}
}
