package com.fancoding.basic.project.form.gf_post_classify;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostClassify;
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
public class AddPostClassifyForm extends BaseForm<GfPostClassify> {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 内容
     */
    @NotEmpty(message = "帖子类型不能为空")
    private String classify;


    @Override
    public GfPostClassify buildEntity() {
        GfPostClassify gfPostClassify = new GfPostClassify();
        BeanUtils.copyProperties(this, gfPostClassify);
        return gfPostClassify;
    }
}
