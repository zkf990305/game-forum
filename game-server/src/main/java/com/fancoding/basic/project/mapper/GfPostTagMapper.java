package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 帖子标签 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@Repository
public interface GfPostTagMapper extends BaseMapper<GfPostTag> {

    /**
     * 通过帖子id查找帖子标签
     * @param id
     * @return
     */
    List<GfPostTag> getPostTagOfPostId(Integer id);
}
