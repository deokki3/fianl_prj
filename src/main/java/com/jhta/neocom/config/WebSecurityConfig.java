package com.jhta.neocom.config;

import javax.sql.DataSource;


import com.jhta.neocom.service.CustomSecurityUsersService;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@RequiredArgsConstructor
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
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/static/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // http.authorizeRequests().antMatchers("/**").permitAll().anyRequest().authenticated().and().httpBasic();
        // http.cors().and();
        http.csrf().disable();
        http.authorizeRequests() // 해당 메소드 아래는 각 경로에 따른 권한을 지정할 수 있다.

                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/member/**").hasAnyRole("ADMIN", "MANAGER", "USER")
                .antMatchers("/**").permitAll()//.and().formLogin()    
                .and().formLogin()
                .loginPage("/account/login") // 로그인이 수행 될 경로
                .loginProcessingUrl("/account/login")// 로그인form의 action과 일치시켜주어야 함.
                .defaultSuccessUrl("/") // 로그인 성공 시 이동할 경로.
                .failureUrl("/account/login?error=true").permitAll() // 인증에 실패했을 때 보여주는 화면 url, 로그인 form으로 파라미터값
                                                                     // error=true로 보낸

                .and().logout().permitAll().logoutUrl("/account/logout").logoutSuccessUrl("/").and().exceptionHandling()
                .accessDeniedPage("/account/denied"); // 권한이 없는 대상이 접속을시도했을 때
       

        http.rememberMe().key("jpa").userDetailsService(customSecurityUsersService).tokenRepository(tokenRepository());
    }

}