package kr.or.ddit.security;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.DDITMemberVO;
import kr.or.ddit.vo.MemberVO;

public class CustomUserDetailsService implements UserDetailsService {
	
	private static final Logger log = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	//회원가입할때 pe를 불러서 pe.encode(password)를 해서 데이터베이스에 저장
	@Inject
	private BCryptPasswordEncoder pe;
	
	@Inject
	private LoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String password = "pwd1";
		
		//인코딩된 암호화 비밀번호
		log.info("#### 인코딩된 비밀번호 확인 #### : " + pe.encode(password));
		log.info("#### 인코딩된 비밀번호 확인 #### : " + pe.encode(password));
		log.info("#### 인코딩된 비밀번호 확인 #### : " + pe.encode(password));
		log.info("#### 인코딩된 비밀번호 확인 #### : " + pe.encode(password));
		log.info("#### 인코딩된 비밀번호 확인 #### : " + pe.encode(password));
		log.info("#### 인코딩된 비밀번호 확인 #### : " + pe.encode(password));
		
		//username은 사용자 !아이디! 이다
		//member를 가지고 최종 리턴해서 넘겨야할 UserDetails를 만든다
		log.info("load User by username : " + username);
		
		DDITMemberVO member;
		
		try {
			member = loginMapper.readByUserId(username);
			log.info("member : " + member);
			return member == null ? null : new CustomUser(member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
