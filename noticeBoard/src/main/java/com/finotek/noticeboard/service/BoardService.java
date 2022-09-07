package com.finotek.noticeboard.service;

import java.util.List;

import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.BoardVO;

public interface BoardService {

	public void create(BoardVO vo);
	public BoardVO read(int bno);
	public void update(BoardVO vo);
	public void delete(int bno);
	public List<BoardVO> list();
	public List<BoardVO> listCriteria(Criteria criteria);
	public int countBoard(Criteria criteria);
	
}
