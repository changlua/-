package com.changlu.ssm.controller;

import com.changlu.ssm.domain.Permission;
import com.changlu.ssm.domain.Role;
import com.changlu.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @anthor changlu
 * @create 2020-11-07-23:11
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    //查询所有角色
    @RequestMapping("/findAll.do")
    public ModelAndView findAll()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Role> roles = roleService.findAll();
        mv.addObject("roleList",roles);
        mv.setViewName("role-list");
        return mv;
    }

    //保存角色
    @RequestMapping("/save.do")
    public String save(Role role)throws Exception{
        roleService.save(role);
        return "redirect:findAll.do";
    }

    //通过角色id来查询角色
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id")String roleId)throws Exception{
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(roleId);
        mv.addObject("role",role);
        mv.setViewName("role-show");
        return mv;
    }

    //通过角色Id来删除角色
    @RequestMapping("/deleteRole.do")
    public String deleteRoleById(@RequestParam(name = "id")String roleId)throws Exception{
        roleService.deleteRoleById(roleId);
        return "redirect:findAll.do";
    }

    //查询未关联角色的权限信息
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id") String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //来查询角色信息
        Role role = roleService.findById(roleId);
        //查询对应角色未关联权限信息
        List<Permission> permissionList = roleService.findOtherPermissions(roleId);
        mv.addObject("role",role);
        mv.addObject("permissionList",permissionList);
        mv.setViewName("role-permission-add");
        return mv;
    }


    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(String roleId,String[] ids)throws Exception{
        //逐条插入到role-permission中间表
        roleService.addPermissionToRole(roleId,ids);
        return "redirect:findAll.do";
    }

}
