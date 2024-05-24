package com.dao;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.RoomEntity;
import com.entity.view.NewsView;

import org.apache.ibatis.annotations.Param;

import java.util.List;

 
public interface RoomDao extends BaseMapper<RoomEntity> {


}
