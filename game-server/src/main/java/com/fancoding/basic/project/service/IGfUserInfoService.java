package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfUserInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户信息 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-20
 */
public interface IGfUserInfoService extends IService<GfUserInfo> {

    /**
     * 按邮箱找信息
     * @param email
     * @return
     */
    GfUserInfo selectByEmail(String email);
}
