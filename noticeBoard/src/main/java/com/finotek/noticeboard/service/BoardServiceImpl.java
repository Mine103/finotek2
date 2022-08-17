package com.finotek.noticeboard.service;

import java.util.List;

import com.finotek.noticeboard.dao.BoardDAO;
import com.finotek.noticeboard.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	
	BoardDAO dao;

	@Override
	public void write(BoardVO vo) {
		dao.write(vo);
	}

	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

}
