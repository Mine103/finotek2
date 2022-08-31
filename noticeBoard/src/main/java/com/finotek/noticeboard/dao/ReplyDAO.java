package com.finotek.noticeboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.finotek.noticeboard.paging.Criteria;
import com.finotek.noticeboard.vo.ReplyVO;

@Repository
public class ReplyDAO {

	SqlSession sqlSession;
	
	public List<ReplyVO> list(int bno) {
		return sqlSession.selectList("reply.list", bno);
	}
	
    public void create(ReplyVO replyVO) throws Exception {
        sqlSession.insert("reply.create", replyVO);
    }

    public void update(ReplyVO replyVO) throws Exception {
        sqlSession.update("reply.update", replyVO);
    }

    public void delete(Integer rno) throws Exception {
        sqlSession.delete("reply.delete", rno);
    }
    
    public List<ReplyVO> listPaging(Integer bno, Criteria criteria) throws Exception {

        Map<String, Object> paramMap = new HashMap();
        paramMap.put("article_no", bno);
        paramMap.put("criteria", criteria);

        return sqlSession.selectList("reply.listPaging", paramMap);
    }

    public int countReplies(Integer bno) {
        return sqlSession.selectOne("reply.countReplies", bno);
    }
	
}
