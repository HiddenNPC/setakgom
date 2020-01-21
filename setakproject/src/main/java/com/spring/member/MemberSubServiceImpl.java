package com.spring.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberSubMapper;

@Service
public class MemberSubServiceImpl implements MemberSubService{

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public MemberSubVO sub_list(MemberSubVO msv) {
		MemberSubVO mo = null;
		try {
			MemberSubMapper mapper = sqlsession.getMapper(MemberSubMapper.class);
			mo = mapper.sub_list(msv);
			System.out.println("하......");
			
		} catch (Exception e) {
			System.out.println("정기구독리스트가 올까?");
		}
		 return mo;
 	}
}
