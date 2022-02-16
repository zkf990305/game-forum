package com.fancoding.basic.project.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 帖子点赞表
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("gf_post_like")
public class GfPostLike implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户编号
     */
    private String uid;

    /**
     * 点赞类型（0帖子 1游戏 2评论）
     */
    private Integer type;

    /**
     * 点赞id 帖子id/游戏id/ 评论id
     */
    private Integer likeId;

    /**
     * 点赞时间
     */
    private LocalDateTime gmtCreate;


}
