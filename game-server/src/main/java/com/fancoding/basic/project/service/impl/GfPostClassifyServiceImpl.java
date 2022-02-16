package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.mapper.GfPostClassifyMapper;
import com.fancoding.basic.project.service.IGfPostClassifyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 帖子分类管理 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-07
 */
@Service
@AllArgsConstructor
public class GfPostClassifyServiceImpl extends ServiceImpl<GfPostClassifyMapper, GfPostClassify> implements IGfPostClassifyService {

    private GfPostClassifyMapper gfPostClassifyMapper;

    /**
     * 获取帖子分类列表
     * @return
     */
    @Override
    public List<GfPostClassify> getAllPostClassify() {
        return gfPostClassifyMapper.getAllPostClassify();
    }

    /**
     * 通过帖子id查找帖子分类
     * @param id
     * @return
     */
    @Override
    public List<GfPostClassify> getPostClassifyOfPostId(Integer id) {
        return gfPostClassifyMapper.getPostClassifyOfPostId(id);
    }
}
