package com.changlu.ssm.dao;

import com.changlu.ssm.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-11-10:46
 */
public interface ISysLogDao {

    @Insert("insert into syslog values('null',#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void save(SysLog sysLog)throws Exception;

    @Select("select * from syslog")
    List<SysLog> findAll()throws Exception;
}
