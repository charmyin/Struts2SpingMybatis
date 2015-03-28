package com.struts.utils;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class SessionUtils {
	/**
	 * 获取Session
	 * @return
	 */
	public static Map getSession(){
		ActionContext actionContext = ActionContext.getContext();   
        Map session = actionContext.getSession();   
        return session;
	}
}
