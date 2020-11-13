package com.changlu.ssm.controller;

import com.changlu.ssm.domain.Role;
import com.changlu.ssm.domain.UserInfo;
import com.changlu.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-03-23:26
 */
@Controller
@RequestMapping("/user")
public class UsersController {

    @Autowired
    private IUserService userService;

    //查询所有用户
    @RequestMapping("/findAll.do")
    public ModelAndView findAll()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userList =  userService.findAll();
        mv.addObject("userList",userList);
        mv.setViewName("user-list");
        return mv;
    }

    //添加用户
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo)throws Exception{
        userService.save(userInfo);
        return "redirect:findAll.do";
    }

    //根据id查询用户(并间接查询角色以及权限信息)
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id)throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    //根据用户id来查询没有关联的角色信息
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id")String userId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //查询用户信息，用于传递用户
        UserInfo userInfo = userService.findById(userId);
        //查询与该userId没有相关联的权限信息
        List<Role> roleList = userService.findOtherRoles(userId);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",roleList);
        mv.setViewName("user-role-add");
        return mv;
    }

    //存储userId与多个roleId到中间表users_role中
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(String userId,String[] ids)throws Exception{
        //进行一条一条存储到中间表中
        for (String roleId : ids) {
            userService.addRoleToUser(userId,roleId);
        }
        return "redirect:findAll.do";
    }

}
