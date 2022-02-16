package com.fancoding.basic.project.form.gf_user_info;

import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.entity.RegisterGfUser;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;

/**
 * @Author: caidaxing
 * @Date: 2022/01/23/0:53
 * @Description:
 */
@Data
@ApiModel("更新用户需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class GfUserInfoForm extends BaseForm<GfUserInfo> {

    @ApiModelProperty("主键")
    private Integer id;

    /**
     * 用户id
     */
    @ApiModelProperty("用户id")
    private String uid;

    /**
     * 用户昵称
     */
    @ApiModelProperty("用户昵称")
    @NotEmpty(message = "用户昵称")
    @Length(min = 3 , max = 16 , message = "用户昵称长度限制为3~16")
    private String nickname;

    /**
     * 真实姓名
     */
    @ApiModelProperty("真实姓名")
    private String realName;

    /**
     * 生日
     */
    @ApiModelProperty(value = "生日")
    @Past(message = "生日时间必须小于当前时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthday;

    /**
     * 性别
     */
    @ApiModelProperty(value = "性别")
    @NotNull(message = "性别不能为空")
    private Integer gender;

    /**
     * QQ
     */
    @ApiModelProperty(value = "QQ")
    private String qq;

    /**
     * WeChat
     */
    @ApiModelProperty(value = "WeChat")
    private String weChat;

    /**
     * 邮箱
     */
    @ApiModelProperty(value = "邮箱")
    @NotEmpty(message = "邮箱不能为空")
    @Email(message="请输入正确的邮箱")
    private String email;

    /**
     * 手机
     */
    @ApiModelProperty(value = "手机")
    @Pattern(regexp = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$", message = "手机号不符合规则")
    private String phone;

    /**
     * 地址
     */
    @ApiModelProperty(value = "地址")
    private String address;

    /**
     * 爱好
     */
    @ApiModelProperty(value = "爱好")
    private String hobby;

    /**
     * 自我介绍
     */
    @ApiModelProperty(value = "自我介绍")
    private String intro;

    /**
     * 工作
     */
    @ApiModelProperty(value = "工作")
    private String work;

    /**
     * 构造实体
     * @return 实体对象
     */
    @Override
    public GfUserInfo buildEntity() {
        GfUserInfo gfUserInfo = new GfUserInfo();
        BeanUtils.copyProperties(this,gfUserInfo);
        return gfUserInfo;
    }
}
