package com.fy.wetoband.dao.ServiceManage;

import java.util.ArrayList;
import java.util.List;

import com.fy.wetoband.dao.BaseDao;
import com.fy.wetoband.pojo.ServiceManage.RepairReport;

public class RepairReportDao extends BaseDao{
	

	public RepairReport getRepairReportById(int repairReportId) throws Exception{
		String sql = "select * from repair_report where id=" +repairReportId;
		RepairReport repairReport = (RepairReport) super.findBySql(sql, RepairReport.class, null);
		return repairReport;
		
	}
	
	public boolean delRepairReportById(int repairReportId){
		return false;
		
	}
	
	public boolean addRepairReport(RepairReport repairReport) throws Exception{
	
		int j = super.saveEntity(repairReport);
		if(j == 0)
			return false;
		return true;
		
	}
	
	public ArrayList<Integer> getRepairReportId(){
		return null;
		
	}
	
	//查找报单列表
	public List<RepairReport> getRepairReportList() throws Exception{
		String sql = "select * from repair_report";
		List<RepairReport> listRepairReport = super.findBySql(sql, RepairReport.class, null);
		return listRepairReport;		
	}

}
