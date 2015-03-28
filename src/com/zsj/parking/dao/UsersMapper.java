package com.zsj.parking.dao;

import java.util.List;

import com.challenger.system.basic.SQLMapper;
import com.zsj.parking.vo.Users;

@SQLMapper
public interface UsersMapper {

    int deleteByPrimaryKey(String id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(String id);
    
    Users selectByLoginName(String id);
    
    List<Users> selectAll();

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
}