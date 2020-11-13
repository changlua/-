package com.changlu.ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @anthor changlu
 * @create 2020-10-26-16:29
 */
public class DateUtils {

    /**
     * 传入日期类及转换的类型 获取转换的字符串
     * @param date 日期类
     * @param pattern 转换的类型
     * @return 转为字符串的日期
     */
    public static String date2String(Date date,String pattern){
        String dateStr = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            dateStr = sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return dateStr;
    }



}
