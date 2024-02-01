package com.ani.dao;

import java.util.HashMap;

import com.ani.vo.MemberVO;

public interface IF_memberDao {
	
	public void insertOne(MemberVO memberVo);
	public MemberVO selectOne(MemberVO memberVo);
	public int idchk(String memberId);
	public int nickchk(String memberNick);
	public MemberVO login(MemberVO memberVo);
	public void insertImg(HashMap<String, String> params);
	public String selectFile(String mid);

}
