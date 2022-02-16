package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostGfPostTag;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 帖子表 
《中间表》
标签表
 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
public interface IGfPostGfPostTagService extends IService<GfPostGfPostTag> {

    /**
     * 添加标签
     * @param gfPostGfPostTag
     */
    void addTags(GfPostGfPostTag gfPostGfPostTag);
}
