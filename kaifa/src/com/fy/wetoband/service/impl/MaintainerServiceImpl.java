package com.fy.wetoband.service.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.fy.wetoband.dao.ServiceManage.MaintainerDao;
import com.fy.wetoband.pojo.ServiceManage.Maintainer;
import com.fy.wetoband.service.interfaces.MaintainerService;

public class MaintainerServiceImpl implements MaintainerService{

	private MaintainerDao maintainerDao;
	
	@Override
	public List<Maintainer> getMaintainterList() {
		ArrayList<Integer> listId = maintainerDao.getMaintainerId();
		LinkedList<Maintainer> listMaintainer = new LinkedList<>();
		for(int mId : listId){
			Maintainer maintainer = maintainerDao.getMaintainerById(mId);
			listMaintainer.add(maintainer);
		}
		return listMaintainer;
	}

}
