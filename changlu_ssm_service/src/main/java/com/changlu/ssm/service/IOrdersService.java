package com.changlu.ssm.service;

import com.changlu.ssm.domain.Orders;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-26-15:12
 */
public interface IOrdersService {

    List<Orders> findAll(int page,int pageSize)throws Exception;

    Orders findById(String orderId)throws Exception;
}
