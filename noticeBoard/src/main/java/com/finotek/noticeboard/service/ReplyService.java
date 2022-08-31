package com.finotek.noticeboard.service;

import java.util.List;

import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> list(Integer article_no);
    void create(ReplyVO replyVO);
    void update(ReplyVO replyVO);
    void delete(Integer reply_no);
    List<ReplyVO> getRepliesPaging(Integer bno, Criteria criteria);
    int countReplies(Integer bno);
    
}
