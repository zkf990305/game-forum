package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostLike;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 帖子点赞表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
public interface IGfPostLikeService extends IService<GfPostLike> {

    /**
     * 点赞
     * @param like
     * @return
     */
    boolean addLike(GfPostLike like);

    /**
     * 查看是否点赞了
     * @param like
     * @return
     */
    GfPostLike selectByLike(GfPostLike like);

    /**
     * 取消点赞
     * @param like
     * @return
     */
    boolean deleteLike(GfPostLike like);
}
