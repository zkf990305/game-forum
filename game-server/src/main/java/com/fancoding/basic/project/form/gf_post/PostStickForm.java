package com.fancoding.basic.project.form.gf_post;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fancoding.basic.project.entity.AddPost;
import com.fancoding.basic.project.entity.GfPost;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotEmpty;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: caidaxing
 * @Date: 2022/02/02/15:23
 * @Description:
 */
@Data
@ApiModel("添加帖子需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class PostStickForm extends BaseForm<GfPost> {

    /**
     * 自增id 帖子id

     */
    private Integer id;

    /**
     * 默认0， 1加精，2置顶，3精+顶
     */
    private Integer isStick;

    @Override
    public GfPost buildEntity() {
        GfPost gfPost = new GfPost();
        BeanUtils.copyProperties(this, gfPost);
        return gfPost;
    }
}
