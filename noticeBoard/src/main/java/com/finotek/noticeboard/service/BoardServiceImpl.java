package com.finotek.noticeboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.transaction.annotation.Transactional;

import com.finotek.noticeboard.dao.BoardDAO;
import com.finotek.noticeboard.dao.BoardFileDAO;
import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	
	BoardDAO dao;
	BoardFileDAO fileDAO;

	@Transactional
	@Override
	public void create(BoardVO vo){
	        String[] files = vo.getFiles();  
	        
	        if (files == null) {
	        	
	        	dao.create(vo);
	            return;
	        }
	        vo.setFileCnt(files.length);
	        
	        dao.create(vo);
	        Integer bno = vo.getBno();
	        for (String fileName : files) {
	        	try {
					fileDAO.addAttach(fileName, bno);
				} catch (Exception e) {
					e.printStackTrace();
				}
	        }
	}

	@Override
	public BoardVO read(int bno) {
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void update(BoardVO vo){
	        int bno = vo.getBno();
	        try {
				fileDAO.deleteAllAttach(bno);
			} catch (Exception e) {
				e.printStackTrace();
			}

	        String[] files = vo.getFiles();
	        if (files == null) {
	        	vo.setFileCnt(0);
	            dao.update(vo);
	            return;
	        }

	        vo.setFileCnt(files.length);
	        dao.update(vo);
	        for (String fileName : files) {
	        	try {
					fileDAO.replaceAttach(fileName, bno);
				} catch (Exception e) {
					e.printStackTrace();
				}
	        }
	}

	@Transactional
	@Override
	public void delete(int bno) {
	    	try {
				fileDAO.deleteAllAttach(bno);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
