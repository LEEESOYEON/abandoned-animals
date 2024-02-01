package com.ani.dao;

import com.ani.vo.AdoptAnimalApplicationVO;

public interface IF_adoptAnimalDao {
	
	public void insertAdoptAnimal(AdoptAnimalApplicationVO adoptVo);
	
	public AdoptAnimalApplicationVO selectAdoptAnimal(String memberEmail);
	
	public Integer selectAdoptChk(String info, String type);
	

}
