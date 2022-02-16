package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfPostCollect;
import com.fancoding.basic.project.entity.GfPostLike;
import com.fancoding.basic.project.mapper.GfPostLikeMapper;
import com.fancoding.basic.project.service.IGfPostLikeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 帖子点赞表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@Service
@AllArgsConstructor
public class GfPostLikeServiceImpl extends ServiceImpl<GfPostLikeMapper, GfPostLike> implements IGfPostLikeService {

    private GfPostLikeMapper gfPostLikeMapper;
    /**
     * 点赞成功
     * @param like
     * @return
     */
    @Override
    public boolean addLike(GfPostLike like) {
        return gfPostLikeMapper.insert(like) == 1;
    }

    /**
     * 查看是否点赞了
     * @param like
     * @return
     */
    @Override
    public GfPostLike selectByLike(GfPostLike like) {
        return gfPostLikeMapper.selectOne(
                new QueryWrapper<GfPostLike>()
                        .eq("uid", like.getUid())
                        .eq("type", like.getType())
                        .eq("like_id", like.getLikeId()));
    }

    /**
     * 取消点赞
     * @param like
     * @return
     */
    @Override
    public boolean deleteLike(GfPostLike like) {
        return gfPostLikeMapper.delete(
                new QueryWrapper<GfPostLike>()
                        .eq("uid", like.getUid())
                        .eq("type", like.getType())
                        .eq("like_id", like.getLikeId())) == 1;
    }
}
