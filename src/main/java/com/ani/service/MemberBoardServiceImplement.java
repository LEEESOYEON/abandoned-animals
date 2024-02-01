package com.ani.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ani.dao.IF_memberBoardDao;
import com.ani.vo.MemberBoardVO;
import com.ani.vo.PageVO;

@Service
public class MemberBoardServiceImplement implements IF_memberBoardService{
	
	@Inject
	IF_memberBoardDao memberBoardDao;

	//회원게시물 insert
	@Override
	public void insert(MemberBoardVO memberBoardVo) {
		memberBoardDao.insertBoard(memberBoardVo);
		String[] files = memberBoardVo.getBoard_file();
		if(files.length>0) {
			for(int i=0; i<files.length; i++) {
				if(files[i]!=null) {
					memberBoardDao.insertFiles(files[i]);
				}
			}
		}
	}

	//회원게시물 selectAll
	@Override
	public List<MemberBoardVO> selectAllMemberBoard(PageVO pageVo) {
		return memberBoardDao.selectAllMemberBoard(pageVo);
	}

	//회원게시물 카운트
	@Override
	public Integer selectCountMemberBoard() {
		return memberBoardDao.selectCountMemberBoard();
	}
	
	//회원게시물 selectOne - 정보
	@Override
	public MemberBoardVO selectOneMemberBoard(String viewNum) {
		return memberBoardDao.selectOneMemberBoard(viewNum);
	}

	//회원게시물 selectOne - 첨부파일
	@Override
	public List<String> selectOneMemberFiles(String viewNum) {
		return memberBoardDao.selectOneMemberFiles(viewNum);
	}

	//조회수 업데이트
	@Override
	public void updateCnt(String viewNum) {
		memberBoardDao.updateCnt(viewNum);
	}

	//게시물 삭제하기
	@Override
	public void deleteBoard(String boardNo) {
		memberBoardDao.deleteBoard(boardNo);
	}

	//게시물 수정하기
	@Override
	public void updateBoard(MemberBoardVO memberBoardVo) {
		memberBoardDao.updateBoard(memberBoardVo);
	}

	// 게시물 selectAll ( 내가 작성한 게시물 || 제목 검색 게시물 )
	@Override
	public List<MemberBoardVO> selectMemberBoard(HashMap<String, Object> params) {
		return memberBoardDao.selectMemberBoard(params);
	}
	
	//나만보기 게시물 카운트
	@Override
	public Integer selectCountMember(String memberNickname) {
		return memberBoardDao.selectCountMember(memberNickname);
	}

}
