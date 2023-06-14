package kr.or.ddit.controller;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.KakaoService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/kakao")
public class KakaoController {
	
	@RequestMapping("/login")
	public String loginForm() {
		return "examples/kakaoLogin";
	}
	
	@GetMapping(value = "/kakaoLogin", produces = MediaType.APPLICATION_JSON_VALUE)
	@Description("Front로 부터 kakao Oauth를 받는다")
	public void getKakaoUserInfo(String code) {
	    System.out.println("OAuth Code : "+code);
	}
}