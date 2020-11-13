package com.changlu.ssm.service;

import com.changlu.ssm.domain.Permission;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-08-0:17
 */

public interface IPermissionService {

    List<Permission> findAll()throws Exception;

    void save(Permission permission)throws Exception;
}
