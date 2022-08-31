package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finotek.noticeboard.service.BoardService;

@Controller
public class IndexController {
	
	BoardService service;

	@RequestMapping(value = {"/", "/index"})
	public String index() {
		return "redirect:/board/list";
	}
	
}
