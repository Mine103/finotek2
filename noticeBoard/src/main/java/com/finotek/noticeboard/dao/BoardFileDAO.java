package com.finotek.noticeboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class BoardFileDAO {
	
	SqlSession sqlSession;

	// 게시글 첨부파일 추가
    public void addAttach(String fullName, Integer bno) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("fullName", fullName);
        paramMap.put("bno", bno);
        sqlSession.insert("file.addAttach", paramMap);
    }

    // 게시글 첨부파일 조회
    public List<String> getAttach(Integer bno) throws Exception {
        return sqlSession.selectList("file.getAttach", bno);
    }

    // 게시글 첨부파일 수정
    public void replaceAttach(String fullName, Integer bno) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("fullName", fullName);
        paramMap.put("bno", bno);
        sqlSession.insert("file.replaceAttach", paramMap);
    }

    // 게시글 첨부파일 삭제
    public void deleteAttach(String fullName) throws Exception {
        sqlSession.delete("file.deleteAttach", fullName);
    }

    // 게시글 첨부파일 일괄 삭제
    public void deleteAllAttach(Integer bno) throws Exception {
        sqlSession.delete("file.deleteAllAttach", bno);
    }

    // 특정 게시글의 첨부파일 갯수 갱신
    public void updateAttachCnt(Integer bno) throws Exception {
        sqlSession.update("file.updateAttachCnt", bno);
    }
	
}
