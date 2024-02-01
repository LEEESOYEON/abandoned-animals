package com.ani.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ani.vo.MemberVO;

@Repository
public class MemberDaoImplement implements IF_memberDao{
	
	private static String mapperQuery = "com.ani.dao.IF_memberDao";
	
	@Inject
	private SqlSession sqlSession;

	//회원가입
	@Override
	public void insertOne(MemberVO memberVo) {
		sqlSession.insert(mapperQuery+".insertOne", memberVo);
	}

	//
	@Override
	public MemberVO selectOne(MemberVO memberVo) {
		return sqlSession.selectOne(mapperQuery+",selectOne", memberVo);
	}

	@Override
	public int idchk(String memberId) {
		return sqlSession.selectOne(mapperQuery + ".idChk", memberId); 
	}

	@Override
	public int nickchk(String memberNick) {
		return sqlSession.selectOne(mapperQuery + ".nickChk", memberNick);
	}

	@Override
	public MemberVO login(MemberVO memberVo) {
		return sqlSession.selectOne(mapperQuery+".Login" , memberVo);
	}

	// 마이페이지 이미지 insert
	@Override
	public void insertImg(HashMap<String, String> params) {
		sqlSession.insert(mapperQuery+".insertImg",params);
	}

	// 마이페이지 이미지 select
	@Override
	public String selectFile(String mid) {
		return sqlSession.selectOne(mapperQuery+".selectFile",mid);
	}

}
