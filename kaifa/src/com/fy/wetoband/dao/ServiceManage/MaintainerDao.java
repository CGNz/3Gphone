package com.fy.wetoband.dao.ServiceManage;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.chainsaw.Main;

import com.fy.wetoband.dao.BaseDao;
import com.fy.wetoband.pojo.ServiceManage.Maintainer;

public class MaintainerDao extends BaseDao{

	public MaintainerDao(){}
	
	public Maintainer getMaintainerById(int mId){
		return null;
		
	}
	
	public ArrayList<Integer> getMaintainerId(){
		return null;
		
	}
	
	public List<Maintainer> getMaintainerByArea(String area) throws Exception{
		String sql = "select * from maintainer where accendant_area = " +area;
		List<Maintainer> list = super.findBySql(sql, Maintainer.class, null);
		return list;
		
	}
	
	public List<Maintainer> getMaintainerByCatagoryId(int catagory_id) throws Exception{
		String sql = "select * from maintainer_catagory where catagory_id = " +catagory_id;
		List<Maintainer> list = super.findBySql(sql, Maintainer.class, null);
		return list;
		
	}
	
	public List<Maintainer> getMaintainerList() throws Exception{
		String sql = "select maintainer.*,catagory.catagory_name "
				+ "from maintainer , maintainer_catagory, catagory "
				+ "where maintainer.id=maintainer_catagory.maintainer_id "
				+ "and maintainer_catagory.catagory_id=catagory.id;";
		List<Maintainer> list = super.findBySql(sql, Maintainer.class, null);
		return list;
		
	}
	
	public List<Maintainer> getMaintainerByCatagoryAndArea(String area,int catagory_id) throws Exception{
		String sql = "select * from maintainer where accendant_area=" +area+" and catagory_id="+catagory_id;
		List<Maintainer> list = super.findBySql(sql, Maintainer.class, null);
		return list;
		
	}
}
