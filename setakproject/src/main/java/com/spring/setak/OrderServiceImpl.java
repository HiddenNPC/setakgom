package com.spring.setak;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AddressMapper;
import com.spring.mapper.CartMapper;
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

	@Override
	public int deleteWashCartbyID(String member_id) {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.deleteWashCartbyID(member_id);
		}catch(Exception e) {
			System.out.println("세탁 장바구니 삭제 실패" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int deleteMendingCartbyID(String member_id) {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.deleteMendingCartbyID(member_id);
		}catch(Exception e) {
			System.out.println("수선 장바구니 삭제 실패" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int deleteKeepCartbyID(String member_id) {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.deleteKeepCartbyID(member_id);
		}catch(Exception e) {
			System.out.println("보관 장바구니 삭제 실패" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int insertOrderList(OrderListVO olv) {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertOrderList(olv);
		} catch(Exception e) {
			System.out.println("주문 리스트 추가 실패 " + e.getMessage());
		}
		
		return res; 
	}

	@Override
	public ArrayList<OrderListVO> getOrderList(OrderListVO olv) {
		ArrayList<OrderListVO> ordersList = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			ordersList = orderMapper.getOrderList(olv);
		} catch(Exception e) {
			System.out.println("주소 리스트 시퀀스 검색 실패" + e.getMessage());
		}
		
		return ordersList;
	}

	@Override
	public int getOrderPrice(OrderListVO olv) {
		int price = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			price = orderMapper.getOrderPrice(olv);
		} catch(Exception e) {
			System.out.println("결제 금액 검색 실패 " + e.getMessage());
		}
		
		return price; 
	}
	
}
