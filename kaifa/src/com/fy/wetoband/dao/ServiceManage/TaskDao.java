package com.fy.wetoband.dao.ServiceManage;

import java.util.ArrayList;
import java.util.List;

import com.fy.wetoband.dao.BaseDao;
import com.fy.wetoband.pojo.ServiceManage.Task;

public class TaskDao extends BaseDao{

	public Task getTaskBtId(String taskId){
		return null;
		
	}
	
	public boolean updateTask(Object object){
		return false;
		
	}
	
	public boolean addTask(Task task) throws Exception{
		int j = super.saveEntity(task);
		if(j == 0)
			return false;
		return true;
		
	}
	
	public boolean delTaskById(String taskId){
		return false;
		
	}
	
	public ArrayList<String> getTaskId(){
		return null;
		
	}
	
	public int countTask(String maintainerId){
		String sql = "select count(*) from task group by maintainerId";
		return 0; 
	}
}
