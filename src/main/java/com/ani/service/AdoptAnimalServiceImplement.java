package com.ani.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ani.dao.IF_adoptAnimalDao;
import com.ani.vo.AdoptAnimalApplicationVO;

@Service
public class AdoptAnimalServiceImplement implements IF_adoptAnimalService{
	
	@Inject
	IF_adoptAnimalDao adoptAnimalDao;

	//입양신청서 제출
	@Override
	public void insertAdoptAnimal(AdoptAnimalApplicationVO adoptVo) {
		adoptAnimalDao.insertAdoptAnimal(adoptVo);
	}

	//입양신청서 정보 가져오기
	@Override
	public AdoptAnimalApplicationVO selectAdoptAnimal(String memberEmail) {
		return adoptAnimalDao.selectAdoptAnimal(memberEmail);
	}

	//입양신청서 제출 여부 확인
	@Override
	public Integer selectAdoptChk(String info, String type) {
		return adoptAnimalDao.selectAdoptChk(info, type);
	}

}
