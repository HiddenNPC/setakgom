package com.spring.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public MemberVO member_list(MemberVO mo) {
		 MemberVO mvo = null;
		 try {
			 MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			 mvo = mapper.member_list(mo);
		 } catch(Exception e) {
				System.out.println("멤버 리스트 검색 실패" + e.getMessage());
		 }
		 
		 return mvo;
	}
	
	@Override 
	public int member_id(MemberVO mo) {
		int res = 0;
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		String id = mapper.member_id(mo);
		
		try {
					if(id != null) {
						String dbpassid = id;
						if(dbpassid.equals(mo.getMember_id())) {
							res = 1; //아이디중복
						}
					}
				} catch (Exception e) {
					System.out.println("아이디 중복 확인 실패" + e.getMessage());
					 res = -1;
				}
				 return res;
	}
	
	@Override
	public int member_insert(MemberVO mo) {
		 int res = 0;
		 try {
			 MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			 mapper.member_insert(mo);
			
		 } catch(Exception e) {
				System.out.println("멤버 추가 실패" + e.getMessage());
				res = 0;
		 }
		 
		 return res;
	}
	
	@Override
	public int member_password(MemberVO mo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		int res = 0;
		//System.out.println("mo id="+mo.getMember_id());
		//System.out.println("mo="+mo.getMember_password());
		String passwd = mapper.member_password(mo);
		//System.out.println("passwd="+passwd);
	
		try {
			if(passwd != null) {
				String dbpasswd = passwd;
				if(dbpasswd.equals(mo.getMember_password())) {
					res = 1; //비밀번호 일치
				}
			}
		} catch (Exception e) {
			System.out.println("비밀번호 일치 실패" + e.getMessage());
			 res = -1;
		}
		 return res;
	}
	
	@Override
	public int member_update(MemberVO mo) {
		int res = 0;
		try {
			MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			mapper.member_update(mo);
			res = 1;
		} catch(Exception e) {
			System.out.println("멤버 수정 실패" + e.getMessage());
			 res = 0;
		}
		 return res;
	}
	
	@Override
	public int member_delete(String member_id) {
		int res = 0;
		try {
			MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			mapper.member_delete(member_id);
			res = 1;
		} catch(Exception e) {
			System.out.println("멤버 삭제 실패" + e.getMessage());
			res = 0;
		}
		 return res;
	}
}