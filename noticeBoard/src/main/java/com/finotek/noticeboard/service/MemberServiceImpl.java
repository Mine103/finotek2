package com.finotek.noticeboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finotek.noticeboard.dao.MemberDAO;
import com.finotek.noticeboard.exception.EmailNotFoundException;
import com.finotek.noticeboard.exception.EmailPasswordNotMatchException;
import com.finotek.noticeboard.vo.LoginVO;
import com.finotek.noticeboard.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDAO dao;
	
	@Override
	public MemberVO login(String email, String pass) {
		MemberVO member = dao.selectByEmail(new LoginVO(email, pass));
		if(member == null) {
			throw new EmailPasswordNotMatchException();
		}
		return member;
	}
	
}