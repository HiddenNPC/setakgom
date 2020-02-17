package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.mapper.QnaMapper;



@Service("qnaService")
public class QnaServiceImpl implements QnaService
{
	@Autowired(required = false) private SqlSession sqlSession;
	
	@Override public int getListCount()throws Exception
	{
		int count=0;
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		try
		{
			count = qnaMapper.getListCount();
			
		}
		catch(Exception e)
		{
			System.out.println("카운트 실패 " + e.getMessage());
		}
		
		return count;
		
		
	}

	@Override public ArrayList<QnaVO> getQnaList(int startRow, int endRow) throws Exception 
	{
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();		
		try
		{			
			QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
			list = qnaMapper.getQnaList(startRow, endRow);
			return list;			
		}
		catch(Exception e)
		{
			throw new Exception("리스트 불러오기 오류남 ㅇㅇ.", e);
		}
	
	}
	
	@Override
	public ArrayList<QnaVO> onList(String loginId) throws Exception 
	{
		ArrayList<QnaVO> onlist = new ArrayList<QnaVO>();		
		try
		{			
			QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
			onlist = qnaMapper.onList(loginId);
			return onlist;			
		}
		catch(Exception e)
		{
			throw new Exception("리스트 불러오기 오류남 ㅇㅇ.", e);
		}
	
	}
	
	
	@Override public int qnaInsert(QnaVO qnavo) throws Exception 
	{
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		try
		{
			int vo = qnaMapper.qnaInsert(qnavo);
			return vo;
		}
		catch (Exception e)
		{
			throw new Exception(" 원글 쓰기  실패", e);
		}
	}
	
	@Override public QnaVO getDetail(QnaVO vo) throws Exception 
	{
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);		
		QnaVO qnavo = qnaMapper.getDetail(vo.getQna_num());		
		return qnavo;
	}
	
	@Override public String qnaPassChk(int num) throws Exception
	{		
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);		
		String res = qnaMapper.qnaPassChk(num);	
		System.out.println("res 값은? " + res);
		return res;
	}
	
	
	@Override public int qnaModify(QnaVO vo) throws Exception 
	{
		int res =0;
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		try
		{
			res = qnaMapper.qnaModify(vo);
			
		}
		catch (Exception e)
		{
			throw new Exception("수정 실패", e);
		}
		return res;		
	}

	@Override public int qnaDelete(QnaVO vo) throws Exception {
		
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		int res = qnaMapper.qnaDelete(vo.getQna_num());
		return res;
	}

	@Override public int getMaxNum() throws Exception 
	{
		int res=0;
		int maxnum=0;
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		try
		{	
			
			 res =qnaMapper.getMaxNum();
			
		}
		catch (Exception e)
		{
			throw new Exception("최댓값 구하기  실패", e);
		}
		return res;
		
	}
	
	@Override
	public List<Object> ad_qnalist() {		
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		List<Object> list = qnaMapper.ad_qnalist();
		return list;
	}

	@Override
	public int ad_qnaModify(QnaVO vo) {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		int res = qnaMapper.ad_qnaModify(vo);
		return res;
	}

	
	
	
	
	
	
	
	

	//기응
	@Override 
	public ArrayList<QnaVO> selectQnalist(HashMap<String, Object> map) {
		ArrayList<QnaVO> qnalist = null;
		
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		
		qnalist = qnaMapper.selectQnalist(map);
		
		return qnalist;
	}

	
	
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
