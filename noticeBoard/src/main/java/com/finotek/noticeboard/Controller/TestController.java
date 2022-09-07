package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping(value = "/userinfoTest")
	public String userinfo() {
		return "member/userinfoTest";
	}
	
}
