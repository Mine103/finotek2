package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WriteController {

	@RequestMapping(value = "/write")
	public String write() {
		return "board/write";
	}
	
}
