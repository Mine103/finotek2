package com.finotek.noticeboard.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.finotek.noticeboard.dao.MemberDAO;
import com.finotek.noticeboard.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	MemberDAO dao;

	@Override
	public MemberVO login(MemberVO vo) {
		return dao.selectEmail(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void register(MemberVO vo) {
		dao.insert(vo);
	}

	@Override
	public int idChk(MemberVO vo) {
		return dao.idChk(vo);
	}

	@Override
	public int nameChk(MemberVO vo) {
		return dao.nameChk(vo);
	}
	
}