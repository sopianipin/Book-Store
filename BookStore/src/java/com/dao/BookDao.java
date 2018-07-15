/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.BookDataModel;
import java.util.List;

/**
 *
 * @author Barne's
 */
public interface BookDao {
    public List<Object[]> getData(String shorting, String cariKey,int page,int size, String filter);
}
