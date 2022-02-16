package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfGameRank;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 游戏评价分数表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@Repository
public interface GfGameRankMapper extends BaseMapper<GfGameRank> {

    /**
     * 总分
     * @param gid
     * @return
     */
    int checkTheTotalScore(Integer gid);
}
