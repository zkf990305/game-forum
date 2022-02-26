package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfGame;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.mapper.GfGameMapper;
import com.fancoding.basic.project.service.IGfGameService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 游戏表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
@Service
@AllArgsConstructor
public class GfGameServiceImpl extends ServiceImpl<GfGameMapper, GfGame> implements IGfGameService {

    private GfGameMapper gfGameMapper;
    @Override
    public List<GfGame> findByGameType(String type) {
        return gfGameMapper.findByGameType(type);
    }

    @Override
    public List<GfGame> getNewsOfTheFirstEight() {
        return gfGameMapper.getNewsOfTheFirstEight();
    }

    /**
     * 按游戏名模糊查询游戏列表
     * @param title
     * @return
     */
    @Override
    public List<GfGame> getGameListOfLikeTitle(String title) {
        return gfGameMapper.selectList(new QueryWrapper<GfGame>().like("name", title));
    }

    /**
     * 收藏了的游戏
     * @param id
     * @return
     */
    @Override
    public List<GfGame> getGameListOfCollect(String id) {
        return gfGameMapper.getGameListOfCollect(id);
    }

    /**
     * 删除游戏
     * @param id
     * @return
     */
    @Override
    public boolean deleteGame(Integer id) {
        return gfGameMapper.deleteById(id) == 1;
    }

    /**
     * 添加游戏
     * @param gfGame
     */
    @Override
    public int addGame(GfGame gfGame) {
        return gfGameMapper.insert(gfGame);
    }
}
