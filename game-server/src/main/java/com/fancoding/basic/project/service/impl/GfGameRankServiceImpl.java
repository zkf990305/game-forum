package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfGameRank;
import com.fancoding.basic.project.mapper.GfGameRankMapper;
import com.fancoding.basic.project.service.IGfGameRankService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 游戏评价分数表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@Service
@AllArgsConstructor
public class GfGameRankServiceImpl extends ServiceImpl<GfGameRankMapper, GfGameRank> implements IGfGameRankService {

    private GfGameRankMapper gfGameRankMapper;

    /**
     * 评分
     * @param gfGameRank
     * @return
     */
    @Override
    public boolean addRank(GfGameRank gfGameRank) {
        return gfGameRankMapper.insert(gfGameRank) == 1;
    }

    /**
     * 总分
     * @param gid
     * @return
     */
    @Override
    public int checkTheTotalScore(Integer gid) {
        return gfGameRankMapper.checkTheTotalScore(gid);
    }

    /**
     * 参与评分人数 -- 游戏划分
     * @param gid
     * @return
     */
    @Override
    public int theNumberOfParticipants(Integer gid) {
        return gfGameRankMapper.selectCount(
                new QueryWrapper<GfGameRank>()
                        .eq("gid", gid)
                        .select("COALESCE(count(uid),0) as total"));
    }
}
