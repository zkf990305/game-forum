package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.mapper.GfPostTagMapper;
import com.fancoding.basic.project.service.IGfPostTagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 帖子标签 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@Service
@AllArgsConstructor
public class GfPostTagServiceImpl extends ServiceImpl<GfPostTagMapper, GfPostTag> implements IGfPostTagService {

    private GfPostTagMapper  gfPostTagMapper;
    /**
     * 获取标签列表
     * @return
     */
    @Override
    public List<GfPostTag> getAllPostTag() {
        return gfPostTagMapper.selectList(new QueryWrapper<>());
    }

    /**
     * 通过帖子id查找帖子标签
     * @param id
     * @return
     */
    @Override
    public List<GfPostTag> getPostTagOfPostId(Integer id) {
        return gfPostTagMapper.getPostTagOfPostId(id);
    }
}
