package com.finotek.noticeboard.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.finotek.noticeboard.vo.MemberVO;

@Controller
public class MemberInfoController {

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
	
}
