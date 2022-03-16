package com.fancoding.basic.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 帖子表
 * </p>
 *
 * @author fancoding
 * @since 2022-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("gf_post")
public class AddPost implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id 帖子id

     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 帖子标题
     */
    private String title;

    /**
     * 帖子内容
     */
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
    private List<GfPostClassify> classify;

    /**
     * 标签
     */
    private List<GfPostTag> tags;


}
