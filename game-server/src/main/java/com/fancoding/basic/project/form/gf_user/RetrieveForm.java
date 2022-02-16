package com.fancoding.basic.project.form.gf_user;

import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.Retrieve;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @Author: caidaxing
 * @Date: 2022/01/21/16:09
 * @Description: 找回密码需要的表单数据
 */
@Data
@ApiModel("找回密码需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class RetrieveForm extends BaseForm<Retrieve> {

    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    @NotEmpty(message = "用户名不能为空")
    private String username;

    /**
     * 邮箱
     */
    @ApiModelProperty(value = "邮箱")
    @Email(message="请输入正确的邮箱")
    private String email;

    @Override
    public Retrieve buildEntity() {
        Retrieve retrieve = new Retrieve();
        BeanUtils.copyProperties(this, retrieve);
        return retrieve;
    }
}
