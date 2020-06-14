package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.QnA;

@Mapper
@Repository
public interface QnADao {
	public List<QnA> selectQnA();
	public QnA selectQnAByNo(int qnaNo);
	public int insertQnA(QnA qna);
	public int updateQnA(QnA qna);
	public int deleteQnA(int qnaNo);
	
}
