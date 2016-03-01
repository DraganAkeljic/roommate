package com.roommate.room;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Database {
	private static String username ;
	private static String password ;
	private static String databaseName ;
	private static String connectionPort ;
	
	
	public Database(String username, String password, String databaseName, String connectionPort) {
		super();
		this.username = username;
		this.password = password;
		this.databaseName = databaseName;
		this.connectionPort = connectionPort;
	}
	
	public Database(){}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		Database.password = password;
	}
	public String getDatabaseName() {
		return databaseName;
	}
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	public String getConnectionPort() {
		return connectionPort;
	}
	public void setConnectionPort(String connectionPort) {
		this.connectionPort = connectionPort;
	}
	
	public Connection connect() throws ClassNotFoundException, SQLException{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connectionUrl = "jdbc:sqlserver://localhost:"+connectionPort+";databaseName="+databaseName+";useUnicode=true;characterEncoding=UTF-8";
		Connection connection = DriverManager.getConnection(connectionUrl,username,password);
		System.out.println("Connected to database!!!");
		return connection;
	}
	
	public void addUserInfo(Connection connection, User user) throws SQLException, ParseException {
		CallableStatement callableStatement = connection.prepareCall("{CALL addUserInfo(?,?,?,?,?,?)}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		//BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		//String pass = bCryptPasswordEncoder.encode(user.getPassword());
		callableStatement.setString(1, user.getEmail());
		callableStatement.setString(2, user.getPassword());
		callableStatement.setString(3, user.getName());
		callableStatement.setString(4, user.getLastName());
		callableStatement.setString(5, user.getGender());
		callableStatement.setString(6, user.getDob());
		
		callableStatement.execute();
	}
	
	public ResultSet checkUser(Connection connection, User user) throws SQLException{
		CallableStatement callableStatement = connection.prepareCall("{CALL checkUser(?)}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		callableStatement.setString(1, user.getEmail());
		callableStatement.execute();
		return callableStatement.getResultSet();
	}
	
	public void createAd(Connection connection, AdDetails adDetails, String email)throws SQLException{
		CallableStatement callableStatement = connection.prepareCall("{CALL createAd(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		callableStatement.setString(1, email);
		callableStatement.setInt(2, adDetails.getRent());
		callableStatement.setString(3, adDetails.getAvailable_from());
		callableStatement.setString(4, adDetails.getMobile());
		callableStatement.setString(5, adDetails.getCity());
		callableStatement.setString(6, adDetails.getHood());
		callableStatement.setString(7, adDetails.getAddress());
		callableStatement.setString(8, adDetails.getRoom_type());
		callableStatement.setString(9, adDetails.getRoom_number());
		callableStatement.setString(10, adDetails.getPlace_size());
		callableStatement.setString(11, adDetails.getSet());
		callableStatement.setString(12, adDetails.getDetails());
		callableStatement.setShort(13, adDetails.getEssentials());
		callableStatement.setShort(14, adDetails.getTv());
		callableStatement.setShort(15, adDetails.getWifi());
		callableStatement.setShort(16, adDetails.getDesk());
		callableStatement.setShort(17, adDetails.getAc());
		callableStatement.setString(18, adDetails.getUrl());
		
		callableStatement.execute();
	}
	
	public ResultSet getAdID(Connection connection, String email) throws SQLException{
		CallableStatement callableStatement = connection.prepareCall("{CALL getAdID(?)}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		callableStatement.setString(1, email);
		callableStatement.execute();
		
		return callableStatement.getResultSet();
	}
	
	public void setImgFolder(Connection connection, int AdID, String img_folder) throws SQLException{
		CallableStatement callableStatement = connection.prepareCall("{CALL setImgFolder(?,?)}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		callableStatement.setInt(1, AdID);
		callableStatement.setString(2, img_folder);
		
		callableStatement.execute();
	}
	
	public ResultSet get6Ads(Connection connection) throws SQLException{
		CallableStatement callableStatement = connection.prepareCall("{CALL get6Ads()}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		callableStatement.execute();
		return callableStatement.getResultSet();
	}
	
	public ResultSet getAd(Connection connection, String url) throws SQLException{
		CallableStatement callableStatement = connection.prepareCall("{CALL getAd(?)}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		callableStatement.setString(1, url);
		callableStatement.execute();
		
		return callableStatement.getResultSet();
	}
}
