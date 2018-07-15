/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.impl;

import com.dao.BookDao;
import com.model.BookDataModel;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Barne's
 */
public class BookDaoImpl extends HibernateUtil implements BookDao{

    @Override
    public List<Object[]> getData(String shorting, String cariKey, int page, int size,String filter) {
        List<Object[]> dataList = null;
        cariKey.toLowerCase();
        String sql = "select * from book_tbl where LOWER(title) like '%"+cariKey+"%' and status = '"+filter+"'"+
                " order by "+shorting+"  limit "+page+","+size;
        Query query = createNativeQuery(sql);
        dataList = query.list();
        return dataList;
    }

}
