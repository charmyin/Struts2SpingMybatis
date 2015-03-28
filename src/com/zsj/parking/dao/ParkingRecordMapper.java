package com.zsj.parking.dao;

import java.util.List;

import com.challenger.system.basic.SQLMapper;
import com.zsj.parking.vo.Car;
import com.zsj.parking.vo.ParkingRecord;


@SQLMapper
public interface ParkingRecordMapper {
  

    int deleteByPrimaryKey(String id);

    int insert(ParkingRecord record);

    int insertSelective(ParkingRecord record);

    ParkingRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ParkingRecord record);

    int updateByPrimaryKey(ParkingRecord record);

	List<ParkingRecord> selectAll();
	
	List<ParkingRecord> selectAllEqual(ParkingRecord parkingRecord);
}