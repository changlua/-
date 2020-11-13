package com.changlu.ssm.dao;

import com.changlu.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-28-13:10
 */
public interface ITravellerDao {

    @Select("SELECT * FROM traveller WHERE id IN (SELECT travellerId FROM order_traveller WHERE orderId = #{ordersId} )")
    List<Traveller> findById(String ordersId);
}
