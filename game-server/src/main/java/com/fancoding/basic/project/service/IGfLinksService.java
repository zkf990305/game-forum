package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfLinks;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 友情链接表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-24
 */
public interface IGfLinksService extends IService<GfLinks> {

    /**
     * 删除友链
     * @param id
     * @return
     */
    boolean deleteLinks(Integer id);
}
