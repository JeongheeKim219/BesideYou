package bu.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import bu.mvc.security.MemberAuthenticationFailureHandler;
import bu.mvc.security.MemberAuthenticationProvider;



@Configuration
@EnableWebSecurity	// WebSecurityConfigurerAdapter�� �⺻Ŭ������ Ȯ���ϰ� ���� �޼ҵ���� ������ �Ͽ� Security���� ������ �����Ѵ�.
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private MemberAuthenticationFailureHandler memberAuthenticationFailureHandler;
	
	@Autowired
	private MemberAuthenticationProvider memberAuthenticationProvider;
	
	
	
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(memberAuthenticationProvider);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()	

		.antMatchers("/member/**").authenticated()



		.and()
		.formLogin()
		.loginPage("/member/login")
		.usernameParameter("id")
		.passwordParameter("password")
		.loginProcessingUrl("/login")	
		.defaultSuccessUrl("/")
		.failureHandler(memberAuthenticationFailureHandler)
		.and()
		.logout()
		.logoutUrl("/member/logout")
		.logoutSuccessUrl("/")
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		.and();
	}

}






