/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.dao.BookDao;
import com.service.BookService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Barne's
 */
@Service
@Transactional
public class BookServiceImpl implements BookService{
    
     @Autowired
     BookDao bookDao;
    
    @Override
    public Map getData(int pageNumber, int pageSize, String sort, String query, String filter) {
        Map response= new HashMap();
        Map meta= new HashMap();
        List<Map> listResult =new ArrayList<Map>();
        List<Object[]> listDataObject =bookDao.getData(sort, query, pageNumber, pageSize, filter);
        System.out.println(listDataObject.size());
        for (Object[] data : listDataObject) {
            Map dataObjeck= new HashMap<String, Object>();
            System.out.println(data[0]);
             if (data[0] != null){
                 System.out.println(data[0]);
                 dataObjeck.put("id",data[0]);
             }
             
             if (data[1] != null){
                  System.out.println(data[1]);
                  dataObjeck.put("title",data[1]);
             }
             
             if (data[2] != null){
                     System.out.println(data[2]);
                    dataObjeck.put("price",data[2]);
             }
             if (data[3] != null){
                  System.out.println(data[3]);
                  dataObjeck.put("status",data[3]);
             }
             System.out.println(dataObjeck);
             listResult.add(dataObjeck);
        }
        
        meta.put("page", pageNumber);
        meta.put("size", pageSize);
        meta.put("count", listResult.size()%pageSize);
        meta.put("TotalPage",(listResult.size()/pageSize)+1);
        meta.put("totalData", listResult.size());
        
        
        response.put("status","succes");
        response.put("code","200");
        
        response.put("data", listResult);
        response.put("meta", meta);
        
        return response;
    }
    
}
