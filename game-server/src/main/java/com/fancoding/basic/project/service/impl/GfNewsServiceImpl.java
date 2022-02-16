package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.mapper.GfNewsMapper;
import com.fancoding.basic.project.service.IGfNewsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 通告板 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-09
 */
@Service
@AllArgsConstructor
public class GfNewsServiceImpl extends ServiceImpl<GfNewsMapper, GfNews> implements IGfNewsService {

    private GfNewsMapper gfNewsMapper;

    @Override
    public List<GfNews> getAllNewsList() {
        return gfNewsMapper.selectList(new QueryWrapper<>());
    }

    @Override
    public List<GfNews> getNewsOfTheFirstEight() {
        return gfNewsMapper.getNewsOfTheFirstEight();
    }
}
