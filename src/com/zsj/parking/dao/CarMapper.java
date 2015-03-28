package com.zsj.parking.dao;

import java.util.List;

import com.challenger.system.basic.SQLMapper;
import com.zsj.parking.vo.Car;

@SQLMapper
public interface CarMapper {


    int deleteByPrimaryKey(String id);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

	List<Car> selectAll();
}