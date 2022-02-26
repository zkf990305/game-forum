package com.fancoding.basic.project.form.gf_user;

import com.fancoding.basic.project.entity.ResetPwd;
import com.fancoding.basic.project.entity.Retrieve;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

/**
 * @Author: caidaxing
 * @Date: 2022/01/21/16:09
 * @Description: 找回密码需要的表单数据
 */
@Data
@ApiModel("找回密码需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class ResetPwdForm extends BaseForm<ResetPwd> {

    /**
     * 用户id
     */
    @ApiModelProperty("用户id")
    private String id;

    /**
     * 旧密码
     */
    @ApiModelProperty("旧密码")
    @NotEmpty(message = "旧密码不能为空")
    private String oldPassword;

    /**
     * 新密码
     */
    @ApiModelProperty(value = "新密码")
    @NotEmpty(message="新密码不能为空")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[._~!@#$^&*])[A-Za-z0-9._~!@#$^&*]{8,20}$" , message = "新密码不符合规范")
    private String newPassword;

    /**
     * 确认密码
     */
    @ApiModelProperty("确认密码")
    @NotEmpty(message = "确认密码不能空")
    private String confirmPassword;

    @Override
    public ResetPwd buildEntity() {
        ResetPwd resetPwd = new ResetPwd();
        BeanUtils.copyProperties(this, resetPwd);
        return resetPwd;
    }
}
