package com.fancoding.basic.project.form.gf_user;

import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.RegisterGfUser;
import com.fancoding.basic.project.form.BaseForm;
import com.fasterxml.jackson.annotation.JsonFormat;
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
 * @author fancoding
 * Date: Created in 2020/3/6 3:28 下午
 * Utils: Intellij Idea
 * Description: 添加用户需要的表单数据
 */
@Data
@ApiModel("添加用户需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class RegisterGfUserForm extends BaseForm<RegisterGfUser> {



    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    @NotEmpty(message = "用户名不能为空")
    @Length(min = 3 , max = 16 , message = "用户名长度限制为3~16")
    private String username;

    /**
     * 密码
     */
    @ApiModelProperty("密码")
    @NotEmpty(message = "密码不能为空")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[._~!@#$^&*])[A-Za-z0-9._~!@#$^&*]{8,20}$" , message = "密码不符合规范")
    private String password;

    /**
     * 确认密码
     */
    @ApiModelProperty(value = "确认密码")
    @NotEmpty(message = "密码不能为空")
    private String rePassword;


    /**
     * 邮箱
     */
    @ApiModelProperty(value = "邮箱")
    @Email(message="请输入正确的邮箱")
    private String email;

    /**
     * 性别
     */
    @ApiModelProperty(value = "性别")
    @NotNull(message = "性别不能为空")
    private Integer gender;

    /**
     * 生日
     */
    @ApiModelProperty(value = "生日")
    @Past(message = "生日时间必须小于当前时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthday;

    /**
     * 构造实体
     * @return 实体对象
     */
    @Override
    public RegisterGfUser buildEntity() {
        RegisterGfUser registerGfUser = new RegisterGfUser();
        BeanUtils.copyProperties(this,registerGfUser);
        return registerGfUser;
    }
}
