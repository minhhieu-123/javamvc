package vn.hoidanit.laptopshop.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.domain.CloundTest;

@RestController
@RequestMapping("/clound")
public class CloundAPIService {
    CloundTest cloundTest;

    @GetMapping("/{id}")
    public CloundTest getClound(String id){
        return cloundTest;
    }
    @PostMapping
    public String createClound(@RequestBody CloundTest cloundTest){
        this.cloundTest = cloundTest;
        return "Clound create Susscessfuly";
    }
}
