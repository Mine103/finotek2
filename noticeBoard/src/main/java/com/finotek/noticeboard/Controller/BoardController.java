package com.finotek.noticeboard.Controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.paging.PageMaker;
import com.finotek.noticeboard.service.BoardService;
import com.finotek.noticeboard.vo.BoardVO;

@Controller
public class BoardController {
	
	BoardService service;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePost(BoardVO vo, RedirectAttributes attributes) {
		service.create(vo);
		attributes.addFlashAttribute("msg", "regSuccess");
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model, Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.countBoard(criteria));
		
		model.addAttribute("boards", service.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "board/list";
	}
	
	@RequestMapping(value = "/read")
	public String read(@RequestParam("bno") int bno,
			Model model) {
		model.addAttribute("board", service.read(bno));
		return "board/read";
	}
	
	@RequestMapping(value = "/modfiy", method = RequestMethod.GET)
	public String modfiyGet(@RequestParam("bno") int bno,
			Model model) {
		model.addAttribute("board", service.read(bno));
		return "board/modfiy";
	}
	
	@RequestMapping(value = "/modfiy", method = RequestMethod.POST)
	public String modfiyPost(BoardVO vo,
			RedirectAttributes attributes) {
		service.update(vo);
		attributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/remove")
	public String remove(@RequestParam("bno") int bno,
			RedirectAttributes attributes) {
		service.delete(bno);
		attributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/search");
		mav.addObject("search", request.getParameter("search"));
		
		return mav;
	}
	
	
	@RequestMapping(value = "/read2")
	public String read2() {
		return "board/read2";
	}
	
}
