package com.challenger.system.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Test implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1614572233437756161L;

	private String clientIp;
	
	private Timestamp insertTm;

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public Timestamp getInsertTm() {
		return insertTm;
	}

	public void setInsertTm(Timestamp insertTm) {
		this.insertTm = insertTm;
	}
}
