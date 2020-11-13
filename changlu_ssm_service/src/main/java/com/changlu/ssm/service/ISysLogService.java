package com.changlu.ssm.service;

import com.changlu.ssm.domain.SysLog;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-11-10:44
 */
public interface ISysLogService {

    void save(SysLog sysLog)throws Exception;

    List<SysLog> findAll()throws Exception;
}
