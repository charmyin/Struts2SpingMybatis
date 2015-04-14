package com.zsj.parking.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.challenger.system.services.TestConnectionService;
import com.common.utils.UUIDGenerator;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zsj.parking.dao.UsersMapper;
import com.zsj.parking.vo.Users;


public class UserAction extends ActionSupport {
	
	@Resource
	private UsersMapper usersMapper;
	
	private List<Users> userList = new ArrayList<Users>();
	
	Users userVO;// = new Users();
	
	//用户ID
	private String userId;
	
	private String loginid;
	private String password;
	//返回页面的提示信息
	private String message;
	//用于导航菜单确定位置
	private String navname="user";
	//新密码
	private String newPassword;
	//新密码1
	private String newPassword1;
	//角色
	//private String role="user";
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8286676643856005055L;
	private TestConnectionService testConnectionService;
	static Logger logger = Logger.getLogger(UserAction.class);
	public String addUser()
	{
		//如果传来userid，则认为是更新
		if(userVO.getId()!=null){
			usersMapper.updateByPrimaryKeySelective(userVO);
		}else{
			userVO.setId(UUIDGenerator.generate());
			usersMapper.insert(userVO);
		}
		return Action.SUCCESS;
	}

	/**
	 * 新增用户页面
	 * @return
	 */
	public String toAddUser(){
		return Action.SUCCESS;
	}

	/**
	 * 修改用户页面
	 * @return
	 */
	public String toEditUser(){
		userVO = usersMapper.selectByPrimaryKey(userId);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 删除用户
	 */
	public String deleteUser(){
		usersMapper.deleteByPrimaryKey(userId);
		return Action.SUCCESS;
	}
	/**
	 * 用户列表
	 * @return
	 */
	public String listUsers(){
		this.userList = usersMapper.selectAll();
		for(Users user : userList)
		System.out.println(user.getName());
		return Action.SUCCESS;
	}

	/**
	 * 用户登录验证
	 * @return
	 */
	public String certificate(){
		
		 
		
		Users user = usersMapper.selectByLoginName(loginid);
		if(user==null){
			message="用户名不存在！";
			return Action.ERROR;
		}
		if(loginid!=null && password.equals(user.getPassword())){
			
			ActionContext actionContext = ActionContext.getContext();   
			  
	        Map session = actionContext.getSession();   
	        session.put("userinfo", user);  
			if(loginid.equals("admin")){
				session.put("role", "admin");   
			}else{
				session.put("role", "user");   
				return "simpleuser";
			}
			
			 
			
     		return Action.SUCCESS;
		}else{
			message="用户名或密码错误！";
		}
		return Action.ERROR;
	}
	
	/**
	 * 用户登录验证页面跳转
	 * @return
	 */
	public String toCertificate(){
		return Action.SUCCESS;
	}
	/**
	 * 退出
	 * @return
	 */
	public String logout(){
		ActionContext actionContext = ActionContext.getContext();   
		Map session = actionContext.getSession() ;
		if (session instanceof org.apache.struts2.dispatcher.SessionMap) {
		    try {
		        ((org.apache.struts2.dispatcher.SessionMap) session).invalidate();
		    } catch (IllegalStateException e) {
		    	e.printStackTrace();
		        logger.error(e.getMessage());
		    }
		}
        actionContext.setSession(null);
		return Action.SUCCESS;
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String changePassword(){
		ActionContext actionContext = ActionContext.getContext(); 
		Map session = actionContext.getSession();   
	    Object obj = session.get("userinfo");
	    Users user = (Users)obj;
	    if(user != null && user.getPassword().equals(password)){
	    	message="OK";
	    	user.setPassword(newPassword);
	    	usersMapper.updateByPrimaryKey(user);
	    	return Action.LOGIN;
	    }
	     else{
	    	message="原密码不正确！";
	    }
	    if(newPassword1!=null && !newPassword1.equals(newPassword)){
	    	message="新密码不一致！";
	    }
	    
		return Action.SUCCESS;
	}
	/**
	 * 修改密码页面
	 * @return
	 */
	public String toChangePassword(){    
		return Action.SUCCESS;
	}
	
	public TestConnectionService getTestConnectionService() {
		return testConnectionService;
	}

	public void setTestConnectionService(TestConnectionService testConnectionService) {
		this.testConnectionService = testConnectionService;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Users> getUserList() {
		return userList;
	}

	public void setUserList(List<Users> userList) {
		this.userList = userList;
	}

	public Users getUserVO() {
		return userVO;
	}

	public void setUserVO(Users userVO) {
		this.userVO = userVO;
	}

	public String getNavname() {
		return navname;
	}

	public void setNavname(String navname) {
		this.navname = navname;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getNewPassword1() {
		return newPassword1;
	}

	public void setNewPassword1(String newPassword1) {
		this.newPassword1 = newPassword1;
	}

	
	
}
