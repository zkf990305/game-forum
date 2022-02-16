package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfPostGfPostTag;
import com.fancoding.basic.project.mapper.GfPostGfPostTagMapper;
import com.fancoding.basic.project.service.IGfPostGfPostTagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 帖子表 
《中间表》
标签表
 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@Service
@AllArgsConstructor
public class GfPostGfPostTagServiceImpl extends ServiceImpl<GfPostGfPostTagMapper, GfPostGfPostTag> implements IGfPostGfPostTagService {

    private GfPostGfPostTagMapper gfPostGfPostTagMapper;

    @Override
    public void addTags(GfPostGfPostTag gfPostGfPostTag) {
        gfPostGfPostTagMapper.insert(gfPostGfPostTag);
    }
}
