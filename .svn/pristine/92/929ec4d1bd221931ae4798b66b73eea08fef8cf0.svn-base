package kr.or.ddit.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class EncodingFilter implements Filter{

	String enc;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		enc  = filterConfig.getInitParameter("encode");
	}

	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		
		req.setCharacterEncoding(enc);
		resp.setCharacterEncoding(enc);
		
		chain.doFilter(req, resp);
		
	}
	
}
