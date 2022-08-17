package com.finotek.noticeboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.finotek.noticeboard.vo.MemberVO;

public class MemberDAO {
	
	@Inject private SqlSession sqlSession;
	
	public List<MemberVO> selectAll() {
		return sqlSession.selectList("member.selectAll");
	}
	
	public MemberVO selectEmail(MemberVO vo) {
		return sqlSession.selectOne("member.selectEmail", vo);
	}
	
	public void insert(MemberVO vo) {
		sqlSession.insert("member.insert", vo);
	}
	
	public void update(MemberVO vo) {
		sqlSession.update("member.update", vo);
	}
	
}
