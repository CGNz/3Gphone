package com.fy.wetoband.pojo.ServiceManage;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.w3c.dom.Text;

@SuppressWarnings("serial")
@Entity
@Table(name="feedback")
public class FeedBack {
	
	private String fbId;
	private String finishId;
	private Text fb_context;
	private int score;
	
	public FeedBack() {
		super();
	}
	
	 @Id 
	 @Column(name="fbId", unique=true, nullable=false, length=20)
	public String getFbId() {
		return fbId;
	}
	public void setFbId(String fbId) {
		this.fbId = fbId;
	}
	
	@Column(name="finishId", unique=true, nullable=false, length=20)	
	public String getFinishId() {
		return finishId;
	}
	public void setFinishId(String finishId) {
		this.finishId = finishId;
	}
	 
	@Column(name="fb_context", unique=true, nullable=false, length=20)
	public Text getFb_context() {
		return fb_context;
	}
	public void setFb_context(Text fb_context) {
		this.fb_context = fb_context;
	}
	
	@Column(name="score", unique=true, nullable=false, length=20)
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	

}
