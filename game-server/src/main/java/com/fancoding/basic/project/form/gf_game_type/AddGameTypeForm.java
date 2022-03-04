package com.fancoding.basic.project.form.gf_game_type;

import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotEmpty;

/**
 * @Author: caidaxing
 * @Date: 2022/02/02/15:23
 * @Description:
 */
@Data
@ApiModel("添加留言需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class AddGameTypeForm extends BaseForm<GfGameType> {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 内容
     */
    @NotEmpty(message = "游戏类型不能为空")
    private String type;


    @Override
    public GfGameType buildEntity() {
        GfGameType gfGameType = new GfGameType();
        BeanUtils.copyProperties(this, gfGameType);
        return gfGameType;
    }
}
