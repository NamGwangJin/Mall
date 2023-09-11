package com.himedia.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    

    
    @RequestMapping("/initialLikeCount")
    @ResponseBody
    public String initialLikeCount(@RequestParam("lcnum") int lcnum) {
    	double countlike =  lcDAO.getLikeCountByTitle(lcnum);
    	int intValue = (int) Math.floor(countlike);

        return String.valueOf(intValue);
    }
    
    @GetMapping("/likecheck")
    @ResponseBody
    public String likecheck(HttpServletRequest req, @RequestParam("lcnum") int lcnum, @RequestParam("id") String user_id) {

        int likecheck = lcDAO.likecheck(user_id, lcnum);

        return String.valueOf(likecheck); 
    }

    @RequestMapping("/increaseLikeCount")
    @ResponseBody
    public String increaseLikeCount(HttpServletRequest req, Model model,@RequestParam("lcnum") int lcnum) {
      
        
//        int lcnum = req.getParameter("lcnum");
   
        String user_id = (String) req.getSession().getAttribute("id");

        	lcDAO.increaseLikeCount(lcnum, user_id);

        int countlike = lcDAO.getLikeCountByTitle(lcnum);
        
        return String.valueOf(countlike);
    }
 
    @RequestMapping("/decreaseLikeCount")
    @ResponseBody
    public String decreaseLikeCount(HttpServletRequest req, Model model,@RequestParam("lcnum") int lcnum) {
      
        
//        String title = req.getParameter("lcnum");
        String user_id = (String) req.getSession().getAttribute("id");
        lcDAO.decreaseLikeCount(lcnum, user_id);

  
        double countlike; 
        try {
            countlike = lcDAO.getLikeCountByTitle(lcnum);
        } catch (Exception e) {
            countlike = 0.0; 
        }
        int intValue = (int) Math.floor(countlike);
    	
        return String.valueOf(intValue);
    }
 
    
    public static void handleUserInterface(HttpServletRequest req, Model model) {
		  AbstractUserController abstractUserController = new AbstractUserController(){};
	        abstractUserController.handleUserInterface(req, model);
		
	}
}