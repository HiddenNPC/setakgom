package com.spring.order;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<KeepCartVO> getKeepSeq(String member_id) {
		ArrayList<KeepCartVO> keepSeqList = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			keepSeqList = cartMapper.getKeepSeq(member_id);
			System.out.println("컨트롤러 keepSeq: " + keepSeqList.get(0).getKeep_seq());
		}catch(Exception e) {
			System.out.println("보관 리스트 시퀀스 검색 실패" + e.getMessage());
		}
		
		return keepSeqList;
	}
	
}
