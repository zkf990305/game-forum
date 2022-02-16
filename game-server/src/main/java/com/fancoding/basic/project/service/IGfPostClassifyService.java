package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 帖子分类管理 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-07
 */
public interface IGfPostClassifyService extends IService<GfPostClassify> {

    /**
     * 获取帖子分类列表
     * @return
     */
    List<GfPostClassify> getAllPostClassify();

    /**
     * 通过帖子id查找帖子分类
     * @param id
     * @return
     */
    List<GfPostClassify> getPostClassifyOfPostId(Integer id);
}
