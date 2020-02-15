package com.spring.community;

import java.sql.Date;

public class QnaVO 
{
	private int QNA_NUM;
	private String MEMBER_ID;
	private String QNA_TYPE;
	private long ORDER_NUM;
	private String QNA_TITLE;
	private String QNA_CONTENT;
	private Date QNA_DATE;
	private String QNA_FILE;
	private String QNA_CHECK;	
	private String QNA_SCR;
	private String QNA_PASS;
	public int getQNA_NUM() {
		return QNA_NUM;
	}
	public void setQNA_NUM(int qNA_NUM) {
		QNA_NUM = qNA_NUM;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getQNA_TYPE() {
		return QNA_TYPE;
	}
	public void setQNA_TYPE(String qNA_TYPE) {
		QNA_TYPE = qNA_TYPE;
	}
	public long getORDER_NUM() {
		return ORDER_NUM;
	}
	public void setORDER_NUM(long oRDER_NUM) {
		ORDER_NUM = oRDER_NUM;
	}
	public String getQNA_TITLE() {
		return QNA_TITLE;
	}
	public void setQNA_TITLE(String qNA_TITLE) {
		QNA_TITLE = qNA_TITLE;
	}
	public String getQNA_CONTENT() {
		return QNA_CONTENT;
	}
	public void setQNA_CONTENT(String qNA_CONTENT) {
		QNA_CONTENT = qNA_CONTENT;
	}
	public Date getQNA_DATE() {
		return QNA_DATE;
	}
	public void setQNA_DATE(Date qNA_DATE) {
		QNA_DATE = qNA_DATE;
	}
	public String getQNA_FILE() {
		return QNA_FILE;
	}
	public void setQNA_FILE(String qNA_FILE) {
		QNA_FILE = qNA_FILE;
	}
	public String getQNA_CHECK() {
		return QNA_CHECK;
	}
	public void setQNA_CHECK(String qNA_CHECK) {
		QNA_CHECK = qNA_CHECK;
	}
	public String getQNA_SCR() {
		return QNA_SCR;
	}
	public void setQNA_SCR(String qNA_SCR) {
		QNA_SCR = qNA_SCR;
	}
	public String getQNA_PASS() {
		return QNA_PASS;
	}
	public void setQNA_PASS(String qNA_PASS) {
		QNA_PASS = qNA_PASS;
	}
	
	
}
