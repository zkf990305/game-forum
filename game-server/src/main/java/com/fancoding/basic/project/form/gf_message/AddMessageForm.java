package com.fancoding.basic.project.form.gf_message;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fancoding.basic.project.entity.AddGame;
import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.entity.GfMessage;
import com.fancoding.basic.project.form.BaseForm;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: caidaxing
 * @Date: 2022/02/02/15:23
 * @Description:
 */
@Data
@ApiModel("添加留言需要的表单数据")
@EqualsAndHashCode(callSuper = false)
public class AddMessageForm extends BaseForm<GfMessage> {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 内容
     */
    @NotEmpty(message = "状态不能为空")
    private String content;


    @Override
    public GfMessage buildEntity() {
        GfMessage message = new GfMessage();
        BeanUtils.copyProperties(this, message);
        return message;
    }
}
