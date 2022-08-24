package com.finotek.noticeboard.service;

import java.util.List;

import com.finotek.noticeboard.dao.BoardDAO;
import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	
	BoardDAO dao;

	@Override
	public void create(BoardVO vo) {
		dao.create(vo);
	}

	@Override
	public BoardVO read(int bno) {
		return dao.read(bno);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void delect(int bno) {
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria criteria) {
		return dao.listCriteria(criteria);
	}

	@Override
	public int countBoard(Criteria criteria) {
		return dao.countBoard(criteria);
	}

}
