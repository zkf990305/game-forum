package com.fancoding.basic.project.form.gf_post_tag;

import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.entity.GfPostTag;
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
public class AddPostTagForm extends BaseForm<GfPostTag> {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 内容
     */
    @NotEmpty(message = "帖子标签不能为空")
    private String tag;


    @Override
    public GfPostTag buildEntity() {
        GfPostTag gfPostTag = new GfPostTag();
        BeanUtils.copyProperties(this, gfPostTag);
        return gfPostTag;
    }
}
