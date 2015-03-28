package com.challenger.system.action;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.challenger.system.services.TestConnectionService;
import com.common.utils.UUIDGenerator;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.zsj.parking.dao.UsersMapper;
import com.zsj.parking.vo.Users;


public class TestConnectionAction extends ActionSupport {
	
	@Resource
	private UsersMapper usersMapper;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8286676643856005055L;
	private TestConnectionService testConnectionService;
	static Logger logger = Logger.getLogger(TestConnectionAction.class);
	public String testConnection()
	{
		Users test = new Users();
		String clientIp = ServletActionContext.getRequest().getRemoteAddr();
		test.setId(UUIDGenerator.generate());
		test.setAddress("nanjing");
		test.setName("charmyin");
		test.setPassword("password");
		test.setPhone("12341324");
		Timestamp insertTm = new Timestamp(System.currentTimeMillis());
		usersMapper.insert(test);
		//test.setInserttm(insertTm);
		//testMapper.insert(test);
		logger.info("测试成功！" + clientIp + "时间：" + insertTm);
		return Action.SUCCESS;
	}

	public TestConnectionService getTestConnectionService() {
		return testConnectionService;
	}

	public void setTestConnectionService(TestConnectionService testConnectionService) {
		this.testConnectionService = testConnectionService;
	}

}
