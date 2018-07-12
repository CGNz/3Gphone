package com.fy.wetoband.service.interfaces;

import java.util.List;

import com.fy.wetoband.pojo.ServiceManage.Task;

public interface TaskService {

	List<Task> getTaskList();
	boolean updateTask(Task task);
}
