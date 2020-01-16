package com.spring.setak;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService; 
	
	// 배송지 리스트
	@RequestMapping(value = "/getAddrList.st", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody 
	public List<AddressVO> getAddrList(AddressVO avo) {
		String member_id = avo.getMember_id();
		
		System.out.println(member_id);
		System.out.println(avo.getAddress_human());
		List<AddressVO> list = addressService.getAddressList(member_id);
		
		System.out.println(list.get(0).getAddress_loc());

		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
			System.out.println(str);
		} catch(Exception e) {
			System.out.println("배송지 리스트 컨트롤러 오류 : " + e.getMessage());
		}

		//return str;
		return list;
	}
	

	
	// 신규 배송지 저장 
	@RequestMapping(value = "/AddrAddAction.st", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> addressAdd(AddressVO avo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = addressService.insertAddress(avo);
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal; 
	}
	
	// 배송지 수정
	
	// 배송지 삭제
	
}
