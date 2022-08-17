package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReadController {
	
	@RequestMapping(value = "/read")
	public String read() {
		return "board/read";
	}
	
}
