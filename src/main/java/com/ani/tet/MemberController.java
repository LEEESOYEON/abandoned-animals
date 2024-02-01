package com.ani.tet;

import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ani.service.IF_memberService;
import com.ani.util.FileDataUtil;
import com.ani.vo.MemberVO;


@Controller
public class MemberController {
	
	@Inject
	IF_memberService mservice;
	
	@Inject
	FileDataUtil fileData;
	
	@RequestMapping(value = "memberjoin", method = RequestMethod.GET)
	public String memberjoin(Locale locale, Model model) {
	
		return "memberJoin";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Locale locale, Model model,MemberVO memberVo) {
		
		mservice.insermember(memberVo);

		return "redirect:/";
	}

	@RequestMapping(value = "idchk", method = RequestMethod.POST)
	public @ResponseBody int idchk(Locale locale, Model model,@RequestParam("memberId") String memberId) {
		
		int result = mservice.idchk(memberId);
		
		return result;
	}
	
	@RequestMapping(value = "nickchk", method = RequestMethod.POST)
	public @ResponseBody int nickchk(Locale locale, Model model,@RequestParam("memberNick") String memberNick) {
		
		int result = mservice.nickchk(memberNick);
		
		return result;
	}
	@RequestMapping(value = "memberlogin", method = RequestMethod.GET)
	public String memberlogin(Locale locale, Model model, HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping(value = "loginpro", method = RequestMethod.POST) //, @RequestParam("referer") String referer
	public String loginpro(Locale locale, Model model, MemberVO memberVo,HttpSession session, @RequestParam("referer") String referer) {
		String returnURL="";
		if(session.getAttribute("login")!=null) {
			session.removeAttribute("login");
		}
		
		MemberVO mvo = mservice.login(memberVo);
		
		if(mvo!=null) { // 로그인 성공
			session.setAttribute("login", mvo);
			
			
			//session.setAttribute("mid", mvoo.getMid());
			
			//returnURL="redirect:/";
			/*
			HttpServletRequest request
			String referer = request.getHeader("Referer");
			System.out.println("이전페이지 : "+referer);
			*/
			
			//이전페이지 정보 클라이언트에서 받아와 리다이렉트
			returnURL="redirect:"+referer;
		}else {
			returnURL="redirect:memberlogin";
		}
		
		//model.addAttribute("mvoo", mvoo);
	
		return returnURL;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, MemberVO mvo,HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//사진등록
	@RequestMapping(value = "addFile", method = RequestMethod.POST)
	public String addfile(Locale locale, Model model, MultipartFile file,HttpSession session) throws Exception {
		String filesName = fileData.fileUpload(file);
		
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		String mid =mvo.getMember_email();
		
		HashMap<String,String> params =  new HashMap<String, String>();
		params.put("filesName", filesName);
		params.put("mid", mid);

		mservice.insertImg(params);
		
		return "redirect:/mypage";
	}
}