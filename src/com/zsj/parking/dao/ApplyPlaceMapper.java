package com.zsj.parking.dao;

import com.challenger.system.basic.SQLMapper;
import com.zsj.parking.vo.ApplyPlace;

@SQLMapper
public interface ApplyPlaceMapper {


    int deleteByPrimaryKey(String id);

    int insert(ApplyPlace record);

    int insertSelective(ApplyPlace record);

    ApplyPlace selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ApplyPlace record);

    int updateByPrimaryKey(ApplyPlace record);
}