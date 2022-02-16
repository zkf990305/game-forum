package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfPostGfPostClassify;
import com.fancoding.basic.project.mapper.GfPostGfPostClassifyMapper;
import com.fancoding.basic.project.service.IGfPostGfPostClassifyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 帖子表 
《中间表》
分类表
 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@Service
@AllArgsConstructor
public class GfPostGfPostClassifyServiceImpl extends ServiceImpl<GfPostGfPostClassifyMapper, GfPostGfPostClassify> implements IGfPostGfPostClassifyService {
    private GfPostGfPostClassifyMapper gfPostGfPostClassifyMapper;

    @Override
    public void addClassify(GfPostGfPostClassify gfPostGfPostClassify) {
        gfPostGfPostClassifyMapper.insert(gfPostGfPostClassify);
    }
}
