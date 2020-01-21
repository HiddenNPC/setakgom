package com.spring.setak;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MypageMapper;

@Service
public class MendingServiceImpl implements MendingService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<MendingVO> getMendinglist(MendingVO mendingVO){
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		ArrayList<MendingVO> mendinglist = new ArrayList<MendingVO>();
		
		mendinglist = mypageMapper.getMendinglist(mendingVO);

		return mendinglist;
	}
	
	@Override
	public MendingVO selectMending(int repair_seq) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		MendingVO mendingVO = new MendingVO();
		
		mendingVO = mypageMapper.selectMending(repair_seq);
		
		return mendingVO;
	}
	
	@Override
	public OrderVO selectOrder(int order_num) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		OrderVO orderVO = new OrderVO();
		
		orderVO = mypageMapper.selectOrder(order_num);
		
		return orderVO;
	}
}

