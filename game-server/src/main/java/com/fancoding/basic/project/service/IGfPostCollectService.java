package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostCollect;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 帖子收藏表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
public interface IGfPostCollectService extends IService<GfPostCollect> {

    /**
     * 添加收藏
     * @param collect
     * @return
     */
    boolean addCollect(GfPostCollect collect);

    /**
     * 删除收藏的游戏或帖子
     * @param id
     * @return
     */
    boolean deleteComment(Integer id);

    /**
     * 返回的指定用户ID收藏列表
     * @param id
     * @return
     */
    List<GfPostCollect> collectOfUserId(String id);

    /**
     * 查看是否收藏了
     * @param collect
     * @return
     */
    GfPostCollect selectByCollect(GfPostCollect collect);

    /**
     * 取消收藏
     * @param collect
     * @return
     */
    boolean deleteCollect(GfPostCollect collect);
}
