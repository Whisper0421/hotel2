package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;

import com.entity.KefangyudingEntity;
import com.entity.RoomEntity;
import com.entity.RuzhudengjiEntity;
import com.service.*;
import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.KefangxinxiEntity;
import com.entity.view.KefangxinxiView;

import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 客房信息
 * 后端接口
 * @author 
 * @email 
 * @date 2021-03-09 01:32:48
 */
@RestController
@RequestMapping("/kefangxinxi")
public class KefangxinxiController {
    @Autowired
    private KefangxinxiService kefangxinxiService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private KefangyudingService kefangyudingService;

    @Autowired
    private RuzhudengjiService ruzhudengjiService;


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        EntityWrapper<KefangxinxiEntity> ew = new EntityWrapper<KefangxinxiEntity>();
		PageUtils page = kefangxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kefangxinxi), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        EntityWrapper<KefangxinxiEntity> ew = new EntityWrapper<KefangxinxiEntity>();


		PageUtils page = kefangxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kefangxinxi), params), params));
        return R.ok().put("data", page);
    }
    @IgnoreAuth
    @RequestMapping("/fist")
    public R fist(@RequestParam Map<String, Object> params,KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        EntityWrapper<KefangxinxiEntity> ew = new EntityWrapper<KefangxinxiEntity>();
        PageUtils page = kefangxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kefangxinxi), params), params));
        KefangxinxiEntity kefangxinxis=(KefangxinxiEntity)page.getList().get(0);
        String [] arrs=kefangxinxis.getRooms().split(",");
        List<KefangxinxiEntity> list=new ArrayList<>();
        for(int i=0;i<arrs.length;i++){

            KefangxinxiEntity kfxx=new KefangxinxiEntity();
            kfxx.setId(kefangxinxis.getId());
            kfxx.setKefangleixing(kefangxinxis.getKefangleixing());
            kfxx.setKefangtupian(kefangxinxis.getKefangtupian());
            kfxx.setKefangjiage(kefangxinxis.getKefangjiage());
            kfxx.setKefangjiage(kefangxinxis.getKefangjiage());
            EntityWrapper<RoomEntity> ew1 = new EntityWrapper<RoomEntity>();
            ew1.eq("id", arrs[i]);
            RoomEntity room=roomService.selectOne(ew1);
            EntityWrapper<RuzhudengjiEntity> ew2 = new EntityWrapper<RuzhudengjiEntity>();
            ew2.like("room",room.getRoomnum());
            List<RuzhudengjiEntity> ruzulist=ruzhudengjiService.selectList(ew2);
            if(ruzulist.size()>0){
                continue;
            }
            kfxx.setKefangtupian(room.getImg());
            kfxx.setKefangmingcheng( room.getRoomnum());
            list.add(kfxx);
        }
        page.setList(list);
        return R.ok().put("data", page);
    }

    @IgnoreAuth
    @RequestMapping("/frontlist")
    public R frontlist(@RequestParam Map<String, Object> params,KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        EntityWrapper<KefangxinxiEntity> ew = new EntityWrapper<KefangxinxiEntity>();
        PageUtils page = kefangxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kefangxinxi), params), params));
        List list=page.getList();
        for(int i=0;i<list.size();i++){
            KefangxinxiEntity item=(KefangxinxiEntity)list.get(i);
            EntityWrapper<KefangyudingEntity> yude = new EntityWrapper<KefangyudingEntity>();
            yude.eq("kefangmingcheng",item.getKefangmingcheng());
            yude.and().eq("kefangleixing",item.getKefangleixing());
            List<KefangyudingEntity> yudinglist=kefangyudingService.selectList(yude);
            Integer sum=0;
            Integer del=0;
            for(KefangyudingEntity kefangyuding: yudinglist){
                EntityWrapper<RuzhudengjiEntity> ruzw = new EntityWrapper<RuzhudengjiEntity>();
                sum=sum+kefangyuding.getShuliang();
                ruzw.eq("yudingbianhao",kefangyuding.getYudingbianhao());
                RuzhudengjiEntity ruzhudengji=ruzhudengjiService.selectOne(ruzw);
                if(ruzhudengji!=null){
                    String pay=ruzhudengji.getIspay();
                    if(pay.equals("已退房")){
                        del=del+1;
                    }
                }
            }

            sum=sum-del;
            sum=Integer.valueOf(item.getShuliang())-sum;
            item.setShuliang(String.valueOf(sum));
        }

        return R.ok().put("data", page);
    }

    @GetMapping("/addroom")
    public R addroom(RoomEntity roomEntity){
        EntityWrapper<RoomEntity> ew = new EntityWrapper<RoomEntity>();
        ew.eq("roomnum", roomEntity.getRoomnum());
        ew.eq("xinxiid", roomEntity.getXinxiid());
        List<RoomEntity> lists=roomService.selectList(ew);
        if(lists.size()<1){
            Date now=new Date();
            roomEntity.setCreatetime(now);
            Boolean flag=roomService.insert(roomEntity);
            EntityWrapper<RoomEntity> q = new EntityWrapper<RoomEntity>();
            q.eq("roomnum", roomEntity.getRoomnum());
            RoomEntity rom =roomService.selectOne(q);
            return R.ok().put("data", rom);
        }else {
            return R.ok().put("data", lists.get(0));
        }

    }
    @GetMapping("/uproom")
    public R uproom(RoomEntity roomEntity){
        Boolean r=roomService.updateById(roomEntity);
         return R.ok().put("data", r);

    }

    @GetMapping("/rooms")
    public R rooms(RoomEntity room){
        String ids=room.getRoomnum();
        if(ids==null||ids==""||ids==null ){
            return R.ok().put("data", null);
        }
        String[] strs=ids.split(",");
        List<RoomEntity> arrs=new ArrayList<>();
        for(int i=0;i<strs.length;i++){
            EntityWrapper<RoomEntity> ew = new EntityWrapper<RoomEntity>();
            ew.eq("id", strs[i]);

            RoomEntity ee=roomService.selectOne(ew);
            arrs.add(ee);
        }
        return R.ok().put("data", arrs);
    }
	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( KefangxinxiEntity kefangxinxi){
       	EntityWrapper<KefangxinxiEntity> ew = new EntityWrapper<KefangxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( kefangxinxi, "kefangxinxi")); 
        return R.ok().put("data", kefangxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(KefangxinxiEntity kefangxinxi){
        EntityWrapper< KefangxinxiEntity> ew = new EntityWrapper< KefangxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( kefangxinxi, "kefangxinxi")); 
		KefangxinxiView kefangxinxiView =  kefangxinxiService.selectView(ew);
		return R.ok("查询客房信息成功").put("data", kefangxinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        KefangxinxiEntity kefangxinxi = kefangxinxiService.selectById(id);
		kefangxinxi.setClicknum(kefangxinxi.getClicknum()+1);
		kefangxinxiService.updateById(kefangxinxi);
        return R.ok().put("data", kefangxinxi);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        KefangxinxiEntity kefangxinxi = kefangxinxiService.selectById(id);
		kefangxinxi.setClicknum(kefangxinxi.getClicknum()+1);
		kefangxinxiService.updateById(kefangxinxi);
        return R.ok().put("data", kefangxinxi);
    }

    @IgnoreAuth
    @RequestMapping("/frontdetail/{id}")
    public R frontdetail(@PathVariable("id") Long id){
        KefangxinxiEntity kefangxinxi = kefangxinxiService.selectById(id);
        EntityWrapper<KefangyudingEntity> yude = new EntityWrapper<KefangyudingEntity>();
        yude.eq("kefangmingcheng",kefangxinxi.getKefangmingcheng());
        yude.and().eq("kefangleixing",kefangxinxi.getKefangleixing());
        List<KefangyudingEntity> yudinglist=kefangyudingService.selectList(yude);

        Integer sum=0;
        Integer del=0;
        for(KefangyudingEntity kefangyuding: yudinglist){
            EntityWrapper<RuzhudengjiEntity> ruzw = new EntityWrapper<RuzhudengjiEntity>();
            sum=sum+kefangyuding.getShuliang();
            ruzw.eq("yudingbianhao",kefangyuding.getYudingbianhao());
            RuzhudengjiEntity ruzhudengji=ruzhudengjiService.selectOne(ruzw);
            if(ruzhudengji!=null){
                String pay=ruzhudengji.getIspay();
                if(pay.equals("已退房")){
                    del=del+1;
                }
            }
        }

        sum=sum-del;
        sum=Integer.valueOf(kefangxinxi.getShuliang())-sum;

        kefangxinxi.setClicknum(kefangxinxi.getClicknum()+1);
        kefangxinxiService.updateById(kefangxinxi);
        kefangxinxi.setShuliang(String.valueOf(sum));
        return R.ok().put("data", kefangxinxi);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        String[] arr=kefangxinxi.getRooms().split(",");

        kefangxinxi.setShuliang(String.valueOf(arr.length));
    	kefangxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(kefangxinxi);
        kefangxinxiService.insert(kefangxinxi);

        for(String id:arr){
            Long tid=Long.valueOf(id);
            RoomEntity rom=roomService.selectById(tid);
            rom.setXinxiid(kefangxinxi.getId());
            roomService.updateById(rom);
        }
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        String[] arr=kefangxinxi.getRooms().split(",");
        kefangxinxi.setShuliang(String.valueOf(arr.length));
    	kefangxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(kefangxinxi);
        kefangxinxiService.insert(kefangxinxi);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody KefangxinxiEntity kefangxinxi, HttpServletRequest request){
        String[] arr=kefangxinxi.getRooms().split(",");
        kefangxinxi.setShuliang(String.valueOf(arr.length));
        //ValidatorUtils.validateEntity(kefangxinxi);
        kefangxinxiService.updateById(kefangxinxi);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        kefangxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<KefangxinxiEntity> wrapper = new EntityWrapper<KefangxinxiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = kefangxinxiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	


}
