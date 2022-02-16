package com.fancoding.basic.project.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 帖子收藏表
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("gf_post_collect")
public class GfPostCollect implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private String uid;

    /**
     * 收藏类型（0帖子 1游戏）
     */
    private Integer type;

    /**
     * 收藏的帖子id/游戏id

     */
    private Integer collectId;

    /**
     * 收藏时间
     */
    private LocalDateTime gmtCreate;


}
