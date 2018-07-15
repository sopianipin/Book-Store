/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import java.util.List;
import java.util.Map;

/**
 *
 * @author Barne's
 */
public interface BookService {
    public Map getData(int pageNumber,int pageSize,String sort,String query,String filter);
}
