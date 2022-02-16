package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfUserRole;
import com.fancoding.basic.project.mapper.GfUserRoleMapper;
import com.fancoding.basic.project.service.IGfUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@Service
@AllArgsConstructor
public class GfUserRoleServiceImpl extends ServiceImpl<GfUserRoleMapper, GfUserRole> implements IGfUserRoleService {

}
