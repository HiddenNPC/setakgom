package com.spring.setak;

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
	public ArrayList<WashingCartVO> getWashSeq(String member_id) {
		ArrayList<WashingCartVO> washingSeqList = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			washingSeqList = cartMapper.getWashSeq(member_id);

		}catch(Exception e) {
			System.out.println("세탁 리스트 시퀀스 검색 실패" + e.getMessage());
		}

		return washingSeqList;
	}

	@Override
	public WashingVO getWashingList(int wash_seq) {
		WashingVO washInfo = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			washInfo = cartMapper.getWashingList(wash_seq);
		}catch(Exception e) {
			System.out.println("세탁 리스트 검색 실패" + e.getMessage());
		}
		
		return washInfo;
	}

	@Override
	public ArrayList<KeepCartVO> getKeepSeq(String member_id) {
		ArrayList<KeepCartVO> keepSeqList = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			keepSeqList = cartMapper.getKeepSeq(member_id);
		}catch(Exception e) {
			System.out.println("보관 리스트 시퀀스 검색 실패" + e.getMessage());
		}
		
		return keepSeqList;
	}

	@Override
	public KeepVO getKeepList(int keep_seq) {
		KeepVO keepInfo = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			keepInfo = cartMapper.getKeepList(keep_seq);
		}catch(Exception e) {
			System.out.println("보관 리스트 검색 실패" + e.getMessage());
		}
		
		return keepInfo;
	}

	@Override
	public ArrayList<MendingCartVO> getMendingSeq(String member_id) {
		ArrayList<MendingCartVO> mendingSeqList = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			mendingSeqList = cartMapper.getMendingSeq(member_id);

		}catch(Exception e) {
			System.out.println("수선 리스트 시퀀스 검색 실패" + e.getMessage());
		}

		return mendingSeqList;
	}

	@Override
	public MendingVO getMendingList(int repair_seq) {
		MendingVO mendingInfo = null;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			mendingInfo = cartMapper.getMendingList(repair_seq);
		}catch(Exception e) {
			System.out.println("보관 리스트 검색 실패" + e.getMessage());
		}
		
		return mendingInfo;
	}

	@Override
	public int deleteWashCart(int wash_seq) {
		int res = 0;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			res = cartMapper.deleteWashCart(wash_seq);
		}catch(Exception e) {
			System.out.println("세탁 장바구니 삭제 실패" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int deleteWash(int wash_seq) {
		int res = 0;
		try {
			CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
			res = cartMapper.deleteWash(wash_seq);
		}catch(Exception e) {
			System.out.println("세탁 상품 삭제 실패" + e.getMessage());
		}
		
		return res;
	}		
	

	
}
