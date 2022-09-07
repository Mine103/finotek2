package com.finotek.noticeboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.finotek.noticeboard.dao.ReplyDAO;
import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	ReplyDAO dao;

	@Override
	public List<ReplyVO> list(Integer bno) {
		return dao.list(bno);
	}

	@Override
	public void create(ReplyVO replyVO) {
		try {
			dao.create(replyVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(ReplyVO replyVO) {
		try {
			dao.update(replyVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer rno) {
		try {
			dao.delete(rno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<ReplyVO> getRepliesPaging(Integer bno, Criteria criteria) {
		try {
			return dao.listPaging(bno, criteria);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int countReplies(Integer bno) {
		return dao.countReplies(bno);
	}
	
}
