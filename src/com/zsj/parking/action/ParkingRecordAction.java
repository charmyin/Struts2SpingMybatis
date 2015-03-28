package com.zsj.parking.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.challenger.system.services.TestConnectionService;
import com.common.utils.UUIDGenerator;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.struts.utils.SessionUtils;
import com.zsj.parking.dao.ParkingRecordMapper;
import com.zsj.parking.dao.UsersMapper;
import com.zsj.parking.vo.ParkingPlace;
import com.zsj.parking.vo.ParkingRecord;
import com.zsj.parking.vo.Users;


public class ParkingRecordAction extends ActionSupport {
	
	@Resource
	private ParkingRecordMapper parkingRecordMapper;
	
	private List<ParkingRecord> parkingRecordList = new ArrayList<ParkingRecord>();
	
	ParkingRecord parkingRecordVO;// = new ParkingRecord();
	
	@Resource
	private UsersMapper usersMapper;
	
	//停车记录ID
	private String parkingRecordId;
	
	//用于导航菜单确定位置
	private String navname="record";
	
	private String typeaheadString="[]";
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
	 * 新增停车记录页面
	 * @return
	 */
	public String toAddParkingRecord(){
		List<Users> users = usersMapper.selectAll();
		ObjectMapper mapper = new ObjectMapper();
		try {
			typeaheadString = mapper.writeValueAsString(users);
			
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}

	/**
	 * 修改停车记录页面
	 * @return
	 */
	public String toEditParkingRecord(){
		List<Users> users = usersMapper.selectAll();
		ObjectMapper mapper = new ObjectMapper();
		try {
			typeaheadString = mapper.writeValueAsString(users);
			
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		parkingRecordVO = parkingRecordMapper.selectByPrimaryKey(parkingRecordId);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 删除停车记录
	 */
	public String deleteParkingRecord(){
		parkingRecordMapper.deleteByPrimaryKey(parkingRecordId);
		return Action.SUCCESS;
	}
	/**
	 * 停车记录列表
	 * @return
	 */
	public String listParkingRecord(){
		parkingRecordVO = new ParkingRecord();
		//管理员返回所有停车位信息
		if(SessionUtils.getSession().get("role").toString().equals("admin")){
			this.parkingRecordList = parkingRecordMapper.selectAll();
			return Action.SUCCESS;
		}
		//业主只返回自己的停车位置信息
		Users user = (Users)SessionUtils.getSession().get("userinfo");
		parkingRecordVO.setUserid(user.getId());
		this.parkingRecordList = parkingRecordMapper.selectAllEqual(parkingRecordVO);
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

	public String getTypeaheadString() {
		return typeaheadString;
	}

	public void setTypeaheadString(String typeaheadString) {
		this.typeaheadString = typeaheadString;
	}
	
	
}
