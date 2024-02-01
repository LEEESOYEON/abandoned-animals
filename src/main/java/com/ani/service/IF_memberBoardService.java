package com.ani.service;

import java.util.HashMap;
import java.util.List;

import com.ani.vo.MemberBoardVO;
import com.ani.vo.PageVO;

public interface IF_memberBoardService {
	
	public void insert(MemberBoardVO memberBoardVo);
	public List<MemberBoardVO> selectAllMemberBoard(PageVO pageVo);
	public MemberBoardVO selectOneMemberBoard(String viewNum);
	public List<String> selectOneMemberFiles(String viewNum);
	public void updateCnt(String viewNum);
	public Integer selectCountMemberBoard();
	public void deleteBoard(String boardNo);
	public void updateBoard(MemberBoardVO memberBoardVo);
	
	public Integer selectCountMember(String memberNickname);
	public List<MemberBoardVO> selectMemberBoard(HashMap<String,Object> params);

}
