package com.finotek.noticeboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.finotek.noticeboard.vo.MemberVO;

public interface MemberService {
	
	public List<MemberVO> selectAll();
	public MemberVO login(MemberVO vo);
	
	public void register(MemberVO vo);
	
	public void logout(HttpSession session);
	
}
