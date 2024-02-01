package com.ani.service;

import java.util.HashMap;

import com.ani.vo.MemberVO;

public interface IF_memberService {
	
	public void insermember(MemberVO memberVo);
	public MemberVO memberchk(MemberVO memberVo);
	public int idchk(String memberId);
	public int nickchk(String memberNick);
	public MemberVO login(MemberVO memberVo);
	
	public void insertImg(HashMap<String, String> params);
	public String selectFile(String mid);

}
