package com.spring.setak;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MypageMapper;
import com.spring.order.OrderVO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<OrderVO> getOrderlist(OrderVO orderVO){
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		ArrayList<OrderVO> orderlist = new ArrayList<OrderVO>();
		
		orderlist = mypageMapper.getOrderlist(orderVO);

		return orderlist;
	}
	
	@Override
	public int getOrdercount() {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		int orderVO = mypageMapper.getOrdercount();
		
		return orderVO;
	}
	
	@Override
	public MendingVO selectMending(int repair_seq) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		MendingVO mendingVO = new MendingVO();
		
		mendingVO = mypageMapper.selectMending(repair_seq);
		
		return mendingVO;
	}
	
	@Override
	public OrderVO selectOrder(long order_num) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		OrderVO orderVO = new OrderVO();
		
		orderVO = mypageMapper.selectOrder(order_num);
		
		return orderVO;
	}
	
	@Override
	public KeepVO selectKeep(int keep_seq) {
		MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
		KeepVO keepVO = new KeepVO();
			
		keepVO = mypageMapper.selectKeep(keep_seq);
		
		return keepVO;
	}
}

