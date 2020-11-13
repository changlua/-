package com.changlu.ssm.dao;

import com.changlu.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

/**
 * @anthor changlu
 * @create 2020-10-28-12:09
 */
public interface IMemberDao {

    @Select("select * from member where id = #{id}")
    Member findByOrdersId(String id)throws Exception;
}
