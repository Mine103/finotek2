package com.finotek.noticeboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.finotek.noticeboard.vo.MemberVO;

public interface MemberService {
	
	public MemberVO login(MemberVO vo);
	public void register(MemberVO vo);
	public void logout(HttpSession session);
	public int idChk(MemberVO vo);
	public int nameChk(MemberVO vo);
	
}
