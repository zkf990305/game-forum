package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_user.ResetPwdForm;
import com.fancoding.basic.project.mapper.GfUserMapper;
import com.fancoding.basic.project.service.IGfUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.GfUserVo;
import com.fancoding.basic.project.utils.vo.InfoVo;
import com.fancoding.basic.project.utils.vo.ResultVo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<GfUserVo> getAllUser() {
        return gfUserMapper.getAllUser();
    }

    @Override
    public boolean deleteUser(String id) {
        return gfUserMapper.deleteById(id) == 1;
    }

    /**
     * 个人信息
     * @param id
     * @return
     */
    @Override
    public InfoVo getGfUserByUserId(String id) {
        return gfUserMapper.getGfUserByUserId(id);
    }

    /**
     * 修改密码
     * @param id
     * @param newPassword
     * @return
     */
    @Override
    public ResultVo updateUserPwd(String id, String newPassword) {
        int update = gfUserMapper.update(
                null, new UpdateWrapper<GfUser>()
                        .eq("id", id)
                        .set("password", newPassword));
        if (update == 1) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }
    }


}
