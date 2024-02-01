package com.ani.tet;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ani.service.IF_adoptAnimalService;
import com.ani.service.IF_likeService;
import com.ani.service.IF_memberService;
import com.ani.vo.AdoptAnimalApplicationVO;
import com.ani.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Inject
	IF_adoptAnimalService aservice;
	
	@Inject
	IF_likeService lservice;
	
	@Inject
	IF_memberService mservice;

	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "mainHome";
	}

	// 상세페이지
	@RequestMapping(value = "viewDemo", method = RequestMethod.GET)
	public String view(Model model) {
		return "mainView";
	}

	// redirect 메인페이지
	@RequestMapping(value = "redirectMain", method = RequestMethod.POST)
	public String home2(Locale locale, Model model) {
		return "redirect:/";
	}

	// 보호소지도페이지
	@RequestMapping(value = "map", method = RequestMethod.GET)
	public String tmp(Locale locale, Model model) {
		return "testMap";
	}

	// 마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String myPage(Locale locale, Model model, HttpSession session) {
		//로그인정보
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		mvo = mservice.login(mvo);
		session.setAttribute("login",  mvo);
		//입양정보
		AdoptAnimalApplicationVO avo = aservice.selectAdoptAnimal(mvo.getMember_email());
		//관심정보
		List likelist = lservice.selectList(mvo.getMember_email());
		
		model.addAttribute("avo", avo);
		model.addAttribute("likelist",likelist);
		
		return "mypage";
	}

}
