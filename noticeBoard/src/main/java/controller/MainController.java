package main.java.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.service.MainService;

@Controller
public class MainController {

	
	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping("/")
	public String test(Model model) throws Exception {
		System.out.println("Controller");
		String test = mainService.selectText();
		System.out.println(test);
		model.addAttribute("selectTableList", test);
		return "main/Main";
	}
	
}
