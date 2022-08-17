package com.finotek.noticeboard.Controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.finotek.noticeboard.service.MemberService;
import com.finotek.noticeboard.vo.MemberVO;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	MemberService memberService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		//MemberVO login = memberService.login(vo);
		
		logger.info(vo.getEmail());
		logger.info(vo.getPass());
		
		/*if(login == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", login);
		}*/
		
		mav.setViewName("redirect:/index");
		return mav;
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public ModelAndView register(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		logger.info(vo.getEmail());
		logger.info(vo.getPass());
		logger.info(vo.getName());
		
		//memberService.register(vo);
		
		mav.setViewName("redirect:/index");
		return mav;
	}
	
	@RequestMapping(value = "/logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		memberService.logout(session);
		mav.setViewName("redirect:/index");
		return mav;
	}
	
}
