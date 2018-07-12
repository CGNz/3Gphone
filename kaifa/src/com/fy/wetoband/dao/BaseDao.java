package com.fy.wetoband.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import com.mysql.jdbc.Connection;

public class BaseDao {

	private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BaseDao() {
	}

	public BaseDao(Connection connection) {
		this.connection = connection;
	}

	/**
	 *
	 * @return 获得数据库连接
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Connection getConn() {
		return connection;
	}

	/**
	 * 关闭数据库连接
	 */
	protected void closeAll() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
				System.out.println("关闭连接");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void rollBack() {
		if (connection != null) {
			try {
				connection.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//通过执行SQL语句查询
	protected List findBySql(String sql, Class<?> clazz, Object[] param) throws Exception {
		rs = null;
		pstmt = null;
		pstmt = connection.prepareStatement(sql);
		if (param != null) {
			for (int i = 1; i <= param.length; i++) {
				pstmt.setObject(i, param[i - 1]);// 使用给定的对象设置指定参数的值。
			}
		}

		// 执行查询返回结果集
		rs = pstmt.executeQuery();

		ResultSetMetaData rsm = rs.getMetaData();

		// 如果clazz为null，将结果集存在List<Map<String, Object>>里
		if (clazz == null) {
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			while (rs.next()) {
				map = new HashMap<String, Object>();
				for (int i = 1; i <= rsm.getColumnCount(); i++) {
					map.put(rsm.getColumnName(i), rs.getObject(rsm.getColumnName(i)));
				}
				list.add(map);
			}
			return list;
		} else { // 通过反射获取clazz里的方法

			List<Object> list = new ArrayList<Object>();
			Method[] ms = clazz.getDeclaredMethods();
			Map<String, Method> map = new HashMap<String, Method>();
			for (Method m : ms) {
				// 获取注释中注解的对象，获取字段名
				Column c = m.getAnnotation(Column.class);
				if (c != null) {
					// 获取方法名
					String getMethodName = m.getName();
					// 设置set方法名
					String setMethodName = "set" + getMethodName.substring(3, getMethodName.length());
					// 判断类中是否有该set方法名
					for (Method m2 : ms) {
						if (m2.getName().equals(setMethodName)) {
							map.put(c.name(), m2);// 存入set方法
						}
					}
				}
			} // 将结果集存在clazz对象里
			while (rs.next()) {
				// 创建对象 实例
				Object obj = clazz.newInstance();
				for (int i = 1; i <= rsm.getColumnCount(); i++) {
					String colName = rsm.getColumnName(i);
					if (map.containsKey(colName)) {
						Method setMethod = map.get(colName);
						Object val = rs.getObject(rsm.getColumnName(i));
						// 调用方法，设置对应字段val的值
						setMethod.invoke(obj, val);

					}
				}

				list.add(obj);
			} /*
				 * if (SHOW_SQL) { System.out.println(sql); }
				 */
			return list;
		}
	}
	
	
	/**
	 * 根据类对象和id删除记录，类对象一定要用@id注解
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public int deleteByPriKey(Class<?> clazz, String id) throws Exception {
		int rows = 0;
		//获得对象类名
		String a = clazz.getSimpleName();
		//获得表名
		Table table = (Table) clazz.getAnnotation(Table.class);
		String sql = " delete from " + table.name() + "  where ";
		Method[] methods = clazz.getDeclaredMethods();
		for (Method m : methods) {
			//通过注释获取表主键名
			Id an = m.getAnnotation(Id.class);
			if (an != null) {   //是主键注释
				Column clm = m.getAnnotation(Column.class);
				String idColumn = clm.name();   //获取主键名
				sql += idColumn + "='" + id + "'";
			}
		}
		rs = null;
		pstmt = null;
		try {
			pstmt = connection.prepareStatement(sql);
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("删除出错了...");
		}

		return rows;   //返回更新条数
	}
	

	/*
	 * 根据对象实例更新数据库记录，实体需有注解
	 */
	public int update(Object object) throws Exception{
		Class class1 = object .getClass();
		Field[] fields = class1.getDeclaredFields();
		Field.setAccessible(fields, true);
		Method[] methods = class1.getDeclaredMethods();
		Table table = (Table) class1.getAnnotation(Table.class);
		
		StringBuffer sql = new StringBuffer();
		StringBuffer value = new StringBuffer();
		String primaryIdName = null;
		String primaryIdVal = null;
		
		List<Object> list = new ArrayList<Object>();
		sql.append("update "+table.name()+" set ");
		
		for(int i = 0; i<fields.length;i++){
			Object val = fields[i].get(object);
			String name = fields[i].getName();
			
			if(name.contains("serialVersionUID")){
				continue;
			}
			
			StringBuffer getMethodName = new StringBuffer("get");
			
			Character character = name.charAt(0);
			if(Character.isUpperCase(character)){
				getMethodName.append(name);
			}else{
				getMethodName.append(name.substring(0, 1).toUpperCase()).append(name).substring(1);
			}
			Method method = class1.getMethod(getMethodName.toString());
			Column column = method.getAnnotation(Column.class);
			Id id = method.getAnnotation(Id.class);
			if(id != null && val != null){
				primaryIdName = column.name();
				primaryIdVal = (String) val;
			}else if(column != null){
				list.add(val);
				sql.append(column.name() + "=?,");
			}
		}
		sql = sql.deleteCharAt(sql.length()-1);
		sql.append(" where " +primaryIdName + " = '" + primaryIdVal + "'");
		pstmt = connection.prepareStatement(sql.toString(),Statement.RETURN_GENERATED_KEYS);
		for(int i=0;i<list.size();i++){
			pstmt.setObject(i+1, list.get(i));
		}
		int row = pstmt.executeUpdate();
		return row;
	}
	
	
	/**
	 * 根据实体类增加一条数据库记录，类需有注解
	 * 
	 * @param obj
	 * @param operateType
	 * @param where
	 * @return
	 * @throws Exception
	 */
	protected int saveEntity(Object obj) throws Exception {
		Class cl = obj.getClass();
		Field[] fields = cl.getDeclaredFields();// 获取属性
		Field.setAccessible(fields, true);
		Table table = (Table) cl.getAnnotation(Table.class);
		String tableName = table.name();
		StringBuffer sql = new StringBuffer();
		StringBuffer value = new StringBuffer();
		String primaryIdName = null;
		String primaryIdVal = null;
		List<Object> list = new ArrayList<Object>();
		sql.append("insert into ").append(tableName).append(" (");
		value.append(" values(");
		for (int i = 0; i < fields.length; i++) {
			Object val = fields[i].get(obj);
			String name = fields[i].getName();
			if (name.contains("serialVersionUID")) {
				continue;
			}
			StringBuffer getMethodName = new StringBuffer("get");

			Character character = name.charAt(1);
			if (Character.isUpperCase(character)) {
				getMethodName.append(name);
			} else {
				getMethodName.append(name.substring(0, 1).toUpperCase()).append(name.substring(1));
			}
			Method method = cl.getMethod(getMethodName.toString());
			Column column = (Column) method.getAnnotation(Column.class);
			Id id = (Id) method.getAnnotation(Id.class);
			if (id != null && val == null) {

			} else if (id != null && val != null) {
				primaryIdName = column.name();
				primaryIdVal = (String) val;
				list.add(primaryIdVal);
				sql.append(primaryIdName + ",");
				value.append("?,");
			}

			else if (column != null) {
				list.add(val);
				sql.append(column.name() + ",");
				value.append("?,");
			}

		}
		sql = sql.deleteCharAt(sql.length() - 1).append(")");
		;
		value = value.deleteCharAt(value.length() - 1).append(")");
		System.out.println(sql.toString() + value.toString());
		sql = sql.append(value.toString());
		pstmt = null;
		pstmt = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
		for (int i = 1; i < list.size() + 1; i++) {
			System.out.println(list.get(i - 1));
			pstmt.setObject(i, list.get(i - 1));
		}
		int rows = pstmt.executeUpdate();
		return rows;
	}

}
