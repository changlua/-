# 项目描述
基于SSM的权限管理系统，前端使用AdminLTE框架

基础数据 <br>
1、产品管理： <br>
页面：product-list.jsp、product-add.jsp <br>
功能：查询、添加 <br>
2、订单管理：<br>
页面：orders-page-list.jsp、orders-show.jsp <br>
功能：查询(分页)、订单详情


系统管理 <br>
1、用户管理： <br>
页面：user-list.jsp、user-add.jsp、user-show.jsp、user-role-add.jsp <br>
功能：查询、添加、用户详情、添加角色关联 <br>
2、角色管理：
页面：role-list.jsp、role-add.jsp、role-show.jsp、role-permission-add.jsp <br>
功能：查询、添加角色、详情、删除、添加权限关联 <br>
3、资源权限管理：<br>
页面：permission-list.jsp、permission-add.jsp  <br>
功能：查询、添加 <br>
4、访问日志：<br>
页面：syslog-list.jsp <br>
功能：查询日志

权限控制(spring security)：
登陆、登出、显示用户名、根据权限显示页面功能

----------

# 技术栈 <br>
前端：AdminLTE <br>
后端：Mysql5.5、Tomcat、SSM、Spring Security <br>

----------

# 导入sql语句
changlu_ssm_web\src\main\resources\static\sql的目录下有对应的sql脚本 <br>
**注意：** <br>
首先手动执行下列命令：

    DROP DATABASE IF EXISTS ssm2;
    CREATE DATABASE IF NOT EXISTS ssm2;
    USE ssm2;
之后导入提供的sql脚本即可。<br>
![](https://gitee.com/changluJava/picture-bed/raw/master/mouse/20201121152801.png)