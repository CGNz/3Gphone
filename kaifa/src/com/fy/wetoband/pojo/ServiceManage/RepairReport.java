package com.fy.wetoband.pojo.ServiceManage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@SuppressWarnings("serial")
@Entity
@Table(name="repair_report")
public class RepairReport {
	
	private int repairId;   //报修单号
	private int wtb_id;    //报修人员
	private Date report_time;    //报修时间
	private int equipment_id;  //设备单号
	private String address;   //维修地址
	private String description;   //故障描述
	private int status;   //维修状态
	private String note;   //备注

	public RepairReport(int repairId, int wtb_id, Date repair_time, int equipment_id, String address,
			String description, int status, String note) {
		super();
		this.repairId = repairId;
		this.wtb_id = wtb_id;
		this.report_time = repair_time;
		this.equipment_id = equipment_id;
		this.address = address;
		this.description = description;
		this.status = status;
		this.note = note;
	}
	@Id 
	@Column(name="id", unique=true, nullable=false, length=11)
	public int getRepairId() {
		return repairId;
	}
	public void setRepairId(int repairId) {
		this.repairId = repairId;
	}
	
	@Column(name="wtb_id", length=11)
	public int getWtb_id() {
		return wtb_id;
	}
	public void setWtb_id(int wtb_id) {
		this.wtb_id = wtb_id;
	}
	
	@Column(name="report_time")
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date repair_time) {
		this.report_time = repair_time;
	}
	
	@Column(name="equipment_id", length=11)
	public int getEquipment_id() {
		return equipment_id;
	}
	public void setEquipment_id(int equipment_id) {
		this.equipment_id = equipment_id;
	}
	
	@Column(name="address", length=255)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name="description", length=255)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="status", length=2)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name="note", length=255)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
}
