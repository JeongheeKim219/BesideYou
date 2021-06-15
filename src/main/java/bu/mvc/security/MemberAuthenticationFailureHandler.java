package bu.mvc.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

/**
 *  Spring Security 내부에서 인증에 실패했을때 호출되어지는 클래스
 * */
@Service	// id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		
		
		request.setAttribute("errorMessage", exception.getMessage());
		
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
		
	}

}

/*
 * 일반유저 -ROLE_USER 상담사 -ROLE_USER + -ROLE_Co
 * 
 * 관리자 - -ROLE_USER , ROLE_ADMIN
 */