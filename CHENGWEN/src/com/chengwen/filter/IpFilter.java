package com.chengwen.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;


  
public class IpFilter implements Filter{
	
	private static Logger logger=Logger.getLogger(IpFilter.class);
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String remoteIP = request.getRemoteAddr();// 获取访问服务器的IP
		HttpServletRequest httpServletRequest=(HttpServletRequest)request;
		logger.info("--------------------------> :"+httpServletRequest.getRequestURI());
		logger.info("--------------------------> remoteIP:"+request.getRemoteAddr());
		logger.info("--------------------------> RemoteHost:"+request.getRemoteHost());
		logger.info("--------------------------> RemotePort:"+request.getRemotePort()+"\n\n");
		
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
