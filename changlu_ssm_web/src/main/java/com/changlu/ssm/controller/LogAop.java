package com.changlu.ssm.controller;

import com.changlu.ssm.domain.SysLog;
import com.changlu.ssm.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @anthor changlu
 * @create 2020-11-10-18:23
 */
@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;//在web.xml中配置listener，RequestContextListener这个类来产生request

    @Autowired
    private ISysLogService sysLogService;

    private Date startTime;//访问时间
    private Class executionClass;//访问的类
    private Method executionMethod;//访问的方法

    //前置通知
    @Before("execution(* com.changlu.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        startTime = new Date();
        //获取访问的类
        executionClass = jp.getTarget().getClass();
        //1、获取访问的方法名称
        String methodName = jp.getSignature().getName();
        Object[] args = jp.getArgs();//获取方法中的所有参数
        //获取对应方法Method
        if(args == null || args.length == 0){
            executionMethod = executionClass.getMethod(methodName);//获取无参方法
        }else{
            //填充有效参数的class数组
            Class[] classArgs = new Class[args.length];
            for(int i=0;i<args.length;i++){
                classArgs[i] = args[i].getClass();
            }
            executionMethod = executionClass.getMethod(methodName,classArgs);//获取有效参数方法
        }
    }

    //后置通知
    @After("execution(* com.changlu.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint joinPoint) throws Exception {
        //2、获取访问的总时间
        long time = new Date().getTime() - startTime.getTime();
        
        //3、获取访问的url
        String url = "";

        if(executionClass != null && executionMethod != null && executionClass != LogAop.class && executionClass != SysLogController.class){
            //获取类上的@RequestMapping
            RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
            if(classAnnotation != null){
                String[] classValue = classAnnotation.value();
                
                //获取方法上的@RequestMapping
                RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
                String[] methodValue = methodAnnotation.value();
                url = classValue[0]+methodValue[0];//类与方法上的注解中的值进行合并，就是对应的访问url

                //4.获取ip地址
                String ip = request.getRemoteAddr();

                //5、获取操作者，也就是用户名称,这是方式一
                SecurityContext context = SecurityContextHolder.getContext();
                User user = (User) context.getAuthentication().getPrincipal();
                String username = user.getUsername();

                //注入到SysLog实体类中
                SysLog sysLog = new SysLog();
                sysLog.setExecutionTime(time);
                sysLog.setIp(ip);
                sysLog.setUsername(username);
                sysLog.setVisitTime(startTime);
                sysLog.setUrl(url);
                sysLog.setMethod("[类名]"+executionClass.getName()+" [方法名]"+executionMethod.getName());

                sysLogService.save(sysLog);

            }
            
        }

    }
}
