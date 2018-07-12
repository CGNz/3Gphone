package com.fy.wetoband.pojo.ServiceManage;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="task_repair")
public class TaskRepair {
	
	private int task_id;
	private int repair_id;
	
	
	public TaskRepair(int repair_id) {
		super();
		this.repair_id = repair_id;
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
	@Column(name="repair_id", unique=true, nullable=false, length=11)
	public int getRepair_id() {
		return repair_id;
	}
	public void setRepair_id(int repair_id) {
		this.repair_id = repair_id;
	}
	
	

}
