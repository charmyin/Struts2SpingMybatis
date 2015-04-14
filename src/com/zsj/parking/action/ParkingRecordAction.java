package com.zsj.parking.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.zsj.parking.dao.ParkingPlaceMapper;
import com.zsj.parking.dao.ParkingRecordMapper;
import com.zsj.parking.dao.UsersMapper;
import com.zsj.parking.vo.ParkingPlace;
import com.zsj.parking.vo.ParkingRecord;
import com.zsj.parking.vo.Users;


public class ParkingRecordAction extends ActionSupport {
	
	@Resource
	private ParkingRecordMapper parkingRecordMapper;
	
	private List<ParkingRecord> parkingRecordList = new ArrayList<ParkingRecord>();
	
	@Resource
	private ParkingPlaceMapper parkingPlaceMapper;
	
	ParkingRecord parkingRecordVO;// = new ParkingRecord();
	
	@Resource
	private UsersMapper usersMapper;
	
	//停车记录ID
	private String parkingRecordId;
	
	//用于导航菜单确定位置
	private String navname="record";
	
	private String typeaheadString="[]";
	
	private String typeaheadStringParking="[]";
	
	private String typeaheadStringParkingNot="[]";
	
	//开始时间
	private String startTime;
	//结束时间
	private String endTime;
	
	public Map responseJson;  
    public Map getResponseJson() {  
        return responseJson;  
    }  
    public void setResponseJson(Map responseJson) {  
        this.responseJson = responseJson;  
    }
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8286676643856005055L;
	private TestConnectionService testConnectionService;
	static Logger logger = Logger.getLogger(ParkingRecordAction.class);
	/**
	 * 添加或更新停车记录
	 * @return
	 */
	public String addParkingRecord()
	{
		ParkingPlace pp = new ParkingPlace();//parkingPlaceMapper.selectByPrimaryKey(parkingRecordVO.getParkingplaceid());
		pp.setId(parkingRecordVO.getParkingplaceid());
		pp.setStatus(parkingRecordVO.getInorout());
		parkingPlaceMapper.updateByPrimaryKeySelective(pp);
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
		ParkingPlace pp = new ParkingPlace();
		pp.setStatus(0);
		List<ParkingPlace> records = parkingPlaceMapper.selectAllEqual(pp);
		pp.setStatus(1);
		List<ParkingPlace> records1 = parkingPlaceMapper.selectAllEqual(pp);
		try {
			typeaheadString = mapper.writeValueAsString(users);
			typeaheadStringParking = mapper.writeValueAsString(records1);
			typeaheadStringParkingNot = mapper.writeValueAsString(records);
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
		ParkingPlace pp = new ParkingPlace();
		pp.setStatus(0);
		List<ParkingPlace> records = parkingPlaceMapper.selectAllEqual(pp);
		pp.setStatus(1);
		List<ParkingPlace> records1 = parkingPlaceMapper.selectAllEqual(pp);
		try {
			typeaheadString = mapper.writeValueAsString(users);
			typeaheadStringParking = mapper.writeValueAsString(records1);
			typeaheadStringParkingNot = mapper.writeValueAsString(records);
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
	 * 停车记表
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
	
	/**
	 * 计算时间段内的收入
	 * @return
	 */
	public String calculateSumMoney(){
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		Date startTimeDate=null;
		Date endTimeDate=null;
		try {
			startTimeDate = sdf.parse(startTime);
			endTimeDate = sdf.parse(endTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return Action.SUCCESS;
		}
		List<ParkingRecord> list = parkingRecordMapper.selectTimeBetween(startTimeDate, endTimeDate);
		Map<String, Object> m = new HashMap<String, Object>();  
		m.put("list", list);
		this.setResponseJson(m);
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

	public String getTypeaheadStringParking() {
		return typeaheadStringParking;
	}

	public void setTypeaheadStringParking(String typeaheadStringParking) {
		this.typeaheadStringParking = typeaheadStringParking;
	}

	public String getTypeaheadStringParkingNot() {
		return typeaheadStringParkingNot;
	}

	public void setTypeaheadStringParkingNot(String typeaheadStringParkingNot) {
		this.typeaheadStringParkingNot = typeaheadStringParkingNot;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
