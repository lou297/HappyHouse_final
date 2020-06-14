package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.QnADao;
import com.ssafy.happyhouse.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADao qnaDao;

	@Override
	public List<QnA> retrieveQnA() {
		return qnaDao.selectQnA();
	}
	
	@Override
	public QnA detailQnA(int qnaNo) {
		return qnaDao.selectQnAByNo(qnaNo);
	}
	
	@Override
	public boolean writeQnA(QnA qna) {
		return qnaDao.insertQnA(qna) == 1;
	}
	
	@Override
	public boolean updateQnA(QnA qna) {
		return qnaDao.updateQnA(qna) == 1;
	}
	
	@Override
	public boolean deleteQnA(int qnaNo) {
		return qnaDao.deleteQnA(qnaNo) == 1;
	}
}
