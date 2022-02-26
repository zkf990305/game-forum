package com.fancoding.basic.project.form.gf_game;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fancoding.basic.project.entity.*;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: caidaxing
 * @Date: 2022/02/02/15:23
 * @Description:
 */
@Data
@ApiModel("添加游戏需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class AddGameForm extends BaseForm<AddGame> {

    /**
     * 游戏名称
     */
    @NotEmpty(message = "游戏名称不能为空")
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
    @NotNull(message = "状态不能为空")
    private Integer status;


    /**
     * 标签
     */
    @NotEmpty(message = "帖子标签不能为空")
    private List<GfGameType> type = new ArrayList<GfGameType>();

    @Override
    public AddGame buildEntity() {
        AddGame addGame = new AddGame();
        BeanUtils.copyProperties(this, addGame);
        return addGame;
    }
}
