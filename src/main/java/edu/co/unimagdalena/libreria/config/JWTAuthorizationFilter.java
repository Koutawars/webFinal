package edu.co.unimagdalena.libreria.config;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import io.jsonwebtoken.Jwts;

import static edu.co.unimagdalena.libreria.config.Constants.TOKEN_BEARER_PREFIX;
import static edu.co.unimagdalena.libreria.config.Constants.HEADER_AUTHORIZACION_KEY;
import static edu.co.unimagdalena.libreria.config.Constants.SUPER_SECRET_KEY;

import static edu.co.unimagdalena.libreria.config.Constants.ROUTES_ACCESS_REGEX;


public class JWTAuthorizationFilter extends BasicAuthenticationFilter {

    public JWTAuthorizationFilter(AuthenticationManager authManager) {
        super(authManager);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest req,
                                    HttpServletResponse res,
                                    FilterChain chain) throws IOException, ServletException {
        String header = req.getHeader(HEADER_AUTHORIZACION_KEY);

        if (header == null || !header.startsWith(TOKEN_BEARER_PREFIX)) {
        	if(!req.getRequestURI().matches(ROUTES_ACCESS_REGEX))
        		res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            chain.doFilter(req, res);
            return;
        }
        try {
	        UsernamePasswordAuthenticationToken authentication = getAuthentication(req);
	        res.addHeader(HEADER_AUTHORIZACION_KEY, (String) authentication.getPrincipal());
	        SecurityContextHolder.getContext().setAuthentication(authentication);
        }catch(io.jsonwebtoken.SignatureException ex) {
        	res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
        
        chain.doFilter(req, res);
    }

    private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
        String token = request.getHeader(HEADER_AUTHORIZACION_KEY);
        if (token != null) {
            // parse the token.
            String user = Jwts.parser()
					.setSigningKey(SUPER_SECRET_KEY)
					.parseClaimsJws(token.replace(TOKEN_BEARER_PREFIX, ""))
					.getBody()
					.getSubject();
            if (user != null) {
                return new UsernamePasswordAuthenticationToken(user, null, new ArrayList<>());
            }
            return null;
        }
        return null;
    }
}