package com.chengwen.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	protected HttpServletRequest getHttpServletRequest() {
		return (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	}
	protected void setSession(HttpServletRequest request, String key, Object obj) {
		request.getSession().setAttribute(key, obj);
	}
	protected Object getSession(HttpServletRequest request, String key) {
		return request.getSession().getAttribute(key);
	}
//	protected String getUserName(HttpServletRequest request) {
//		return (String)request.getSession().getAttribute(Constants.USERNAME_KEY);
//	}
	protected boolean isExistSession(HttpServletRequest request, String key) {
		if(request.getSession().getAttribute(key)!=null) {
			return true;
		}
		else {
			return false;
		}
	}
//	protected boolean isTimeOut(HttpServletRequest request) {
//		if(request.getSession().getAttribute(Constants.USERNAME_KEY)==null) {
//			return true;
//		}
//		else {
//			return false;
//		}
//	}
}
