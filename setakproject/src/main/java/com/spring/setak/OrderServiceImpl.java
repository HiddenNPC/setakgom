package com.spring.setak;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService  {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertOrder(OrderVO ovo) {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertOrder(ovo);
		} catch(Exception e) {
			System.out.println("주문 추가 실패 " + e.getMessage());
		}
		
		return res; 
	}
	
}
