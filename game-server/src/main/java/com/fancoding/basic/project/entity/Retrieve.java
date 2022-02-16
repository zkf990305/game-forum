package com.fancoding.basic.project.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @Author: caidaxing
 * @Date: 2022/01/20/14:44
 * @Description: 找回密码
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Retrieve implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户名
     */
    private String username;

    /**
     * 邮箱
     */
    private String email;



}
