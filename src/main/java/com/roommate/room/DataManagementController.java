package com.roommate.room;

import java.sql.Connection;
import java.sql.ResultSet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DataManagementController {
	
	static String username = "sa", pass = "123456", dataName = "Roommate", port = "64201";

	@RequestMapping(value="/addUserInfo", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String addEmployee (@RequestBody User user){
		Database database = new Database(username, pass, dataName, port);
		Connection connection = null;
		
		try{
			connection = database.connect();
			ResultSet resultSet = database.checkUser(connection, user);
			while(resultSet.next()){
				if(resultSet.getString(1).equals(user.getEmail())) //check if there is a user with that email address in the database
					return "false"; 
			}
		}catch(Exception e){
			e.printStackTrace();
			return e.toString();
		}
		try{
			database.addUserInfo(connection, user);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "a";	
	}
	
	@RequestMapping(value="/checkUser", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String checkUser (@RequestBody User user){
		Database database = new Database(username, pass, dataName, port);
		Connection connection = null;
		
		try {
			connection = database.connect();
			ResultSet resultSet = database.checkUser(connection, user);
			while(resultSet.next()){
				if(resultSet.getString(1).equals(user.getEmail()) && resultSet.getString(2).equals(user.getPassword()))
					return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
		return "false";
	}

}
