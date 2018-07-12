package com.fy.wetoband.pojo.ServiceManage;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="maintainer")
public class Maintainer {

	private int mId;   // 维修人员编号
	private int wtb_id;   //wetoband人员ID
	private String accendant_area;   //负责区域
	private String contact_information;   //联系电话
	
	public Maintainer(int mId, int wtb_id, String accendant_area, String contact_information) {
		super();
		this.mId = mId;
		this.wtb_id = wtb_id;
		this.accendant_area = accendant_area;
		this.contact_information = contact_information;
	}
	
	@Id 
	@Column(name="id", unique=true, nullable=false, length=11)
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	
	@Column(name="wtb_id",length=11)
	public int getWtb_id() {
		return wtb_id;
	}
	public void setWtb_id(int wtb_id) {
		this.wtb_id = wtb_id;
	}
	
	@Column(name="accendant_area",length=255)
	public String getAccendant_area() {
		return accendant_area;
	}
	public void setAccendant_area(String accendant_area) {
		this.accendant_area = accendant_area;
	}
	
	@Column(name="contact_information",length=255)
	public String getContact_information() {
		return contact_information;
	}
	public void setContact_information(String contact_information) {
		this.contact_information = contact_information;
	}

	
}
