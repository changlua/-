package com.changlu.ssm.service.impl;

import com.changlu.ssm.dao.IRoleDao;
import com.changlu.ssm.domain.Permission;
import com.changlu.ssm.domain.Role;
import com.changlu.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-07-23:15
 */
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll() throws Exception {
        return roleDao.findAll();
    }

    @Override
    public void save(Role role)throws Exception {
        roleDao.save(role);
    }

    @Override
    public Role findById(String roleId) throws Exception{
        return roleDao.findById(roleId);
    }

    @Override
    public void deleteRoleById(String roleId) throws Exception {
        //删除user_role中间表的关于角色的信息
        roleDao.deleteFromUser_RoleByRoleId(roleId);
        //删除role_permission中间表的角色信息
        roleDao.deleteFromRole_PermissionByRoleId(roleId);
        //删除在role表中的相关role信息
        roleDao.deleteFromRole(roleId);
    }

    @Override
    public List<Permission> findOtherPermissions(String roleId) {
        return roleDao.findOtherPermissions(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] ids) throws Exception{
        for (String permissionId : ids) {
            roleDao.addPermissionToRole(roleId,permissionId);
        }
    }
}
