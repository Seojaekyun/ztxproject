package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MembershipController {

    @GetMapping("/membership/membership")
    public String membershipPage() 
    {
        return "/membership/membership";  
    }
    
    @GetMapping("/membership/membershipsogae")
    public String membershipsogae()
    {
    	return "/membership/membershipsogae";
    }
    
    @GetMapping("/membership/membershipcoupon")
    public String membershipcoupon()
    {
    	return "/membership/membershipcoupon";
    }
}
