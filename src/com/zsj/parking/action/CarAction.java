package com.zsj.parking.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.challenger.system.services.TestConnectionService;
import com.common.utils.UUIDGenerator;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.zsj.parking.dao.CarMapper;
import com.zsj.parking.vo.Car;


public class CarAction extends ActionSupport {
	
	@Resource
	private CarMapper carMapper;
	
	private List<Car> carList = new ArrayList<Car>();
	
	Car carVO;// = new Car();
	
	//用户ID
	private String carId;
	
	//用于导航菜单确定位置
	private String navname="car";
	
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
		return Action.SUCCESS;
	}

	/**
	 * 修改用户页面
	 * @return
	 */
	public String toEditCar(){
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
		this.carList = carMapper.selectAll();
		return Action.SUCCESS;
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
