package com.ani.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ani.vo.MemberBoardVO;
import com.ani.vo.PageVO;

@Repository
public class MemberBoardDaoImplement implements IF_memberBoardDao{

	private static String mapperQuery="com.ani.dao.IF_memberBoardDao";
	
	@Inject
	SqlSession sqlSession;
	
	//회원게시물 insert
	@Override
	public void insertBoard(MemberBoardVO memberBoardVo) {
		sqlSession.insert(mapperQuery+".insertBoard",memberBoardVo);
	}

	//회원게시물 첨부파일 insert
	@Override
	public void insertFiles(String file) {
		sqlSession.insert(mapperQuery+".insertFile", file);
	}

	//회원게시물 selectAll
	@Override
	public List<MemberBoardVO> selectAllMemberBoard(PageVO pageVo) {
		return sqlSession.selectList(mapperQuery+".selectAllMemberBoard", pageVo);
	}

	//회원게시물 카운트
	@Override
	public Integer selectCountMemberBoard() {
		return sqlSession.selectOne(mapperQuery+".selectCountMemberBoard");
	}
	
	//회원게시물 selectOne - 정보
	@Override
	public MemberBoardVO selectOneMemberBoard(String viewNum) {
		return sqlSession.selectOne(mapperQuery+".selectOneMemberBoard", viewNum);
	}

	//회원게시물 selectOne - 첨부파일
	@Override
	public List<String> selectOneMemberFiles(String viewNum) {
		return sqlSession.selectList(mapperQuery+".selectOneMemberFiles", viewNum);
	}

	//조회수 업데이트
	@Override
	public void updateCnt(String viewNum) {
		sqlSession.update(mapperQuery+".updateCnt", viewNum);
	}

	//게시물 삭제
	@Override
	public void deleteBoard(String boardNo) {
		sqlSession.delete(mapperQuery+".deleteBoard", boardNo);
	}

	//게시물 수정하기
	@Override
	public void updateBoard(MemberBoardVO memberBoardVo) {
		System.out.println("게시물 수정하기 repository : "+sqlSession.update(mapperQuery+".updateBoard",memberBoardVo));
	}

	//나만보기 게시물 카운트
	@Override
	public Integer selectCountMember(String memberNickname) {
		return sqlSession.selectOne(mapperQuery+".selectCountMember",memberNickname);
	}
	
	// 게시물 selectAll
	@Override
	public List<MemberBoardVO> selectMemberBoard(HashMap<String, Object> params) {
		//내가 작성한 게시물
		if(params.get("case").equals("나만보기")) {		
			return sqlSession.selectList(mapperQuery+".selectMemberBoard",params);
		}else { // case == "검색하기"
		//제목 검색 게시물
			return sqlSession.selectList(mapperQuery+".selectTitle",params);
		}
	}

}
