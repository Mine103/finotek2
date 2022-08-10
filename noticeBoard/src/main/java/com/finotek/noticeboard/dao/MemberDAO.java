package com.finotek.noticeboard.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.finotek.noticeboard.vo.LoginVO;
import com.finotek.noticeboard.vo.MemberVO;

public class MemberDAO {
	
	@Inject private SqlSession sqlSession;
	
	public MemberVO selectByEmail(LoginVO vo) {
		return sqlSession.selectOne("member.selectByEmail", vo);
	}
	
	public void insert(MemberVO vo) {
		sqlSession.insert("member.insert", vo);
	}
	
}
