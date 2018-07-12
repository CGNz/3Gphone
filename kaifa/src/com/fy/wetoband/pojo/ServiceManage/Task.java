package com.fy.wetoband.pojo.ServiceManage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.w3c.dom.Text;

@SuppressWarnings("serial")
@Entity
@Table(name="task")
public class Task {

	private int id;   //任务单号
	private Date start_time;   // 任务生成时间
	private String note;    //备注
	private int status;     //状态
	
	
	public Task() {
		super();
	}

	public Task(Date start_time, String note, int status) {
		super();
		this.start_time = start_time;
		this.note = note;
		this.status = status;
	}
	
	@Id 
	@Column(name="id", unique=true, nullable=false, length=11)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="start_time")
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	
	@Column(name="note", length=255)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@Column(name="status", length=2)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	
}
