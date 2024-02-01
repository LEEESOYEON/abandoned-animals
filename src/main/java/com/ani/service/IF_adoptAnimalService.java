package com.ani.service;

import com.ani.vo.AdoptAnimalApplicationVO;

public interface IF_adoptAnimalService {
	
	public void insertAdoptAnimal(AdoptAnimalApplicationVO adoptVo);
	
	public AdoptAnimalApplicationVO selectAdoptAnimal(String memberEmail);
	
	public Integer selectAdoptChk(String info, String type);

}
