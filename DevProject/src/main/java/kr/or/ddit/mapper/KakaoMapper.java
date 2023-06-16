package kr.or.ddit.mapper;

import java.util.HashMap;

import kr.or.ddit.vo.KakaoVO;

public interface KakaoMapper {

	public KakaoVO getKakao(HashMap<String, Object> userInfo);

	public void kakaoInsert(HashMap<String, Object> userInfo);

}
