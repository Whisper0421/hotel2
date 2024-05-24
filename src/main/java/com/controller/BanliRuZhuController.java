package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.FuwufeiyongEntity;
import com.entity.KefangfuwuEntity;
import com.entity.KefangxinxiEntity;
import com.entity.KefangyudingEntity;
import com.entity.view.KefangfuwuView;
import com.service.FuwufeiyongService;
import com.service.KefangfuwuService;
import com.service.KefangxinxiService;
import com.service.KefangyudingService;
import com.utils.MPUtil;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/BanliRuZhu")
public class BanliRuZhuController {
  @Autowired
  private KefangxinxiService kefangxinxiService;

  @Autowired
  private KefangyudingService kefangyudingService;

}
