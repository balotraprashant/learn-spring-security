package com.hustlecrafts.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		UserBuilder users = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication()
		.withUser(users.username("prashant").password("balotra").roles("EMPLOYEE", "ADMIN"))
		.withUser(users.username("sudhanshu").password("balotra").roles("EMPLOYEE", "MANAGER"))
		.withUser(users.username("astu").password("balotra").roles("EMPLOYEE"));
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/systems/**").hasRole("ADMIN")
			.antMatchers("/leaders/**").hasRole("MANAGER")
			.and()
			.formLogin()
				.loginPage("/showLoginForm")
				.loginProcessingUrl("/authenticate")
				.permitAll()
			.and()
			.logout().permitAll()
			.and()
			.exceptionHandling()
			.accessDeniedPage("/access-denied");
	}
}
