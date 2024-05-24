package com;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.KefangfuwuEntity;
import com.entity.KefangxinxiEntity;
import com.entity.KefangyudingEntity;
import com.service.KefangyudingService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringbootSchemaApplicationTests {
	@Autowired
	private KefangyudingService kefangyudingService;

	@Test
	void contextLoads() {
		EntityWrapper<KefangyudingEntity> ew = new EntityWrapper<KefangyudingEntity>();
		KefangyudingEntity kefangfuwu = new KefangyudingEntity();
		kefangfuwu.setId(57L);
		kefangfuwu.setIspay("已支付");
//		ew.setEntity(kefangfuwu);
		ew.eq("id","57");
		kefangyudingService.updateById(kefangfuwu);
	}

}
