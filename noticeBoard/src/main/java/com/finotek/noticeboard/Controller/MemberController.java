package com.finotek.noticeboard.Controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.finotek.noticeboard.exception.EmailNotFoundException;
import com.finotek.noticeboard.exception.EmailPasswordNotMatchException;
import com.finotek.noticeboard.service.MemberService;
import com.finotek.noticeboard.vo.MemberVO;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	MemberService memberService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, String email, String pass) {
		ModelAndView mav = new ModelAndView();
		logger.info(email+"/"+pass);
		try {
			MemberVO member = memberService.login(email, pass);
			session.setAttribute("member", member);
			mav.setViewName("index");
		} catch(EmailPasswordNotMatchException e) {
			mav.addObject("message", "notmatch");
		}
		return mav;
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register() {
		logger.info("register.do");
		return "index";
	}
	
}
