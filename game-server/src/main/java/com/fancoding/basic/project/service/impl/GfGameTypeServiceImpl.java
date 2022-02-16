package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.mapper.GfGameTypeMapper;
import com.fancoding.basic.project.service.IGfGameTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 游戏类型表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
@Service
@AllArgsConstructor
public class GfGameTypeServiceImpl extends ServiceImpl<GfGameTypeMapper, GfGameType> implements IGfGameTypeService {

}
