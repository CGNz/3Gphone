package com.fy.wetoband.tool.action;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bug.tool.dao.util.ConnectUtil;
import com.bug.tool.util.RemoteUtil;
import com.fy.wetoband.bean.RunToolParam;
import com.fy.wetoband.tool.manager.Tool;

public class ServiceManage extends Tool{

	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public void act(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		//获取数据库链接
		ConnectUtil.setConnection(this.getConnection());
		RemoteUtil.getToolConfig(this);
		
		Map<String,Object> result = null;
		try {
			if(action.equals("getBugs")){
				//获取bug
				result = getBugs(request);
			}else if (action.equals("createBug")){
				//创建bug
				result = createBug(request);
			}else if(action.equals("updateBug")){
				//修改bug信息
			}else if(action.equals("reportBug")){
				//汇报bug情况
			}else if(action.equals("getApplications")){
				//获取应用
				result = this.getApplications(request);
			}else if(action.equals("getRecordsByBugID")){
				//获取bug的修复记录
				result = this.getRecordsByBugID(request);
			}else if(action.equals("doneBug")){
				result = doneBug(request);
			}else if(action.equals("rePairBug")){
				result = rePairBug(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				ConnectUtil.getConnection().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		flushData(response,result);
		
	}

	@Override
	public Object toolMain(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object toolMain(RunToolParam runToolParam) {
		// TODO Auto-generated method stub
		return null;
	}

}
