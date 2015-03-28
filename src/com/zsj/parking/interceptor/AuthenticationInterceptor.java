package com.zsj.parking.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.zsj.parking.vo.Users;

public class AuthenticationInterceptor implements Interceptor {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		System.out.println("inside auth interceptor");
        Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();
         
        Users user = (Users) sessionAttributes.get("userinfo");
         
        if(user == null){
            return Action.LOGIN;
        }else{
            //Action action = (Action) actionInvocation.getAction();
           /* if(action instanceof UserAware){
                ((UserAware) action).setUser(user);
            }*/
            return actionInvocation.invoke();
        }
	}

}
