package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.entity.GfUserInfo;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
public interface IGfUserService extends IService<GfUser> {


    /**
     * 更新用户头像
     * @param id
     * @param s
     * @return
     */
    int updatePic(String id, String s);

    /**
     * 获取评论用户的昵称和头像
     * @param id
     * @return
     */
    GfUser getGfUserInfoByUserId(String id);

    /**
     * 按用户名查找信息
     * @param username
     * @return
     */
    GfUser selectByUserName(String username);
}
