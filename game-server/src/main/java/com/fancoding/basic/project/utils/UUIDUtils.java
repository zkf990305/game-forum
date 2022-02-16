package com.fancoding.basic.project.utils;

import java.sql.Timestamp;
import java.util.UUID;

/**
 * @Author: caidaxing
 * @Date: 2022/01/19/14:59
 * @Description: uuid
 */
public class UUIDUtils {

    static boolean printFlag = true;

    public static String getUuid(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    public static Timestamp getTime(){
        return new Timestamp(System.currentTimeMillis());
    }

    public static void print(String msg){
        if (printFlag){
            System.out.println("fanCode:=>"+msg);
        }
    }
}
