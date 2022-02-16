package com.fancoding.basic.project.utils.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author fancoding
 * Date: Created in 2020/3/6 4:13 下午
 * Utils: Intellij Idea
 * Description: 用户视图模型
 */
@Data
@ApiModel("用户视图模型")
public class UserVo {

    /**
     * 用户编号
     */
    @ApiModelProperty("用户编号")
    private Integer id;

    /**
     * 昵称
     */
    @ApiModelProperty("昵称")
    private String nickname;

    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    private String username;

    /**
     * 生日
     */
    @ApiModelProperty("生日")
    private LocalDateTime birthday;

}
