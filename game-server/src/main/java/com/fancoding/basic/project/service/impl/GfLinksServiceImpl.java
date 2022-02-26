package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.mapper.GfLinksMapper;
import com.fancoding.basic.project.service.IGfLinksService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 友情链接表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-24
 */
@Service
@AllArgsConstructor
public class GfLinksServiceImpl extends ServiceImpl<GfLinksMapper, GfLinks> implements IGfLinksService {

    private GfLinksMapper gfLinksMapper;
    /**
     * 删除友链
     * @param id
     * @return
     */
    @Override
    public boolean deleteLinks(Integer id) {
        return gfLinksMapper.deleteById(id) == 1;
    }
}
