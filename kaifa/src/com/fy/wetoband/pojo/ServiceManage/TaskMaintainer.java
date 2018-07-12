package com.fy.wetoband.pojo.ServiceManage;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="task_maintainer")
public class TaskMaintainer {
	
	private int task_id;
	private int maintainer_id;
	
	
	public TaskMaintainer(int maintainer_id) {
		super();
		this.maintainer_id = maintainer_id;
	}
	
	@Id 
	@Column(name="task_id", unique=true, nullable=false, length=11)
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	
	@Id 
	@Column(name="maintainer_id", unique=true, nullable=false, length=11)
	public int getMaintainer_id() {
		return maintainer_id;
	}
	public void setMaintainer_id(int maintainer_id) {
		this.maintainer_id = maintainer_id;
	}
	
	

}
