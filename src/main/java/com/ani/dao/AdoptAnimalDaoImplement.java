package com.ani.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ani.vo.AdoptAnimalApplicationVO;

@Repository
public class AdoptAnimalDaoImplement implements IF_adoptAnimalDao{
	
	private static String mapperQuery = "com.ani.dao.IF_adoptAnimalDao";
	
	@Inject
	private SqlSession sqlSession;

	//입양신청서 제출
	@Override
	public void insertAdoptAnimal(AdoptAnimalApplicationVO adoptVo) {
		sqlSession.insert(mapperQuery+".insertAdoptAnimal",adoptVo);
	}

	//입양신청서 정보 가져오기
	@Override
	public AdoptAnimalApplicationVO selectAdoptAnimal(String memberEmail) {
		return sqlSession.selectOne(mapperQuery+".selectAdoptAnimal",memberEmail);
	}

	//입양신청서 제출 여부 확인하기
	@Override
	public Integer selectAdoptChk(String info, String type) {
		//한 회원당 한번에 하나의 입양신청서 제출 가능
		if(type.equals("회원")) {
			String memberNick = info;
			return sqlSession.selectOne(mapperQuery+".selectAdoptChk",memberNick);
		}else {
		//한 유기동물 당 한번에 하나의 입양신청서 제출 가능
			String animalNum = info; // = "동물"
			return sqlSession.selectOne(mapperQuery+".selectAnimalAdoptChk",animalNum);
		}
		
	}

}
