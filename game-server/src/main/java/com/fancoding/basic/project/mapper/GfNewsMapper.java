package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfNews;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 通告板 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-02-09
 */
@Repository
public interface GfNewsMapper extends BaseMapper<GfNews> {

    /**
     * 获取前8条公告
     * @return
     */
    List<GfNews> getNewsOfTheFirstEight();
}
