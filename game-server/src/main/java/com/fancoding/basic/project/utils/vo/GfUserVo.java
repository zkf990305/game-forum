package com.fancoding.basic.project.utils.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * @Author: caidaxing
 * @Date: 2022/02/18/2:21
 * @Description:
 */
@Data
@ApiModel("用户信息视图模型")
public class GfUserVo {

    /**
     * 自增id 用户编号
     */
    @ApiModelProperty("id")
    private Integer id;

    /**
     * 自增id 用户编号
     */
    @ApiModelProperty("uid")
    private String uid;

    /**
     * 用户名称
     */
    @ApiModelProperty("用户名称")
    private String username;

    /**
     * 密码
     */
    @ApiModelProperty("密码")
    private String password;

    /**
     * 头像地址
     */
    @ApiModelProperty("头像地址")
    private String avatarUrl;

    /**
     * 真实姓名
     */
    @ApiModelProperty("真实姓名")
    private String realName;

    /**
     * 生日
     */
    @ApiModelProperty("生日")
    private LocalDate birthday;

    /**
     * 性别
     */
    @ApiModelProperty("性别")
    private Integer gender;

    /**
     * QQ
     */
    @ApiModelProperty("QQ")
    private String qq;

    /**
     * WeChat
     */
    @ApiModelProperty("WeChat")
    private String weChat;

    /**
     * 邮箱
     */
    @ApiModelProperty("邮箱")
    private String email;

    /**
     * 手机
     */
    @ApiModelProperty("手机")
    private String phone;

    /**
     * 地址
     */
    @ApiModelProperty("地址")
    private String address;

    /**
     * 自我介绍
     */
    @ApiModelProperty("自我介绍")
    private String intro;

    /**
     * 状态0为可用 1位不可用
     */
    @ApiModelProperty("状态0为可用 1位不可用")
    private Integer status;

    /**
     * 角色名称
     */
    @ApiModelProperty("角色名称")
    private Integer role;





}
