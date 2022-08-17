package com.finotek.noticeboard.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/search");
		mav.addObject("search", request.getParameter("search"));
		
		return mav;
	}
	
}
