package com.spring.setak;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Admin_MendingKeepController {

	@Autowired()
	private Admin_MendingKeepService mendingKeepService;
		
	@RequestMapping(value="/getKeepList.do", produces="application/json;charset=UTF-8")
	public List<Object> getKeepList() {
		List<Object> list = mendingKeepService.getKeepList();
		
		return list;
	}
}
