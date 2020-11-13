package com.changlu.ssm.controller;

import com.changlu.ssm.domain.Orders;
import com.changlu.ssm.service.IOrdersService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-26-15:10
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private IOrdersService ordersService;

//    //查询订单(未分页)
//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll() throws Exception{
//        List<Orders> ordersList = ordersService.findAll();
//        ModelAndView view = new ModelAndView();
//        view.addObject("ordersList",ordersList);
//        view.setViewName("orders-list");
//        return view;
//    }

    //查询订单(分页)
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {
        ModelAndView view = new ModelAndView();
        List<Orders> ordersList = ordersService.findAll(page,pageSize);//查询对应页数的内容
        //pageInfo就是一个分页bean，其中包含了对应查询的数据以及对应的页码数等 用于之后在响应中进行分页判断
        PageInfo pageInfo = new PageInfo(ordersList);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("orders-page-list");
        return view;
    }

    //查询订单详情
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true)String orderId) throws Exception{
        ModelAndView view = new ModelAndView();
        Orders orders = ordersService.findById(orderId);
        view.addObject("orders",orders);
        view.setViewName("orders-show");
        return view;
    }




}
