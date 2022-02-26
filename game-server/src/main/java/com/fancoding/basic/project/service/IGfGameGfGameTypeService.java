package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfGameGfGameType;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 游戏表 
《中间表》
游戏类型表
 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
public interface IGfGameGfGameTypeService extends IService<GfGameGfGameType> {

    /**
     * 添加分类
     * @param gfGameGfGameType
     */
    void addType(GfGameGfGameType gfGameGfGameType);
}
