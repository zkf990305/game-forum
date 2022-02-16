package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.mapper.GfUserMapper;
import com.fancoding.basic.project.service.IGfUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@Service
@AllArgsConstructor
public class GfUserServiceImpl extends ServiceImpl<GfUserMapper, GfUser> implements IGfUserService {

    private GfUserMapper  gfUserMapper;
    @Override
    public int updatePic(String id, String s) {
        GfUser gfUser = new GfUser();
        gfUser.setId(id);
        gfUser.setAvatarUrl(s);
        return gfUserMapper.updateById(gfUser);
    }

    /**
     * 获取评论用户的昵称和头像
     * @param id
     * @return
     */
    @Override
    public GfUser getGfUserInfoByUserId(String id) {
        return gfUserMapper.selectById(id);
    }

    /**
     * 用户名查找信息
     * @param username
     * @return
     */
    @Override
    public GfUser selectByUserName(String username) {
        return gfUserMapper.selectOne(
                new QueryWrapper<GfUser>()
                        .eq("username", username)
        );
    }
}
