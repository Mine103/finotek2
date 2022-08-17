package com.finotek.noticeboard.service;

import java.util.List;

import com.finotek.noticeboard.vo.BoardVO;

public interface BoardService {

	public void write(BoardVO vo);
	public List<BoardVO> list();
	
}
