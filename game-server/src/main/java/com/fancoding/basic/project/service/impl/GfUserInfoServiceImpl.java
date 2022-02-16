package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.mapper.GfUserInfoMapper;
import com.fancoding.basic.project.service.IGfUserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户信息 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-20
 */
@Service
@AllArgsConstructor
public class GfUserInfoServiceImpl extends ServiceImpl<GfUserInfoMapper, GfUserInfo> implements IGfUserInfoService {

    private GfUserInfoMapper gfUserInfoMapper;

    /**
     * 按邮箱找信息
     * @param email
     * @return
     */
    @Override
    public GfUserInfo selectByEmail(String email) {
        return gfUserInfoMapper.selectOne(
                new QueryWrapper<GfUserInfo>()
                        .eq("email", email));
    }
}
