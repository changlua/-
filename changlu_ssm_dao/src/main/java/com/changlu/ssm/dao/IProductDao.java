package com.changlu.ssm.dao;

import com.changlu.ssm.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-22-22:21
 */

public interface IProductDao {

    @Select("select *from product where id=#{id}")
    Product findById(String id)throws Exception;

    //查询所有的产品信息
    @Select("select * from product")
    List<Product> findAll() throws Exception;

    //插入一条记录
    @Insert("insert into product(id,productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) " +
            "values(\"null\",#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product)throws Exception;
}
