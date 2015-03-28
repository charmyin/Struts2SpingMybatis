package com.zsj.parking.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.challenger.system.services.TestConnectionService;
import com.common.utils.UUIDGenerator;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.zsj.parking.dao.ParkingRecordMapper;
import com.zsj.parking.vo.ParkingRecord;


public class ParkingRecordAction extends ActionSupport {
	
	@Resource
	private ParkingRecordMapper parkingRecordMapper;
	
	private List<ParkingRecord> parkingRecordList = new ArrayList<ParkingRecord>();
	
	ParkingRecord parkingRecordVO;// = new ParkingRecord();
	
	//用户ID
	private String parkingRecordId;
	
	//用于导航菜单确定位置
	private String navname="record";
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8286676643856005055L;
	private TestConnectionService testConnectionService;
	static Logger logger = Logger.getLogger(ParkingRecordAction.class);
	public String addParkingRecord()
	{
		//如果传来parkingRecordid，则认为是更新
		if(parkingRecordVO.getId()!=null){
			parkingRecordMapper.updateByPrimaryKeySelective(parkingRecordVO);
		}else{
			parkingRecordVO.setId(UUIDGenerator.generate());
			parkingRecordMapper.insert(parkingRecordVO);
		}
		return Action.SUCCESS;
	}

	/**
	 * 新增用户页面
	 * @return
	 */
	public String toAddParkingRecord(){
		return Action.SUCCESS;
	}

	/**
	 * 修改用户页面
	 * @return
	 */
	public String toEditParkingRecord(){
		parkingRecordVO = parkingRecordMapper.selectByPrimaryKey(parkingRecordId);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 删除用户
	 */
	public String deleteParkingRecord(){
		parkingRecordMapper.deleteByPrimaryKey(parkingRecordId);
		return Action.SUCCESS;
	}
	/**
	 * 用户列表
	 * @return
	 */
	public String listParkingRecord(){
		this.parkingRecordList = parkingRecordMapper.selectAll();
		return Action.SUCCESS;
	}

	
	
	public TestConnectionService getTestConnectionService() {
		return testConnectionService;
	}

	public void setTestConnectionService(TestConnectionService testConnectionService) {
		this.testConnectionService = testConnectionService;
	}

	public String getParkingRecordId() {
		return parkingRecordId;
	}

	public void setParkingRecordId(String parkingRecordId) {
		this.parkingRecordId = parkingRecordId;
	}

	public List<ParkingRecord> getParkingRecordList() {
		return parkingRecordList;
	}

	public void setParkingRecordList(List<ParkingRecord> parkingRecordList) {
		this.parkingRecordList = parkingRecordList;
	}

	public ParkingRecord getParkingRecordVO() {
		return parkingRecordVO;
	}

	public void setParkingRecordVO(ParkingRecord parkingRecordVO) {
		this.parkingRecordVO = parkingRecordVO;
	}

	public String getNavname() {
		return navname;
	}

	public void setNavname(String navname) {
		this.navname = navname;
	}
	
	
}
