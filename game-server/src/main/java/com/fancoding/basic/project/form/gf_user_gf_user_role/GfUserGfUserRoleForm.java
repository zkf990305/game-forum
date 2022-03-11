package com.fancoding.basic.project.form.gf_user_gf_user_role;

import com.fancoding.basic.project.entity.GfUserGfUserRole;
import com.fancoding.basic.project.entity.GfUserGfUserRole;
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
@ApiModel("更新权限需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class GfUserGfUserRoleForm extends BaseForm<GfUserGfUserRole> {

    @ApiModelProperty("主键")
    private Integer id;

    /**
     * 用户id
     */
    @ApiModelProperty("用户id")
    private String uid;

    /**
     * 用户权限
     */
    @ApiModelProperty("用户权限不为空")
    @NotNull(message = "用户权限不为空")
    private Integer rid;





    /**
     * 构造实体
     * @return 实体对象
     */
    @Override
    public GfUserGfUserRole buildEntity() {
        GfUserGfUserRole gfUserInfo = new GfUserGfUserRole();
        BeanUtils.copyProperties(this,gfUserInfo);
        return gfUserInfo;
    }
}
