package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfGame;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.utils.vo.GfGameVo;

import java.util.List;

/**
 * <p>
 * 游戏表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
public interface IGfGameService extends IService<GfGame> {

    /**
     * 通过类别找游戏
     * @param type
     * @return
     */
    public List<GfGame> findByGameType(String type);

    /**
     * 获取前8条游戏
     * @return
     */
    List<GfGameVo> getNewsOfTheFirstEight();

    /**
     * 按游戏名模糊查询游戏列表
     * @param title
     * @return
     */
    List<GfGame> getGameListOfLikeTitle(String title);

    /**
     * 收藏了的游戏
     * @param id
     * @return
     */
    List<GfGame> getGameListOfCollect(String id);

    /**
     * 删除游戏
     * @param id
     * @return
     */
    boolean deleteGame(Integer id);

    /**
     * 插入游戏
     * @param gfGame
     * @return
     */
    int addGame(GfGame gfGame);

    /**
     * 查看所有游戏
     * @return
     */
    List<GfGameVo> getGameList();
}
