package com.ani.tet;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ani.service.IF_memberBoardService;
import com.ani.util.FileDataUtil;
import com.ani.vo.MemberBoardVO;
import com.ani.vo.MemberVO;
import com.ani.vo.PageVO;

@Controller
public class BoardController {
	
	@Inject
	IF_memberBoardService memberBoardService;
	
	@Inject
	FileDataUtil fileData;
	
	//게시물 insert
	@RequestMapping(value = "memberBoard", method = RequestMethod.POST)
	public String memberBoardInsert(Model model, @ModelAttribute MemberBoardVO memberBoardVo , MultipartFile[] file) throws Exception{

		String[] filesName = fileData.fileUpload(file);
		memberBoardVo.setBoard_file(filesName);
		memberBoardService.insert(memberBoardVo);
		
		 return "redirect:board";
		//return "redirect:board?show="+ URLEncoder.encode("전체보기", "UTF-8");
	}
	
	//게시판페이지
	@RequestMapping(value = "board", method = RequestMethod.GET) //
	public String board(Model model, @ModelAttribute PageVO pageVo, HttpSession session, HttpServletResponse response, @RequestParam(name="show", defaultValue="전체보기") String show) {

		if(pageVo.getPage() == null) {
			pageVo.setPage(1);
		}
		
		//pageVo.setTotalCount(memberBoardService.selectCountMemberBoard());
		//System.out.println("페이지 : "+pageVo.getPage());
		
		//List<MemberBoardVO> memberBoardList = memberBoardService.selectAllMemberBoard(pageVo);
		
		List<MemberBoardVO> memberBoardList;
		
		if(show.equals("전체보기")) {	
			pageVo.setTotalCount(memberBoardService.selectCountMemberBoard());
			memberBoardList = memberBoardService.selectAllMemberBoard(pageVo);
			
			Cookie cookie = new Cookie("pageTitle", "전체보기");
			
			response.addCookie(cookie);
			System.out.println("전체보기 쿠키 : "+cookie.getValue());
			
		}else { //if(show.equals("나만보기"))
			MemberVO mvo =(MemberVO)session.getAttribute("login");
			String memberNickname = mvo.getMember_nickname();
			//System.out.println("컨트롤러 닉네임 : "+memberNickname);
			
			pageVo.setTotalCount(memberBoardService.selectCountMember(memberNickname));
			
			HashMap<String , Object> params = new HashMap<String , Object>();
			
			params.put("case",  "나만보기");
			params.put("startNo",pageVo.getStartNo());
			params.put("endNo",pageVo.getEndNo());
			params.put("memberNick",memberNickname);
			
			memberBoardList = memberBoardService.selectMemberBoard(params);
			
			Cookie cookie = new Cookie("pageTitle", "나만보기");
			
			response.addCookie(cookie);
			System.out.println("나만보기 쿠키 : "+cookie.getValue());
		}
		
		//-------------------------------------------
		
		model.addAttribute("memberBoard",memberBoardList);
		model.addAttribute("pageVo",pageVo);
		
		//System.out.println(memberBoardList.get(0).getCnt());
		//System.out.println(memberBoardList.get(0).getMemberBoard_title());
		return "mainMemberBoard";
	}
	
	//게시판 상세페이지 - 정보가져오기
	@RequestMapping(value = "memberBoardView", method = RequestMethod.GET)
	@ResponseBody
	public MemberBoardVO boardView(Model model,@RequestParam("viewNum") String viewNum) {
		//조회수 업데이트
		memberBoardService.updateCnt(viewNum);
		
		MemberBoardVO memberBoardVo = memberBoardService.selectOneMemberBoard(viewNum);
		
		List<String> files = memberBoardService.selectOneMemberFiles(viewNum);
		
		//model.addAttribute("files",files);

		String[] file = new String[files.size()];
		
		for(int i=0; i<file.length; i++) {
			file[i]=files.get(i);
		}
		memberBoardVo.setBoard_file(file);
		
		
		return memberBoardVo;
	}
	//게시물 삭제하기
	@RequestMapping(value = "deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(HttpServletRequest request,Model model,@RequestParam("boardNo") String boardNo) {
		
		memberBoardService.deleteBoard(boardNo);
		
		return "redirect:/board";
	}
	
	//게시물 수정하기
	@RequestMapping(value = "memberBoardUpdate", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute MemberBoardVO memberBoardVo) {
		memberBoardService.updateBoard(memberBoardVo);
		return "redirect:board";
	}
	

	//제목검색하기
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(Model model, @ModelAttribute PageVO pageVo) {
		
		return "testSearch";
	}
}
