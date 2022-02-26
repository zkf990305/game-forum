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
 * 游戏表
 * </p>
 *
 * @author fancoding
 * @since 2022-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("gf_game")
public class AddGame implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 游戏名称
     */
    private String name;

    /**
     * 头像地址
     */
    private String image;

    /**
     * 游戏官网
     */
    private String officialWebsite;

    /**
     * 内容详情
     */
    private String content;

    /**
     * 状态0为可用 1位不可用
     */
    private Integer status;


    /**
     * 标签
     */
    private List<GfGameType> type;


}
