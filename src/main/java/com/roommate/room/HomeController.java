package com.roommate.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
	
	@RequestMapping(value="/Ad", method = RequestMethod.GET)
	public String Ad(){
		return "Ad";
	}
}
