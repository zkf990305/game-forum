package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfMessage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.form.gf_message.AddMessageForm;

import java.util.List;

/**
 * <p>
 * 留言表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-03-02
 */
public interface IGfMessageService extends IService<GfMessage> {

    /**
     * 添加留言
     * @param messageForm
     * @return
     */
    boolean addMessage(AddMessageForm messageForm);

    /**
     * 获取留言列表
     * @return
     */
    List<GfMessage> listGfMessage();

    /**
     * 删除留言
     * @param id
     */
    void deleteMessage(Integer id);
}
