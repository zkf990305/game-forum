package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfMessage;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.exception.CustomException;
import com.fancoding.basic.project.form.gf_message.AddMessageForm;
import com.fancoding.basic.project.mapper.GfMessageMapper;
import com.fancoding.basic.project.service.IGfMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fancoding.basic.project.utils.MethodUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 留言表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-03-02
 */
@Service
@AllArgsConstructor
public class GfMessageServiceImpl extends ServiceImpl<GfMessageMapper, GfMessage> implements IGfMessageService {

    private GfMessageMapper gfMessageMapper;
    /**
     * 添加留言
     * @param messageForm
     * @return
     */
    @Override
    public boolean addMessage(AddMessageForm messageForm) {
        return save(messageForm.buildEntity());
    }

    /**
     * 获取留言列表
     * @return
     */
    @Override
    public List<GfMessage> listGfMessage() {
        return gfMessageMapper.listGfMessage();
    }

    /**
     * 删除留言
     * @param id
     */
    @Override
    public void deleteMessage(Integer id) {
        // 如果删除失败抛出异常。 -- 演示而已不推荐这样干
        if(!removeById(id)){
            throw new CustomException(ResultEnum.DELETE_ERROR, MethodUtil.getLineInfo());
        }
    }
}
