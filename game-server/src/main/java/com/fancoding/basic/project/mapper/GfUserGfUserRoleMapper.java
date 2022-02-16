package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfUserGfUserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 用户角色关联表
用户表
    《中间表》
角色表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@Repository
public interface GfUserGfUserRoleMapper extends BaseMapper<GfUserGfUserRole> {

}
