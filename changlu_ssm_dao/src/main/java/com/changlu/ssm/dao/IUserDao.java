package com.changlu.ssm.dao;

import com.changlu.ssm.domain.Role;
import com.changlu.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-10-30-14:34
 */
public interface IUserDao {

    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,
            many = @Many(select = "com.changlu.ssm.dao.IRoleDao.findRoleByUserId"))
    })
    public UserInfo findByUsername(String username)throws Exception;

    @Select("select * from users")
    List<UserInfo> findAll()throws Exception;

    @Insert("insert into users values(\"null\",#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo userInfo)throws Exception;

    //根据id来查询用户详情(包含角色以及权限)
    @Select("select * from users where id = #{userId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,
                    many = @Many(select = "com.changlu.ssm.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findById(String userId)throws Exception;

    @Select("select * from role where id not in (select roleId from users_role where userId = #{userId})")
    List<Role> findOtherRoles(String userId)throws Exception;//根据用户id来查询没有相关联的角色信息

    @Insert("insert into users_role values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId)throws Exception;
}
