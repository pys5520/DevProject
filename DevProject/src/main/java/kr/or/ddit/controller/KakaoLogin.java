package kr.or.ddit.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IKakaoService;
import kr.or.ddit.service.impl.KakaoServiceImpl;
import kr.or.ddit.vo.KakaoVO;

@Controller
@RequestMapping("/kakao")
public class KakaoLogin {
	
	@Inject
	private KakaoServiceImpl service;
	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		
		String access_Token = service.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		
		return "kakaoLoginForm";
    	}
}

















