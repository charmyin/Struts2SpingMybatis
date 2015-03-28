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
import com.zsj.parking.dao.CarMapper;
import com.zsj.parking.dao.UsersMapper;
import com.zsj.parking.vo.Car;
import com.zsj.parking.vo.Users;


public class CarAction extends ActionSupport {
	
	@Resource
	private CarMapper carMapper;
	@Resource
	private UsersMapper usersMapper;
	
	private List<Car> carList = new ArrayList<Car>();
	
	Car carVO;// = new Car();
	
	//用户ID
	private String carId;
	
	//用于导航菜单确定位置
	private String navname="car";
	
	private String typeaheadString="[]";
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8286676643856005055L;
	private TestConnectionService testConnectionService;
	static Logger logger = Logger.getLogger(CarAction.class);
	public String addCar()
	{
		//如果传来carid，则认为是更新
		if(carVO.getId()!=null){
			carMapper.updateByPrimaryKeySelective(carVO);
		}else{
			carVO.setId(UUIDGenerator.generate());
			carMapper.insert(carVO);
		}
		return Action.SUCCESS;
	}

	/**
	 * 新增用户页面
	 * @return
	 */
	public String toAddCar(){
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
	public String toEditCar(){
		
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
		carVO = carMapper.selectByPrimaryKey(carId);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 删除用户
	 */
	public String deleteCar(){
		carMapper.deleteByPrimaryKey(carId);
		return Action.SUCCESS;
	}
	/**
	 * 用户列表
	 * @return
	 */
	public String listCar(){
		carVO = new Car();
		//管理员返回所有停车位信息
		if(SessionUtils.getSession().get("role").toString().equals("admin")){
			this.carList = carMapper.selectAll();
			return Action.SUCCESS;
		}
		//业主只返回自己的停车位置信息
		Users user = (Users)SessionUtils.getSession().get("userinfo");
		carVO.setOwnerid(user.getId());
		this.carList = carMapper.selectAllEqual(carVO);
		return Action.SUCCESS;
	}

	
	
	public String getTypeaheadString() {
		return typeaheadString;
	}

	public void setTypeaheadString(String typeaheadString) {
		this.typeaheadString = typeaheadString;
	}

	public TestConnectionService getTestConnectionService() {
		return testConnectionService;
	}

	public void setTestConnectionService(TestConnectionService testConnectionService) {
		this.testConnectionService = testConnectionService;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	public Car getCarVO() {
		return carVO;
	}

	public void setCarVO(Car carVO) {
		this.carVO = carVO;
	}

	public String getNavname() {
		return navname;
	}

	public void setNavname(String navname) {
		this.navname = navname;
	}
	
	
}
