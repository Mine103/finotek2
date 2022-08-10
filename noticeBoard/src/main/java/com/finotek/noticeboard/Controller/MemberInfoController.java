package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberInfoController {

	@RequestMapping(value = "/userinfo")
	public String userinfo() {
		return "member/userinfo";
	}
	
}
