/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.google.gson.Gson;
import com.service.BookService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Barne's
 */
@Controller
public class BookController {
    @Autowired
    BookService bookService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String viewDosenIndexPage( ModelMap model) {
        return "index";
    }
    
    @RequestMapping(value = "/book", method = RequestMethod.GET)
    @ResponseBody
    String getData(int pageNumber, int pageSize, String sort, String query, String filter){
        Map map = bookService.getData(pageNumber, pageSize, sort, query, filter);
        return new Gson().toJson(map);
    }
}
