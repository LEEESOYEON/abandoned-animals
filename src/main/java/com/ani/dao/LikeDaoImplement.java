package com.ani.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ani.vo.LikeVO;

@Repository
public class LikeDaoImplement implements IF_likeDao{
	private static String mapperQuery = "com.ani.dao.IF_likeDao";
	
	@Inject
	SqlSession sqlSession;
	
	//관심등록 insert
	@Override
	public void insert(LikeVO lvo) {
		
		sqlSession.insert(mapperQuery+".insert", lvo);
	}

	//관심등록 된 동물 리스트 selectAll
	@Override
	public List<LikeVO> selectList(String mid) {
		return sqlSession.selectList(mapperQuery+".selectAll", mid);
	}

	//관심등록 중복 방지
	@Override
	public int selectCont(HashMap<String, String> params) {
		return sqlSession.selectOne(mapperQuery+".selectCnt", params);
	}

	//관심 등록 취소
	@Override
	public void deleteLike(String likeNo) {
		sqlSession.delete(mapperQuery+".deleteLike",  likeNo);
	}

}
