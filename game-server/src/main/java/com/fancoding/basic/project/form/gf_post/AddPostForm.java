package com.fancoding.basic.project.form.gf_post;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fancoding.basic.project.entity.*;
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
public class AddPostForm extends BaseForm<AddPost> {

    /**
     * 帖子标题
     */
    @NotEmpty(message = "帖子标题不能为空")
    private String title;

    /**
     * 帖子内容
     */
    @NotEmpty(message = "帖子内容不能为空")
    private String content;

    /**
     * 帖子概括
     */
    private String outline;

    /**
     * 地址
     */
    @TableField("photoUrl")
    private String photoUrl;

    /**
     * 作者id
     */
    private String authorId;

    /**
     * 作者名字
     */
    private String authorName;

    /**
     * 作者头像
     */
    private String authorAvatar;

    /**
     * 浏览量
     */
    private Integer views;

    /**
     * 创建时间
     */
    private LocalDateTime gmtCreate;

    /**
     * 修改时间
     */
    private LocalDateTime gmtUpdate;

    /**
     * 状态0未审核，1审核通过，-1审核不通过
     */
    private Integer status;

    /**
     * 类型
     */
    // @NotEmpty(message = "帖子类型不能为空")
    private GfPostClassify classify = new GfPostClassify();

    /**
     * 标签
     */
    // @NotEmpty(message = "帖子标签不能为空")
    private List<GfPostTag> tags = new ArrayList<GfPostTag>();

    @Override
    public AddPost buildEntity() {
        AddPost addPost = new AddPost();
        BeanUtils.copyProperties(this, addPost);
        return addPost;
    }
}
