package kr.or.ddit.service;

import kr.or.ddit.vo.KakaoVO;

public interface IKakaoService {

	public String getAccessToken(String code);

	public KakaoVO getUserInfo(String access_Token);

}
