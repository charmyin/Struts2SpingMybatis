package com.challenger.system.dao;

import org.springframework.stereotype.Service;

import com.challenger.system.entity.Test;

@Service
public interface TestConnectionDao {

	public int insertTest(Test test);
	
}
