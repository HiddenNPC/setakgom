package com.spring.community;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class QnaVO 
{
	private int qna_num;
	private String member_id;
	private String qna_type;
	private long order_num;
	private String qna_title;
	private String qna_content;
	private String qna_date;
	private String qna_file;
	private String qna_check;	
	private String qna_scr;
	private String qna_pass;
	
}
