package main.java.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl {
	
	@Resource(name = "mainDao")
	private MainDAO mainDao;
	
	public String selectText() throws Exception {
		System.out.println("serviceImpl");
		return mainDao.selectTest();
	}
	
}
