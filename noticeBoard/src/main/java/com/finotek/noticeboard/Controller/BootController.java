package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BootController {

	@RequestMapping(value = "/bootstrap")
	public String bootstrap() {
		return "boot";
	}
	
}
