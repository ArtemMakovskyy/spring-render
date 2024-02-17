package com.example.demo.controller;

import java.time.LocalDateTime;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
    @GetMapping
    public String start(){
        return LocalDateTime.now() + " " + " render";
    }
}
