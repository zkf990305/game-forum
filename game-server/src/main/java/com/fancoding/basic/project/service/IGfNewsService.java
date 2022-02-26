package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfNews;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 通告板 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-09
 */
public interface IGfNewsService extends IService<GfNews> {

    /**
     * 获取全部公告
     * @return
     */
    List<GfNews> getAllNewsList();

    /**
     * 获取前8条公告
     * @return
     */
    List<GfNews> getNewsOfTheFirstEight();


    /**
     * 删除公告
     * @param id
     * @return
     */
    boolean deleteNews(Integer id);
}
