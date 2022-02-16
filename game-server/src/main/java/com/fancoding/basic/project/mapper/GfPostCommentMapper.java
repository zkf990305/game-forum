package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfPostComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 帖子/游戏评论表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-02-11
 */
@Repository
public interface GfPostCommentMapper extends BaseMapper<GfPostComment> {

    /**
     * 更新指定游戏ID的评论列表点赞数目
     * @param id
     * @return
     */
    boolean updateCommentNumberOfLikes(Integer type, Integer id);
}
