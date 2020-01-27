package com.spring.setak;

public interface MendingKeepService {
	public int insertMending(MendingVO mending);
	public void insertMendingCart(MendingCartVO mendingcart);
	public int insertKeep(KeepVO keep);
	public void insertKeepCart(KeepCartVO keepcart);
	public int insertWash(WashingVO washing);
	public void insertWashingCart(WashingCartVO washingcart);
}
