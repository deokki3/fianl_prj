package com.jhta.neocom.config;

import javax.sql.DataSource;

import com.jhta.neocom.service.CustomSecurityUsersService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private CustomSecurityUsersService customSecurityUsersService;

    @Autowired
    private DataSource dataSource;

    @Bean
    public PersistentTokenRepository tokenRepository() {
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
        return jdbcTokenRepository;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customSecurityUsersService);
        authProvider.setPasswordEncoder(passwordEncoder());

        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        super.configure(auth);
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // http.authorizeRequests().antMatchers("/**").permitAll().anyRequest().authenticated().and().httpBasic();
        // http.cors().and();
        http.csrf().disable();
        http.authorizeRequests() // 해당 메소드 아래는 각 경로에 따른 권한을 지정할 수 있다.
                .antMatchers("/", "/account/**", "/static/**", "/upload/**").permitAll().antMatchers("/admin")
                .hasRole("ADMIN") // 괄호의 권한을 가진 유저만 접근가능, ROLE_가 붙어서 적용 됨.즉, 테이블에 ROLE_권한명 으로 저장해야 함.
                .antMatchers("/user").hasRole("USER").anyRequest().authenticated() // 로그인된 사용자가 요청을 수행할 떄 필요하다 만약 사용자가
                                                                                   // 인증되지 않았다면, 스프링 시큐리티 필터는 요청을 잡아내고
                                                                                   // 사용자를 로그인페이지로 리다이렉션 해준다.
                .and().formLogin() // 하위에 내가 직접 구현한 로그인 폼, 로그인 성공시 이동 경로 설정 가능. , 로그인 폼의 아이디,패스워드는 username, //
                                   // password로 맞춰야 함
                .loginPage("/account/login") // 로그인이 수행될 경로.
                .loginProcessingUrl("/account/login")// 로그인form의 action과 일치시켜주어야 함.
                .defaultSuccessUrl("/") // 로그인 성공 시 이동할 경로.
                .failureUrl("/account/login?error=true").permitAll() // 인증에 실패했을 때 보여주는 화면 url, 로그인 form으로 파라미터값
                                                                     // error=true로 보낸
                .and().logout().permitAll().logoutUrl("/account/logout").logoutSuccessUrl("/").and().exceptionHandling()
                .accessDeniedPage("/account/denied"); // 권한이 없는 대상이 접속을시도했을 때

        http.rememberMe().key("jpa").userDetailsService(customSecurityUsersService).tokenRepository(tokenRepository());
    }

}
