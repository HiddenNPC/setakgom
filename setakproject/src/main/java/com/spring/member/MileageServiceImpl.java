package com.spring.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MileageMapper;

@Service
public class MileageServiceImpl implements MileageService {


	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public int getSum(String member_id) {
		int sum = 0;
		try {
			MileageMapper mileageMapper = sqlSession.getMapper(MileageMapper.class);
			sum = mileageMapper.getSum(member_id);
		} catch(Exception e) {
			System.out.println("적립금 총합 계산 실패" + e.getMessage());
		}
		return sum; 
	}


	@Override
	public int useMileage(MileageVO mvo) {
		int res = 0;
		try {
			MileageMapper mileageMapper = sqlSession.getMapper(MileageMapper.class);
			res = mileageMapper.useMileage(mvo);
		} catch(Exception e) {
			System.out.println("적립금 사용 입력 실패" + e.getMessage());
		}
		return res; 
	}
}
