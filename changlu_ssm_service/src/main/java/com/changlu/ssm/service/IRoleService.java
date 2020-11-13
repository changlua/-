package com.changlu.ssm.service;

import com.changlu.ssm.domain.Permission;
import com.changlu.ssm.domain.Role;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-07-23:13
 */
public interface IRoleService {


    List<Role> findAll()throws Exception;

    void save(Role role)throws Exception;

    Role findById(String roleId)throws Exception;

    void deleteRoleById(String roleId)throws Exception;

    List<Permission> findOtherPermissions(String roleId);

    void addPermissionToRole(String roleId, String[] ids)throws Exception;
}
