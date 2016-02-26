package com.roommate.room;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/SL", method = RequestMethod.GET)
	public String SL(){
		return "SL";
	}
	
	@RequestMapping(value="/CreateAd", method = RequestMethod.GET)
	public String WriteProfile(){
		return "CreateAd";
	}
	
	@RequestMapping(value="/CheckAd", method = RequestMethod.GET)
	public String CheckAds(){
		return "CheckAd";
	}
}
