package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PickupController {

	@GetMapping("/pickup/pickup")
	public String pickup()
	{
		return "/pickup/pickup";
	}
}
