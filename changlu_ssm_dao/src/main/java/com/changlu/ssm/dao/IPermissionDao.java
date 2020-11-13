package com.changlu.ssm.dao;

import com.changlu.ssm.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-05-23:44
 */
public interface IPermissionDao {

    @Select("SELECT * FROM `permission` WHERE id IN (SELECT permissionId FROM `role_permission` WHERE roleId = #{roleId})")
    List<Permission> findByRoleId(String roleId)throws Exception;

    @Select("select * from permission")
    List<Permission> findAll()throws Exception ;

    @Insert("insert into permission values(\"null\",#{permissionName},#{url})")
    void save(Permission permission)throws Exception ;

}
