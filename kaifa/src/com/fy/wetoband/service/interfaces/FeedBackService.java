package com.fy.wetoband.service.interfaces;

import java.util.List;

import com.fy.wetoband.pojo.ServiceManage.FeedBack;

public interface FeedBackService {

	List<FeedBack> getFeedBackList();
	boolean addFeedBack(Object object);
}
