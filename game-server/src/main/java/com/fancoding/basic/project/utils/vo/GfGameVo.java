package com.fancoding.basic.project.utils.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDate;

/**
 * @Author: caidaxing
 * @Date: 2022/02/18/2:21
 * @Description:
 */
@Data
@ApiModel("游戏信息视图模型")
public class GfGameVo {

    /**
     * 自增id
     */
    @ApiModelProperty("id")
    private Integer id;

    /**
     * 游戏名称
     */
    @ApiModelProperty("游戏名称")
    private String name;

    /**
     * 头像地址
     */
    @ApiModelProperty("头像地址")
    private String image;

    /**
     * 游戏官网
     */
    @ApiModelProperty("游戏官网")
    private String officialWebsite;

    /**
     * 内容详情
     */
    @ApiModelProperty("内容详情")
    private String content;

    /**
     * 状态0为可用 1位不可用
     */
    @ApiModelProperty("状态0为可用 1位不可用")
    private Integer status;

    /**
     * 游戏评分
     */
    @ApiModelProperty("游戏评分")
    private Integer score;





}
