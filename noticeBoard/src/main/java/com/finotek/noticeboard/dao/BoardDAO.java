package com.finotek.noticeboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.finotek.noticeboard.vo.BoardVO;

public class BoardDAO {
	
	@Inject SqlSession sqlSession;
	
	public void write(BoardVO vo) {
		sqlSession.insert("board.insert", vo);
	} 
	
	public List<BoardVO> list() {
		return sqlSession.selectList("board.list");
	}
	
}
