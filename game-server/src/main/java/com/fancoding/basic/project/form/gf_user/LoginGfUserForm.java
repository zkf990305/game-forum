package com.fancoding.basic.project.form.gf_user;

import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.RegisterGfUser;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * @Author: caidaxing
 * @Date: 2022/01/21/16:09
 * @Description: 登录需要的表单数据
 */
@Data
@ApiModel("登录需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class LoginGfUserForm extends BaseForm<GfUser> {

    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    @NotEmpty(message = "用户名不能为空")
    private String username;

    /**
     * 密码
     */
    @ApiModelProperty("权限")
    @NotNull(message = "身份不能为空")
    private Integer role;

    /**
     * 权限
     */
    @ApiModelProperty("密码")
    @NotEmpty(message = "密码不能为空")
    private String password;

    @Override
    public GfUser buildEntity() {
        GfUser gfUser = new GfUser();
        BeanUtils.copyProperties(this, gfUser);
        return gfUser;
    }
}
