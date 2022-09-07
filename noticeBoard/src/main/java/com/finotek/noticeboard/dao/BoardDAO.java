package com.finotek.noticeboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.BoardVO;

@Repository
public class BoardDAO {
	
	SqlSession sqlSession;
	
	public void create(BoardVO vo) {
		sqlSession.insert("board.insert", vo);
	}
	
	public BoardVO read(int bno) {
		return sqlSession.selectOne("board.read", bno);
	}
	
	public void update(BoardVO vo) {
		sqlSession.update("board.update", vo);
	}
	
	public void delete(int bno) {
		sqlSession.delete("board.delete", bno);
	}
	
	public List<BoardVO> list() {
		return sqlSession.selectList("board.list");
	}
	
	public List<BoardVO> listPaging(int page) {
		if(page<=0) {
			page = 1;
		}
		
		page = (page-1)*10;
		
		return sqlSession.selectList("board.listPaging", page);
	}
	
	public List<BoardVO> listCriteria(Criteria criteria) {
		return sqlSession.selectList("board.listCriteria", criteria);
	}
	
	public int countBoard(Criteria criteria) {
		return sqlSession.selectOne("board.countBoard", criteria);
	}
	
}
