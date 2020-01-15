package com.spring.setak;

import java.util.ArrayList;

public interface AddressService {
	
	public ArrayList<AddressVO> getAddressList(String member_id);
	
	public int insertAddress(AddressVO avo); 
}
