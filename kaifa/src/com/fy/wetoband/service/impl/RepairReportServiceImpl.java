package com.fy.wetoband.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fy.wetoband.dao.ServiceManage.MaintainerDao;
import com.fy.wetoband.dao.ServiceManage.RepairReportDao;
import com.fy.wetoband.dao.ServiceManage.TaskDao;
import com.fy.wetoband.dao.ServiceManage.TaskMaintainerDao;
import com.fy.wetoband.dao.ServiceManage.TaskRepairDao;
import com.fy.wetoband.pojo.ServiceManage.Maintainer;
import com.fy.wetoband.pojo.ServiceManage.RepairReport;
import com.fy.wetoband.pojo.ServiceManage.Task;
import com.fy.wetoband.pojo.ServiceManage.TaskRepair;
import com.fy.wetoband.service.interfaces.RepairReportService;

public class RepairReportServiceImpl implements RepairReportService{

	RepairReportDao repairReportDao;
	
	public RepairReport getRepairReport(int repairReportId) throws Exception {
		// TODO Auto-generated method stub
		return repairReportDao.getRepairReportById(repairReportId);
	}
	
	@Override
	public List<RepairReport> getRepairReportList() throws Exception {
		// TODO Auto-generated method stub
		return repairReportDao.getRepairReportList();
	}

	@Override
	public boolean handleRepairReport(int repairReportId, int maintainerId) throws Exception {
		// TODO Auto-generated method stub
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startTime = dateFormat.format(new Date());
		Date start_time = dateFormat.parse(startTime);
		
		Task task = new Task(start_time,repairReportDao.getRepairReportById(repairReportId).getNote(),1);
		
		TaskDao taskDao = new TaskDao();
		TaskRepairDao taskRepairDao = new TaskRepairDao();
		TaskMaintainerDao taskMaintainerDao = new TaskMaintainerDao();
		
//		
//		final String INSERT_SQL = "insert into gtable(username,callback) values(?,?)";
//		         KeyHolder keyHolder = new GeneratedKeyHolder();
//		          jdbcTemplate.update(new PreparedStatementCreator() {
//		              public PreparedStatement createPreparedStatement(
//		                      Connection connection) throws SQLException {
//		                  PreparedStatement ps = connection.prepareStatement(INSERT_SQL,
//		                          new String[] { "id" });
//		                  ps.setString(1, request.getUsername());
//		                  ps.setString(2, request.getCallback());
//		                 return ps;
//		             }
//		         }, keyHolder);
		
		synchronized (taskDao) {
			taskDao.addTask(task);
			taskRepairDao.addTaskRepair(repairReportId);
			taskMaintainerDao.addTaskMaintainer(maintainerId);
		}

		return taskDao.addTask(task);
	}

	@Override
	public boolean addRepairReport(RepairReport repairReport) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delRepairReport(int repairReportId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateRepairReport(RepairReport repairReport) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean autoHandleAll(List<String> repairReportIdList) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean autoHandleById(int repairReportId) throws Exception {
		// TODO Auto-generated method stub
		MaintainerDao maintainerDao = new MaintainerDao();
		List<Maintainer> list = new ArrayList<>();
		String area = maintainerDao.getMaintainerById(repairReportId).getAccendant_area();
		//根据负责区域获取维修工
		list = maintainerDao.getMaintainerByArea(area);
		
		return false;
	}

}
