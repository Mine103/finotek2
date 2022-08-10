package com.finotek.noticeboard.service;

import com.finotek.noticeboard.vo.MemberVO;

public interface MemberService {
	
	public MemberVO login(String email, String pass);
	
}
