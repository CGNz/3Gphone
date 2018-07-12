package com.fy.wetoband.service.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.fy.wetoband.dao.ServiceManage.TaskDao;
import com.fy.wetoband.pojo.ServiceManage.Task;
import com.fy.wetoband.service.interfaces.TaskService;

public class TaskServiceImpl implements TaskService{

	private TaskDao taskDao;
	//获取任务单列表
	@Override
	public List<Task> getTaskList() {
		ArrayList<String> listId = taskDao.getTaskId();
		LinkedList<Task> listTask = new LinkedList<Task>();
		for(String taskId : listId){
			Task task = taskDao.getTaskBtId(taskId);
			listTask.add(task);
		}
		return listTask;
	}

	//更新任务单
	@Override
	public boolean updateTask(Task task) {
		


		return false;
	}

}
