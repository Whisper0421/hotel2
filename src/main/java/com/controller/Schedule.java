package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.KefangxinxiEntity;
import com.entity.KefangyudingEntity;
import com.entity.RuzhudengjiEntity;
import com.service.KefangyudingService;
import com.service.RuzhudengjiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author jocker
 * @version 1.0
 * Create by 2024/5/19 17:34
 */

@Component
@EnableScheduling
public class Schedule {


    @Autowired
    private RuzhudengjiService ruzhudengjiService;
    @Autowired
    private KefangyudingService kefangyudingService;

    /**
     * 每3秒钟执行一次
     */
    @Scheduled(cron = "*/3 * * * * ?")
    public void changeRuzhu() {
        EntityWrapper<RuzhudengjiEntity> uew = new EntityWrapper<>();
        Date dBefore = new Date();
        Calendar calendar = Calendar.getInstance(); //得到日历
        calendar.setTime(new Date());//把当前时间赋给日历
        calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前一天
        dBefore = calendar.getTime();   //得到前一天的时间
        uew.le("dengjishijian", dBefore);
        uew.and().eq("ispay", "已支付");
        RuzhudengjiEntity enti=new RuzhudengjiEntity();
        enti.setIspay("已退房");

        boolean i=ruzhudengjiService.update(enti,uew);
        System.out.println(i);

    }
}
