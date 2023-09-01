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
	
	@Autowired
	private static UserDAO uDao;

//	   @GetMapping("/rtest")
//		public String test(HttpServletRequest req, Model model) {
//			
//			handleUserInterface(req, model);
//			return "product/likecount";
//		}
	
	
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
		
		handleUserInterface(req, model);
		return "home";
	}

	@PostMapping("/insert")
	public String insert(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String user_id=req.getParameter("id");
		String prod_name=req.getParameter("prod_name");
		String prod_price=req.getParameter("prod_price");
		String prod_msg=req.getParameter("prod_msg");
		String prod_img=req.getParameter("prod_img");		
		
		pDao.insert(prod_name, prod_price, prod_msg, prod_img);
		pDao.insertRegProduct(user_id,prod_name, prod_price, prod_msg, prod_img);
		return "redirect:/";
	}
	
	
	@PostMapping("/regEdit")
	public String regEdit(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		
		String prod_name=req.getParameter("prod_name");
		String prod_price=req.getParameter("prod_price");
		String prod_msg=req.getParameter("prod_msg");
		String prod_img=req.getParameter("prod_img");		
		String before_name=req.getParameter("before_name");
		
		
		pDao.regEdit(prod_name, prod_price, prod_msg, prod_img, before_name);
		pDao.regEditProduct(prod_name,prod_price,prod_msg,prod_img,before_name);
		return "redirect:/goreg";
	}
	
	
	@PostMapping("/regDelete")
	public String regDelete(HttpServletRequest req, String[] args) {
		String prod_name=req.getParameter("prod_name");
		
		//디렉토리 내 파일 삭제 메소드
		String prod_img=req.getParameter("prod_img");				
		File delImgPath = new File(uploadDirectory +File.separator + prod_img);
	    if (delImgPath.exists()) {
	        if (delImgPath.delete()) {
	            System.out.println("파일 삭제 성공");
	        } else {
	            System.out.println("파일 삭제 실패");
	        }
	    } else {
	        System.out.println("파일이 존재하지 않습니다.");
	    }		
		pDao.regDelete(prod_name,prod_img);
		pDao.regDeleteProduct(prod_name,prod_img);
	return "product/Productadmin";
	}
	
	@GetMapping("/goreg")
	public String goreg(HttpServletRequest req, Model model) {
		 handleUserInterface(req, model);
		return "product/Productadmin";
	}
	@GetMapping("/ProductReg")
	public String goProductReg(HttpServletRequest req, Model model) {
		handleUserInterface(req, model);
		return "product/ProductReg";
	
	}
	@PostMapping("/regProductList")
	public String goregProductList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<ProductDTO> rList = pDao.getRegProduct(id);
		session.setAttribute("rList", rList);
		return "product/regProductList";	
	}
	
	@GetMapping("/regProductEdit")
	public String goRegProductEdit(HttpServletRequest req, Model model) {
	    HttpSession s = req.getSession();
	    String id = (String) s.getAttribute("id");
	    String prodName = req.getParameter("prodName");
	    String prodPrice = req.getParameter("prodPrice");
	    String prodImg =  req.getParameter("prodImg");
	    String prodMsg =  req.getParameter("prodMsg");
	    
	    model.addAttribute("id", id);
	    model.addAttribute("prodName", prodName);
	    model.addAttribute("prodPrice", prodPrice);
	    model.addAttribute("prodImg", prodImg);
	    model.addAttribute("prodMsg", prodMsg);
	    

	    return "product/regProductEdit";
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
    
    
   
    
 // 비회원, 회원 화면 구분 출력 추상 메소드 선언
    public static class AbstractUserController {
 	
       public static void handleUserInterface(HttpServletRequest req, Model model) {
    	   

    	   String id = (String) req.getSession().getAttribute("id");
    	   
           String admin = (String) req.getSession().getAttribute("admin_user");
           
           if (admin == null || admin== "N") {
        	   model.addAttribute("inforeg", "");
           } else {
	   	   	    if (admin.equals("Y")) {
	   	   	    	
		   	        model.addAttribute("inforeg", "<a href='/goreg'><img src='img/productadminimg.jpg' width=\"50\" height=\"50\"><span class=\"tooltip\">상품관리</span></a>");
		   	    } else {
	   	   	    	
		   	    	model.addAttribute("inforeg", "");
		   	    }
           }
          
            if (id == null || id.isEmpty()) {
            	model.addAttribute("infoline","<div class='MoreHeaderView_button_wrap__B-cQ2'>"+
            												"<a href='/gologin' class='MoreHeaderView_button_item__gv6pa' >로그인</a>&nbsp;&nbsp;" +
            												"<a href='/gosignup'  class='MoreHeaderView_button_item__gv6pa'>회원가입</a></div>");
//                model.addAttribute("infoline", "<a href='/gologin'>로그인</a>&nbsp;&nbsp;<a href='/gosignup'>회원가입</a>");
             
            } else {
            	model.addAttribute("bbs", "<a href='/bbs'><img src='img/boardimg.jpg' width=\"50\" height=\"50\"><span class=\"tooltip\">게시판</span></a>");
                model.addAttribute("cartlist"," <a href='/cartList?id='"+id+"><img src='img/shoppingcartimg.jpg' width=\"50\" height=\"50\"> <span class=\"tooltip\">장바구니</span></a>");
                model.addAttribute("orderlist"," <a href='/orderList?id='"+id+"><img src='img/moveproductimg.jpg' width=\"70\" height=\"70\"><span class=\"tooltip\">주문조회</span></a>");
          
                model.addAttribute("infoline", "<a href='/mypage'><img src='img/mypage.jpg' width=\"50\" height=\"50\"><span class=\"tooltip\">마이페이지</span></a>");
                model.addAttribute("write", "<td style='text-align:right;'><a href='/write'><h3>게시물 작성</h3></a></td>");
                model.addAttribute("id", id);
            }

        }
    }
//비회원, 화면 구분 출력 get 메소드
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
		
	}


}
