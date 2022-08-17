package com.finotek.noticeboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.finotek.noticeboard.dao.MemberDAO;
import com.finotek.noticeboard.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	MemberDAO memberDao;

	@Override
	public List<MemberVO> selectAll() {
		return memberDao.selectAll();
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return memberDao.selectEmail(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void register(MemberVO vo) {
		memberDao.insert(vo);
	}
	
}