package com.zsj.parking.dao;

import java.util.List;

import com.challenger.system.basic.SQLMapper;
import com.zsj.parking.vo.ParkingPlace;

@SQLMapper
public interface ParkingPlaceMapper {
    

    int deleteByPrimaryKey(String id);

    int insert(ParkingPlace record);

    int insertSelective(ParkingPlace record);

    ParkingPlace selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ParkingPlace record);

    int updateByPrimaryKey(ParkingPlace record);

	List<ParkingPlace> selectAll();
}