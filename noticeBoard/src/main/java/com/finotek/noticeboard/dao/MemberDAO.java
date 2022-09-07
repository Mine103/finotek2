package com.finotek.noticeboard.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.finotek.noticeboard.vo.MemberVO;

@Repository
public class MemberDAO {
	
	private SqlSession sqlSession;
	
	public MemberVO selectEmail(MemberVO vo) {
		return sqlSession.selectOne("member.login", vo);
	}
	
	public void insert(MemberVO vo) {
		sqlSession.insert("member.insert", vo);
	}
	
	public void update(MemberVO vo) {
		sqlSession.update("member.update", vo);
	}
	
	public int idChk(MemberVO vo) {
		return sqlSession.selectOne("member.idChk", vo);
	}
	
	public int nameChk(MemberVO vo) {
		return sqlSession.selectOne("member.nameChk", vo);
	}
	
}
