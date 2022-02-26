package com.fancoding.basic.project.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @Author: caidaxing
 * @Date: 2022/01/20/14:44
 * @Description: 修改密码
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ResetPwd implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private String id;

    /**
     * 旧密码
     */
    private String oldPassword;

    /**
     * 新密码
     */
    private String newPassword;

    /**
     * 确认密码
     */
    private String confirmPassword;



}
