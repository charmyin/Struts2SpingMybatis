package com.zsj.parking.action;

import java.io.IOException;
import java.util.ArrayList;
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
import com.zsj.parking.dao.ParkingPlaceMapper;
import com.zsj.parking.dao.UsersMapper;
import com.zsj.parking.vo.ParkingPlace;
import com.zsj.parking.vo.Users;


public class ParkingPlaceAction extends ActionSupport {
	
	@Resource
	private ParkingPlaceMapper parkingPlaceMapper;
	
	private List<ParkingPlace> parkingPlaceList = new ArrayList<ParkingPlace>();
	
	@Resource
	private UsersMapper usersMapper;
	
	ParkingPlace parkingPlaceVO;// = new ParkingPlace();
	
	//用户ID
	private String parkingPlaceId;
	
	//用于导航菜单确定位置
	private String navname="place";
	
	private String typeaheadString="[]";
	/**
	 * 
	 */
	private static final long serialVersionUID = 8286676643856005055L;
	private TestConnectionService testConnectionService;
	static Logger logger = Logger.getLogger(ParkingPlaceAction.class);
	public String addParkingPlace()
	{
		//如果传来parkingPlaceid，则认为是更新
		if(parkingPlaceVO.getId()!=null){
			parkingPlaceMapper.updateByPrimaryKeySelective(parkingPlaceVO);
		}else{
			parkingPlaceVO.setId(UUIDGenerator.generate());
			parkingPlaceMapper.insert(parkingPlaceVO);
		}
		return Action.SUCCESS;
	}

	/**
	 * 新增用户页面
	 * @return
	 */
	public String toAddParkingPlace(){
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
	 * 修改用户页面
	 * @return
	 */
	public String toEditParkingPlace(){
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
		parkingPlaceVO = parkingPlaceMapper.selectByPrimaryKey(parkingPlaceId);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 删除用户
	 */
	public String deleteParkingPlace(){
		parkingPlaceMapper.deleteByPrimaryKey(parkingPlaceId);
		return Action.SUCCESS;
	}
	/**
	 * 用户列表
	 * @return
	 */
	public String listParkingPlace(){
		parkingPlaceVO = new ParkingPlace();
		//管理员返回所有停车位信息
		if(SessionUtils.getSession().get("role").toString().equals("admin")){
			this.parkingPlaceList = parkingPlaceMapper.selectAll();
			return Action.SUCCESS;
		}
		//业主只返回自己的停车位置信息
		Users user = (Users)SessionUtils.getSession().get("userinfo");
		parkingPlaceVO.setUserid(user.getId());
		this.parkingPlaceList = parkingPlaceMapper.selectAllEqual(parkingPlaceVO);
		return Action.SUCCESS;
	}

	
	
	
	public TestConnectionService getTestConnectionService() {
		return testConnectionService;
	}

	public void setTestConnectionService(TestConnectionService testConnectionService) {
		this.testConnectionService = testConnectionService;
	}

	public String getParkingPlaceId() {
		return parkingPlaceId;
	}

	public void setParkingPlaceId(String parkingPlaceId) {
		this.parkingPlaceId = parkingPlaceId;
	}

	public List<ParkingPlace> getParkingPlaceList() {
		return parkingPlaceList;
	}

	public void setParkingPlaceList(List<ParkingPlace> parkingPlaceList) {
		this.parkingPlaceList = parkingPlaceList;
	}

	public ParkingPlace getParkingPlaceVO() {
		return parkingPlaceVO;
	}

	public void setParkingPlaceVO(ParkingPlace parkingPlaceVO) {
		this.parkingPlaceVO = parkingPlaceVO;
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
