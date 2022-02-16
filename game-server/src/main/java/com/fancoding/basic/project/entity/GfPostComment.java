package com.fancoding.basic.project.entity;

import com.baomidou.mybatisplus.annotation.TableField;
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
 * 帖子/游戏评论表
 * </p>
 *
 * @author fancoding
 * @since 2022-02-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("gf_post_comment")
public class GfPostComment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private String uid;

    /**
     * 评论类型（0帖子 1 游戏）
     */
    private Integer type;

    /**
     * 帖子id / 游戏id
     */
    private Integer commentId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评论时间
     */
    private LocalDateTime gmtCreate;

    /**
     * 评论点赞数
     */

    @TableField(value="`like`")
    private Integer like;

    /**
     *   状态
     * 0.待审核
     * 1.可查看
     */
    @TableField(value="`status`")
    private Integer status;


}
