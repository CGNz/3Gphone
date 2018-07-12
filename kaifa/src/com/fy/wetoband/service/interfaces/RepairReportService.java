package com.fy.wetoband.service.interfaces;

import java.util.List;

import com.fy.wetoband.pojo.ServiceManage.RepairReport;

public interface RepairReportService {

	List<RepairReport> getRepairReportList() throws Exception;
	boolean handleRepairReport(int repairReportId, int maintainerId) throws Exception;
	boolean addRepairReport(RepairReport repairReport);
	boolean delRepairReport(int repairReportId);
	boolean updateRepairReport(RepairReport repairReport);
	boolean autoHandleAll(List<String> repairReportIdList);
	boolean autoHandleById(int repairReportId) throws Exception;

}
