package com.ani.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ani.dao.IF_memberDao;
import com.ani.vo.MemberVO;

@Service
public class MemberServiceImplement implements IF_memberService{
	
	@Inject
	IF_memberDao memberDao;

	@Override
	public void insermember(MemberVO memberVo) {
		memberDao.insertOne(memberVo);
	}

	@Override
	public MemberVO memberchk(MemberVO memberVo) {
		return memberDao.selectOne(memberVo);
	}

	@Override
	public int idchk(String memberId) {
		return memberDao.idchk(memberId);
	}

	@Override
	public int nickchk(String memberNick) {
		return memberDao.nickchk(memberNick);
	}

	@Override
	public MemberVO login(MemberVO memberVo) {
		return memberDao.login(memberVo);
	}

	// 마이페이지 이미지 insert
	@Override
	public void insertImg(HashMap<String, String> params) {
		memberDao.insertImg(params);
	}

	// 마이페이지 이미지 select
	@Override
	public String selectFile(String mid) {
		return memberDao.selectFile(mid);
	}

}
