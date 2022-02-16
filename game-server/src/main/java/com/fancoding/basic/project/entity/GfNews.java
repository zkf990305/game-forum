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
 * 通告板
 * </p>
 *
 * @author fancoding
 * @since 2022-02-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("gf_news")
public class GfNews implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 通知标题
     */
    private String title;

    /**
     * 通知内容
     */
    private String content;

    /**
     * 发布时间
     */
    private LocalDateTime createtime;

    /**
     * 最后一次修改时间
     */
    private LocalDateTime gmtUpdatetime;

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


}
