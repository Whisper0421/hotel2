package com.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.NewsDao;
import com.dao.RoomDao;
import com.entity.NewsEntity;
import com.entity.RoomEntity;
import com.service.NewsService;
import com.service.RoomService;
import org.springframework.stereotype.Service;


@Service("roomService")
public class RoomServiceImpl extends ServiceImpl<RoomDao, RoomEntity> implements RoomService {

}

