/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author qnhat
 */
@Controller
public class TestLayout {

    public class Testlayout {

        @RequestMapping("/hello")
        public String showHello(Model model) {
            return "/layout/Admin/main";
        }
    }

}
