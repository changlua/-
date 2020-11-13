package com.changlu.ssm.service.impl;

import com.changlu.ssm.dao.IOrdersDao;
import com.changlu.ssm.domain.Orders;
import com.changlu.ssm.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-26-15:13
 */
@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService{

    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page,int pageSize) throws Exception {
        //参数pageNum是页码值  参数pageSize 代码每页显示条数
        PageHelper.startPage(page,pageSize);//注意：必须在对应查询方法之前，并且这中间不能包含任何语句
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String orderId) throws Exception {
        return ordersDao.findById(orderId);
    }
}
