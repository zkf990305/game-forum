package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfGame;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.utils.vo.GfGameVo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 游戏表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
@Repository
public interface GfGameMapper extends BaseMapper<GfGame> {
    /**
     * 通过类别找游戏
     * @param type
     * @return
     */
    List<GfGame> findByGameType(String type);

    /**
     * 获取前8条游戏
     * @return
     */
    List<GfGameVo> getNewsOfTheFirstEight();

    /**
     * 收藏了的游戏
     * @param id
     * @return
     */
    List<GfGame> getGameListOfCollect(String id);

    /**
     * 获取全部游戏列表
     * @return
     */
    List<GfGameVo> getGameList();
}
