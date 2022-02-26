package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.form.gf_user.ResetPwdForm;
import com.fancoding.basic.project.utils.vo.GfUserVo;
import com.fancoding.basic.project.utils.vo.InfoVo;
import com.fancoding.basic.project.utils.vo.ResultVo;

import java.util.List;

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

    /**
     * 返回所有用户
     * @return
     */
    List<GfUserVo> getAllUser();

    /**
     * 删除用户
     * @param id
     * @return
     */
    boolean deleteUser(String id);

    /**
     * 个人信息
     * @param id
     * @return
     */
    InfoVo getGfUserByUserId(String id);

    /**
     * 修改密码
     * @param id
     * @param newPassword
     * @return
     */
    ResultVo updateUserPwd(String id, String newPassword);
}
