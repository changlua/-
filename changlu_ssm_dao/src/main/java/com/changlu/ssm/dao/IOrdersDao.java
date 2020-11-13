package com.changlu.ssm.dao;

import com.changlu.ssm.domain.Member;
import com.changlu.ssm.domain.Orders;
import com.changlu.ssm.domain.Product;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-26-15:14
 */
public interface IOrdersDao {

    @Select("select * from orders ")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId",javaType = Product.class,
                    one = @One(select = "com.changlu.ssm.dao.IProductDao.findById"))
    })//注意对应column="productId"指的是对应数据库中查询到的名称，之后根据数据库对应的productId来查询对应产品表
    List<Orders> findAll()throws Exception;

    @Select("select * from orders where id=#{orderId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId",javaType = Product.class,
                    one = @One(select = "com.changlu.ssm.dao.IProductDao.findById")),
            @Result(property = "member",column = "memberId",javaType = Member.class,
                    one = @One(select = "com.changlu.ssm.dao.IMemberDao.findByOrdersId")),
            @Result(property = "travellers",column = "id",javaType = List.class,
            many = @Many(select = "com.changlu.ssm.dao.ITravellerDao.findById"))
    })//注意对应column="productId"指的是对应数据库中查询到的名称，之后根据数据库对应的productId来查询对应产品表
    Orders findById(String orderId);
}
