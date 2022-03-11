package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfUserGfUserRole;
import com.fancoding.basic.project.form.gf_user_gf_user_role.GfUserGfUserRoleForm;
import com.fancoding.basic.project.mapper.GfUserGfUserRoleMapper;
import com.fancoding.basic.project.service.IGfUserGfUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户角色关联表
用户表
    《中间表》
角色表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@Service
@AllArgsConstructor
public class GfUserGfUserRoleServiceImpl extends ServiceImpl<GfUserGfUserRoleMapper, GfUserGfUserRole> implements IGfUserGfUserRoleService {

    private GfUserGfUserRoleMapper gfUserGfUserRoleMapper;

    @Override
    public boolean updateRole(GfUserGfUserRoleForm gfUserGfUserRoleForm) {
        GfUserGfUserRole gfUserGfUserRole = gfUserGfUserRoleMapper.selectOne(
                new QueryWrapper<GfUserGfUserRole>()
                        .eq("uid", gfUserGfUserRoleForm.buildEntity().getUid()));
        gfUserGfUserRoleForm.setId(gfUserGfUserRole.getId());
        return updateById(gfUserGfUserRoleForm.buildEntity());
    }
}
