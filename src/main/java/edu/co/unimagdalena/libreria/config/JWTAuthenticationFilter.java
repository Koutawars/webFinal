package edu.co.unimagdalena.libreria.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.service.CustomUserDetails;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import static edu.co.unimagdalena.libreria.config.Constants.TOKEN_BEARER_PREFIX;
import static edu.co.unimagdalena.libreria.config.Constants.HEADER_AUTHORIZACION_KEY;
import static edu.co.unimagdalena.libreria.config.Constants.TOKEN_EXPIRATION_TIME;
import static edu.co.unimagdalena.libreria.config.Constants.SUPER_SECRET_KEY;

public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
    private AuthenticationManager authenticationManager;

    public JWTAuthenticationFilter(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest req,
                                                HttpServletResponse res) throws AuthenticationException {
    	try {
            Client creds = new ObjectMapper()
                    .readValue(req.getInputStream(), Client.class);
            
            return authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            creds.getUsername(),
                            creds.getPassword(),
                            new ArrayList<>())
            );
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest req,
                                            HttpServletResponse res,
                                            FilterChain chain,
                                            Authentication auth) throws IOException, ServletException {

        String token = Jwts.builder().setIssuedAt(new Date())
				.setSubject(((CustomUserDetails)auth.getPrincipal()).getUsername())
				.setExpiration(new Date(System.currentTimeMillis() + TOKEN_EXPIRATION_TIME))
				.signWith(SignatureAlgorithm.HS512, SUPER_SECRET_KEY).compact();
        res.addHeader(HEADER_AUTHORIZACION_KEY, TOKEN_BEARER_PREFIX + " " + token);
    }
}