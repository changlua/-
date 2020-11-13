package com.changlu.ssm.service.impl;

import com.changlu.ssm.dao.IUserDao;
import com.changlu.ssm.domain.Role;
import com.changlu.ssm.domain.UserInfo;
import com.changlu.ssm.service.IUserService;
import com.changlu.ssm.utils.BCryptPasswordEncoderUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-30-11:40
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己用户对象封装成UserDetails,第三个是权限设置  new BCryptPasswordEncoder().encode(userInfo.getPassword())
        //"{noop}"+userInfo.getPassword()
        User user = new User(userInfo.getUsername(),userInfo.getPassword(),
                userInfo.getStatus()==0?false:true,
                true,true,true, getAuthority(userInfo.getRoles()));
        return user;
    }

    //作用就是返回一个list集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roleLists){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        //将对应实体类中的角色描述放置到对应的集合中
        for (Role role : roleLists) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }


    @Override
    public List<UserInfo> findAll() throws Exception {
        return userDao.findAll();
    }

    @Override
    public void save(UserInfo userInfo)throws Exception{
        //使用自定义Utils来对密码进行加密
        userInfo.setPassword(BCryptPasswordEncoderUtils.encodePassword(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    @Override
    public UserInfo findById(String userId)throws Exception {
        return userDao.findById(userId);
    }

    @Override
    public List<Role> findOtherRoles(String userId) throws Exception{
        return userDao.findOtherRoles(userId);
    }

    @Override
    public void addRoleToUser(String userId, String roleId) throws Exception {
        userDao.addRoleToUser(userId,roleId);
    }
}
