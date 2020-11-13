package com.changlu.ssm.service;

import com.changlu.ssm.domain.Role;
import com.changlu.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-30-11:40
 */
public interface IUserService extends UserDetailsService{

    List<UserInfo> findAll()throws Exception;

    void save(UserInfo userInfo)throws Exception;

    UserInfo findById(String userId)throws Exception;

    List<Role> findOtherRoles(String userId)throws Exception;

    void addRoleToUser(String userId, String roleId)throws Exception;
}
