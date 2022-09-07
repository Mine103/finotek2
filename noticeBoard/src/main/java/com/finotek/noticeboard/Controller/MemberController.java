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
	
	@RequestMapping(value = "/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/register")
	public String register() {
		return "member/register";
	}
	
	@RequestMapping(value = "/userinfo")
	public String userinfo(HttpSession session) {
		return "member/userinfo";
	}
	
	@RequestMapping(value = "/userinfo.do", method = RequestMethod.POST)
	public ModelAndView changeUserInfo(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/index");
		return mav;
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		MemberVO login = memberService.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", login);
		}
		
		mav.setViewName("redirect:/index");
		return mav;
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public ModelAndView register(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		memberService.register(vo);
		
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
	
	@RequestMapping(value = "/idChk")
	public int idChk(MemberVO vo) { 
		int result = memberService.idChk(vo);
		return result;
	}
	
	@RequestMapping(value = "/nameChk")
	public int nameChk(MemberVO vo) {
		int result = memberService.nameChk(vo);
		return result;
	}
	
}
