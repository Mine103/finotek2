package com.finotek.noticeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.finotek.noticeboard.service.BoardService;
import com.finotek.noticeboard.vo.BoardVO;

@Controller
public class WriteController {
	
	BoardService service;

	@RequestMapping(value = "/write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView writedo(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		
		service.write(vo);
		
		mav.setViewName("redirect:/index");
		return mav;
	}
	
}
