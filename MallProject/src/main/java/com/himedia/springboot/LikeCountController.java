package com.himedia.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.springboot.ProductController.AbstractUserController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LikeCountController {
    @Autowired
    private LikeCountDAO lcDAO;
    

    @RequestMapping("/rtestcount")
 	public String test(HttpServletRequest req, Model model) {
 		
 		handleUserInterface(req, model);
 		HttpSession s = req.getSession();
 		String user_id = (String) s.getAttribute("id");
 		int likecheck = lcDAO.likecheck(user_id, "testtitle");
 		model.addAttribute("lk",likecheck);
 		return "/likecount";
 	}
    
    
    @GetMapping("/initialLikeCount")
    @ResponseBody
    public String initialLikeCount(@RequestParam("title") String title) {
        int countlike = lcDAO.getLikeCountByTitle(title);
    
        return String.valueOf(countlike);
    }
    
    @GetMapping("/likecheck")
    @ResponseBody
    public String likecheck(HttpServletRequest req, @RequestParam("title") String title, @RequestParam("id") String user_id) {

        int likecheck = lcDAO.likecheck(user_id, title);

        return String.valueOf(likecheck); 
    }

    @RequestMapping("/increaseLikeCount")
    @ResponseBody
    public String increaseLikeCount(HttpServletRequest req, Model model) {
      
        
        String title = req.getParameter("title");
   
        String user_id = (String) req.getSession().getAttribute("id");
 
    
     
        
        	lcDAO.increaseLikeCount(title, user_id);
     
       
        
        int countlike = lcDAO.getLikeCountByTitle(title);
        
        return String.valueOf(countlike);
    }
 
    @RequestMapping("/decreaseLikeCount")
    @ResponseBody
    public String decreaseLikeCount(HttpServletRequest req, Model model) {
      
        
        String title = req.getParameter("title");
        String user_id = (String) req.getSession().getAttribute("id");

        lcDAO.decreaseLikeCount(title, user_id);

        int countlike = lcDAO.getLikeCountByTitle(title);
        
        return String.valueOf(countlike);
    }
 
    
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
		
	}
}