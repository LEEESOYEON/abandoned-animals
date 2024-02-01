package com.ani.tet;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ani.service.IF_memberBoardService;
import com.ani.vo.MemberBoardVO;
import com.ani.vo.PageVO;

@RestController
@RequestMapping("titleBoard")
public class SearchController {
	
	@Inject
	IF_memberBoardService memberBoardService;

	//제목검색 selectAll
	@GetMapping("/{title}")
	public List<MemberBoardVO> getBoardByTitle(@PathVariable String title,@ModelAttribute PageVO pageVo){
		//@PathVariable : url 경로에서 특정 변수를 추출할 때 사용
		//		ex) /users/{userID} 에서 userID 추출
		//			-> @PathVariable Long userID
		//				음수값이 필요하지 않은 상황에서 많은 범위의 양수값을 저장하기 위해 Long 자료형 사용
		/*
		if(pageVo.getPage() == null) {
			pageVo.setPage(1);
		}
		pageVo.setStartNo(1);
		pageVo.setEndNo(10);
		*/
		
		HashMap<String , Object> params = new HashMap<String , Object>();
		
		params.put("case", "검색하기");
		//params.put("startNo",pageVo.getStartNo());
		//params.put("endNo",pageVo.getEndNo());
		params.put("boardTitle",title);
		
		return memberBoardService.selectMemberBoard(params);

	}
}
