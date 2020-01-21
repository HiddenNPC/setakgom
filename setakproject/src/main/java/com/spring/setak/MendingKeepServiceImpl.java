package com.spring.setak;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MendingKeepMapper;

@Service
public class MendingKeepServiceImpl implements MendingKeepService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMending(MendingVO mending) {
		MendingKeepMapper mendingkeepmapper = sqlSession.getMapper(MendingKeepMapper.class);
		mendingkeepmapper.insertMending(mending);
	}
	
	@Override
	public void insertKeep(KeepVO keep) {
		MendingKeepMapper mendingkeepmapper = sqlSession.getMapper(MendingKeepMapper.class);
		
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");

		Calendar start_cal = Calendar.getInstance();
		Calendar end_cal = Calendar.getInstance();
		start_cal.setTime(today);
		start_cal.add(Calendar.DATE, 1);
		end_cal.add(Calendar.DATE, 1);
		
		if(keep.getKeep_month()==1) {
			end_cal.add(Calendar.MONTH,1);
		} else if(keep.getKeep_month()==3) {
			end_cal.add(Calendar.MONTH,3);
		} else if(keep.getKeep_month()==6) {
			end_cal.add(Calendar.MONTH,6);
		}
		
		keep.setKeep_start(date.format(start_cal.getTime()));
		keep.setKeep_end(date.format(end_cal.getTime()));
		
		mendingkeepmapper.insertKeep(keep);
	}
}
