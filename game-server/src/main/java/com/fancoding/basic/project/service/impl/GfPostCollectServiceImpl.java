package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfPostCollect;
import com.fancoding.basic.project.mapper.GfPostCollectMapper;
import com.fancoding.basic.project.service.IGfPostCollectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 帖子收藏表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@Service
@AllArgsConstructor
public class GfPostCollectServiceImpl extends ServiceImpl<GfPostCollectMapper, GfPostCollect> implements IGfPostCollectService {

    private GfPostCollectMapper gfPostCollectMapper;

    /**
     * 添加收藏
     * @param collect
     * @return
     */
    @Override
    public boolean addCollect(GfPostCollect collect) {
        return gfPostCollectMapper.insert(collect) == 1;
    }

    /**
     * 删除收藏的游戏或帖子
     * @param id
     * @return
     */
    @Override
    public boolean deleteComment(Integer id) {
        return gfPostCollectMapper.deleteById(id) == 1;
    }

    /**
     * 返回的指定用户ID收藏列表
     * @param id
     * @return
     */
    @Override
    public List<GfPostCollect> collectOfUserId(String id) {
        return gfPostCollectMapper.selectList(new QueryWrapper<GfPostCollect>().eq("uid", id));
    }

    /**
     * 查看是否收藏了
     * @param collect
     * @return
     */
    @Override
    public GfPostCollect selectByCollect(GfPostCollect collect) {
        return gfPostCollectMapper.selectOne(
                new QueryWrapper<GfPostCollect>()
                        .eq("uid", collect.getUid())
                        .eq("type", collect.getType())
                        .eq("collect_id", collect.getCollectId()));
    }

    /**
     * 取消收藏
     * @param collect
     * @return
     */
    @Override
    public boolean deleteCollect(GfPostCollect collect) {
        return gfPostCollectMapper.delete(
                new QueryWrapper<GfPostCollect>()
                        .eq("uid", collect.getUid())
                        .eq("type", collect.getType())
                        .eq("collect_id", collect.getCollectId())) == 1;
    }
}
