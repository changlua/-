package com.changlu.ssm.service.impl;

import com.changlu.ssm.dao.IPermissionDao;
import com.changlu.ssm.domain.Permission;
import com.changlu.ssm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-08-0:18
 */
@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll() throws Exception {
        return permissionDao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception{
        permissionDao.save(permission);
    }
}
