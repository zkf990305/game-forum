package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 帖子分类管理 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-02-07
 */
@Repository
public interface GfPostClassifyMapper extends BaseMapper<GfPostClassify> {

    /**
     * 获取帖子分类列表
     * @return
     */
    List<GfPostClassify> getAllPostClassify();

    /**
     * 通过帖子id查找帖子分类
     * @param id
     * @return
     */
    List<GfPostClassify> getPostClassifyOfPostId(Integer id);
}
