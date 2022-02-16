package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostGfPostClassify;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 帖子表 
《中间表》
分类表
 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
public interface IGfPostGfPostClassifyService extends IService<GfPostGfPostClassify> {

    /**
     * 添加分类
     * @param gfPostGfPostClassify
     */
    void addClassify(GfPostGfPostClassify gfPostGfPostClassify);
}
