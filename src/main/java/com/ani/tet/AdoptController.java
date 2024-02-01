package com.ani.tet;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ani.service.AdoptAnimalServiceImplement;
import com.ani.vo.AdoptAnimalApplicationVO;

@Controller
public class AdoptController {
	
	@Inject
	AdoptAnimalServiceImplement adoptAnimalService;
	
	//신청서 작성페이지
	@RequestMapping(value = "apply", method = RequestMethod.GET)
	public String apply(Locale locale, Model model) {
		return "testApply";
	}
	
	//신청서 제출하기
	@RequestMapping(value = "applyInsert", method = RequestMethod.POST)
	public String insert(Locale locale, AdoptAnimalApplicationVO adoptVo) {
		//name으로 자동으로 값을 넣어줌
		//쿼리문은 insert into
		System.out.println("컨트롤러 : "+adoptVo.getMember_nickname());
		System.out.println("컨트롤러 동물번호 : "+adoptVo.getAnimal_num());
		adoptAnimalService.insertAdoptAnimal(adoptVo);
		
		return "redirect:/";
	}
	// 신청서 제출 여부 확인
	@RequestMapping(value = "adoptChk", method = RequestMethod.GET)
	@ResponseBody
	public Integer adoptChk(@RequestParam("info") String info, @RequestParam("type") String type) {
		return adoptAnimalService.selectAdoptChk(info,type);
	}

	
}
