package com.fy.wetoband.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Properties;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Prop;
import com.mysql.jdbc.Driver;

public class JDBCTools {
	
	//关闭conn和statement的操作
	public static void release(PreparedStatement preparedStatement, Connection conn){ 
		if(preparedStatement != null){
			try{
				preparedStatement.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(conn != null){
			try{
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
	public static Connection getConnection() throws Exception{
		String driverClass = null;
		String jdbcUrl = null;
		String user = null;
		String password = null;
		
		
		//读取类路径下的jdbc.properties文件
		InputStream inputStream = JDBCTools.class.getClassLoader().getResourceAsStream("jdbc.properties");
		Properties properties = new Properties();
		properties.load(inputStream);
		driverClass = properties.getProperty("driver");
		jdbcUrl = properties.getProperty("jdbcUrl");
		user = properties.getProperty("user");
		password = properties.getProperty("password");
		
		//通过反射创建Driver对象
		Driver driver = (Driver) Class.forName(driverClass).newInstance();
		Properties info = new Properties();
		info.put("user", user);
		info.put("password", password);
		Connection connection = driver.connect(jdbcUrl, info);
		return connection;
	}
	
	
	public void update(String sql){
		Connection connection = null;
		Statement statement = null;
		try{
			connection = getConnection();
			statement = connection.createStatement();
			statement.execute(sql);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			release(preparedStatement, connection);
		}
	}
	

}
