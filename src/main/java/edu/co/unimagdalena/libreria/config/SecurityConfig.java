package edu.co.unimagdalena.libreria.config;

import static edu.co.unimagdalena.libreria.config.Constants.LOGIN_URL;
import static edu.co.unimagdalena.libreria.config.Constants.ROUTES_ACCESS_REGEX;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(encodePWD());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http
			.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
			.cors().and()
			.authorizeRequests().antMatchers(HttpMethod.POST, LOGIN_URL, "/logout").permitAll()
			.antMatchers(HttpMethod.GET, "/signup","/favicon.ico", "/robots.txt").permitAll()
			.regexMatchers(HttpMethod.GET, ROUTES_ACCESS_REGEX).permitAll()
			.anyRequest().authenticated().and()
			.logout().logoutSuccessUrl("/login").and()
			.formLogin()
			.loginPage("/login")
			.permitAll().and()
				.addFilter(new JWTAuthenticationFilter(authenticationManager()))
				.addFilter(new JWTAuthorizationFilter(authenticationManager()));
	}

	@Bean
	public BCryptPasswordEncoder encodePWD() {
		return new BCryptPasswordEncoder();
	}
	

	@Bean
	CorsConfigurationSource corsConfigurationSource() {
		final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", new CorsConfiguration().applyPermitDefaultValues());
		return source;
	}
}