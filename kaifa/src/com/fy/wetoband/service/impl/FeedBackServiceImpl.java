package com.fy.wetoband.service.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.fy.wetoband.dao.ServiceManage.FeedBackDao;
import com.fy.wetoband.pojo.ServiceManage.FeedBack;
import com.fy.wetoband.service.interfaces.FeedBackService;

public class FeedBackServiceImpl implements FeedBackService{

	private FeedBackDao feedbackDao;
	
	@Override
	public List<FeedBack> getFeedBackList() {
		ArrayList<String> listId = feedbackDao.getFbackId();
		LinkedList<FeedBack> listFb = new LinkedList<>();
		for(String fbId : listId){
			FeedBack feedBack = feedbackDao.getFeedBackById(fbId);
			listFb.add(feedBack);
		}
		return listFb;
	}

	@Override
	public boolean addFeedBack(Object object) {
		// TODO Auto-generated method stub
		return false;
	}

}
