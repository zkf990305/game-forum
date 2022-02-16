package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfGameRank;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 游戏评价分数表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
public interface IGfGameRankService extends IService<GfGameRank> {

    /**
     * 评分
     * @param gfGameRank
     * @return
     */
    boolean addRank(GfGameRank gfGameRank);

    /**
     * 总分
     * @param gid
     * @return
     */
    int checkTheTotalScore(Integer gid);

    /**
     * 参与评分人数 -- 游戏划分
     * @param gid
     * @return
     */
    int theNumberOfParticipants(Integer gid);
}
