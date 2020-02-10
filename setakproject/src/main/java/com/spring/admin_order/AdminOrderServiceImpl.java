package com.spring.admin_order;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AddressMapper;
import com.spring.mapper.Admin_order;
import com.spring.order.AddressVO;
import com.spring.order.OrderVO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<OrderVO> getOrderList() {
		ArrayList<OrderVO> orderList = null;
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			orderList = adminOrderMapper.getOrderList();
		} catch(Exception e) {
			System.out.println("전체 주문 리스트 검색 실패" + e.getMessage());
		}
		
		return orderList;
	}
	
	@Override
	public int getOrderCount() {
		int cnt = 0;
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			cnt = adminOrderMapper.getOrderCount();
		} catch(Exception e) {
			System.out.println("전체 주문 개수 검색 실패" + e.getMessage());
		}
		
		return cnt;
	}

	@Override
	public ArrayList<OrderVO> orderSearch(HashMap<String, Object> map) {
		ArrayList<OrderVO> orderList = null;
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			orderList = adminOrderMapper.orderSearch(map);
		} catch(Exception e) {
			System.out.println("전체 주문 검색 실패" + e.getMessage());
		}
		
		return orderList;
	}

	@Override
	public int orderSearchCount(HashMap<String, Object> map) {
		int cnt = 0;
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			cnt = adminOrderMapper.orderSearchCount(map);
		} catch(Exception e) {
			System.out.println("전체 검색 갯수 실패 " + e.getMessage());
		}
		
		return cnt;
	}

	@Override
	public OrderVO getOrderInfo(OrderVO ovo) {
		OrderVO orderVO = null;
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			orderVO = adminOrderMapper.getOrderInfo(ovo);
		}catch(Exception e) {
			System.out.println("주문 정보 선택 실패 " + e.getMessage());
		}
		
		return orderVO; 
	}

	@Override
	public int updateOrderInfo(OrderVO ovo) {
		int res = 0;  
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			res = adminOrderMapper.updateOrderInfo(ovo);
		}catch(Exception e) {
			System.out.println("선택 주문 정보 수정 실패 " + e.getMessage());
		}
		
		return res; 		
	}

	@Override
	public int statusUpdate(HashMap<String, Object> map) {
		int res = 0;  
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			res = adminOrderMapper.statusUpdate(map);
		}catch(Exception e) {
			System.out.println("주문 상태 수정 실패 " + e.getMessage());
		}
		
		return res; 
	}

	@Override
	public int recentOrderStatusCnt(HashMap<String, Object> map) {
		int cnt = 0;  
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			cnt = adminOrderMapper.recentOrderStatusCnt(map);
		}catch(Exception e) {
			System.out.println("최근 5일 주문 상태 갯수 검색 실패 " + e.getMessage());
		}
		
		return cnt; 
	}

	@Override
	public int recentOrderCnt(HashMap<String, Object> map) {
		int cnt = 0;  
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			cnt = adminOrderMapper.recentOrderCnt(map);
		}catch(Exception e) {
			System.out.println("최근 5일 주문 갯수 검색 실패 " + e.getMessage());
		}
		
		return cnt; 
	}

	@Override
	public int recentOrderWeeklyCnt(HashMap<String, Object> map) {
		int cnt = 0;  
		try {
			Admin_order adminOrderMapper = sqlSession.getMapper(Admin_order.class);
			cnt = adminOrderMapper.recentOrderWeeklyCnt(map);
		}catch(Exception e) {
			System.out.println("최근 5주 주문 갯수 검색 실패 " + e.getMessage());
		}
		
		return cnt; 
	}



}
