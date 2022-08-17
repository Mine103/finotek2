package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JndiController {
	
	@RequestMapping(value = "/jndi")
	public String jndi() {
		return "db/jndi";
	}
	
}
