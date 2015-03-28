package com.challenger.system.services.impl;

import com.challenger.system.dao.TestConnectionDao;
import com.challenger.system.entity.Test;
import com.challenger.system.services.TestConnectionService;

public class TestConnectionServiceImpl implements TestConnectionService {
	
	private TestConnectionDao testConnectionDao;
	
	@Override
	public int insertTest(Test test) {
		
		return testConnectionDao.insertTest(test);
	}

	public TestConnectionDao getTestConnectionDao() {
		return testConnectionDao;
	}

	public void setTestConnectionDao(TestConnectionDao testConnectionDao) {
		this.testConnectionDao = testConnectionDao;
	}
	
}
