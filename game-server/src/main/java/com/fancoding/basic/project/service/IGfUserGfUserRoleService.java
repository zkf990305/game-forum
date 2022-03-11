package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfUserGfUserRole;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.form.gf_user_gf_user_role.GfUserGfUserRoleForm;

/**
 * <p>
 * 用户角色关联表
用户表
    《中间表》
角色表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
public interface IGfUserGfUserRoleService extends IService<GfUserGfUserRole> {

    /**
     * 更新用户权限
     * @param gfUserGfUserRoleForm
     * @return
     */
    boolean updateRole(GfUserGfUserRoleForm gfUserGfUserRoleForm);
}
