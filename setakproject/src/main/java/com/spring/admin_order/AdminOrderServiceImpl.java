package com.spring.admin_order;

import java.util.ArrayList;

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
			System.out.println("주소 리스트 검색 실패" + e.getMessage());
		}
		
		return orderList;
	}

}
