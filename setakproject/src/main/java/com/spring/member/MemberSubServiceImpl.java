package com.spring.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberSubMapper;

@Service
public class MemberSubServiceImpl implements MemberSubService{

	@Autowired
	private SqlSession sqlsession;
	
	 //나의정기구독
	@Override
	public MemberSubVO sub_list(String member_id) {
		MemberSubVO msv = null;
		try {
			MemberSubMapper mapper = sqlsession.getMapper(MemberSubMapper.class);
			msv = mapper.sub_list(member_id);
		} catch (Exception e) {
			System.out.println("나의 정기구독"+e.getMessage());
		}
		return msv;
		
	}
	
	// 해당 정기구독 리스트
	@Override
	public  SubscribeVO subscribe_list(String member_id) {
		 SubscribeVO sv = null;
		try {
			MemberSubMapper mapper = sqlsession.getMapper(MemberSubMapper.class);
			sv = mapper.subscribe_list(member_id);
		} catch (Exception e) {
			System.out.println("정기구독 종류"+e.getMessage());
		}
		return sv;
		
	}
	
	/*
	// 정기구독 내역 리스트
		@Override
		public ArrayList<HistorySubVO> subhistory_list(String member_id){
			ArrayList<HistorySubVO> list = new ArrayList<HistorySubVO> ();
			
			try {
				MemberSubMapper mapper = sqlsession.getMapper(MemberSubMapper.class);
				list = mapper.subhistory_list(member_id);
			} catch (Exception e) {
				System.out.println("정기구독 리스트 실패ㅠ"+e.getMessage());
			}
			return list;
				
		}
	*/
	
	 // 정기구독 내역 리스트
	@Override
	public ArrayList<HistorySubVO> subhistory_list(HashMap<String, Object> map){
		ArrayList<HistorySubVO> list = new ArrayList<HistorySubVO> ();
		
		try {
			MemberSubMapper mapper = sqlsession.getMapper(MemberSubMapper.class);
			list = mapper.subhistory_list(map);
		} catch (Exception e) {
			System.out.println("정기구독 리스트 실패ㅠ"+e.getMessage());
		}
		return list;
			
	}
	
	// 정기구독 리스트 갯수
	@Override
	public int listcount(String member_id) {
		int count = 0;

		MemberSubMapper mapper = sqlsession.getMapper(MemberSubMapper.class);
		count = mapper.listcount(member_id);
		return count;
	}
	
}
