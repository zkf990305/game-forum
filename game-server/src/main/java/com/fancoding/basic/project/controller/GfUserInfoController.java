package com.fancoding.basic.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.GfUserGfUserRole;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_user.LoginGfUserForm;
import com.fancoding.basic.project.form.gf_user_info.GfUserInfoForm;
import com.fancoding.basic.project.service.IGfUserInfoService;
import com.fancoding.basic.project.service.IGfUserService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户信息 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-01-20
 */
@RestController
@Api(tags = "个人信息")
@AllArgsConstructor
@RequestMapping("/gf-user-info")
public class GfUserInfoController {

    private IGfUserInfoService gfUserInfoService;
    private IGfUserService gfUserService;

    /**
     * 我的个人信息
     * @param id
     * @return
     */
    @ApiOperation("我的个人信息")
    @GetMapping("/detail/{id}")
    public ResultVo getGfUserInfoByUserId(@PathVariable String id) {
        GfUserInfo gfUserInfo = gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("uid", id));
        // 用户为 null 则查找失败
        if (gfUserInfo == null) {
            return ResultVoUtil.error(ResultEnum.GET_ERROR);
        }
        return ResultVoUtil.success(gfUserInfo);
    }

    /**
     * 更新用户信息
     * @param gfUserInfoForm
     * @return
     */
    @ApiOperation("更新用户信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody GfUserInfoForm gfUserInfoForm) {
        System.out.println(gfUserInfoForm.getId());

        // 通过前台传过来的id判断是否有这条数据
        GfUserInfo gfUserInfoById = gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("id", gfUserInfoForm.getId()));
        // 用户为 null 则查找失败
        if (gfUserInfoById == null) {
            return ResultVoUtil.error("该用户不存在");
        }
        // 判断昵称、邮箱唯一性
        GfUserInfo gfUserInfo = gfUserInfoForm.buildEntity();
        // 昵称是否修改了
        boolean hasUpdatedByName = false;
        // 如果昵称修改了
        if (!gfUserInfo.getNickname().equals(gfUserInfoById.getNickname())) {
            hasUpdatedByName = !hasUpdatedByName;
            GfUserInfo nickname = gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("nickname", gfUserInfo.getNickname()));
            if (nickname != null) {
                return ResultVoUtil.error("用户昵称已存在");
            }
        }
        // 如果邮箱修改了
        if (!gfUserInfo.getEmail().equals(gfUserInfoById.getEmail())) {
            GfUserInfo email = gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("email", gfUserInfo.getEmail()));
            if (email != null) {
                return ResultVoUtil.error("邮箱已被绑定");
            }
        }
        if (gfUserInfoService.updateById(gfUserInfo)) {
            if (hasUpdatedByName) {
                //只更新一个属性，把用户表id为信息表uid的用户名称更新为修改的昵称，其他属性不变
                UpdateWrapper<GfUser> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("id",gfUserInfo.getUid()).set("username", gfUserInfo.getNickname());
                gfUserService.update(null, updateWrapper);
            }
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }


    }

    /**
     * 更新用户信息 -- 后台
     * @param gfUserInfoForm
     * @return
     */
    @ApiOperation("更新用户信息 -- 后台")
    @PutMapping("/updateInfo")
    public ResultVo updateInfo(@Validated @RequestBody GfUserInfoForm gfUserInfoForm) {

        // 通过前台传过来的uid判断是否有这条数据
        GfUserInfo gfUserInfoByUId =
                gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("uid", gfUserInfoForm.getUid()));

        // 用户为 null 则查找失败
        if (gfUserInfoByUId == null) {
            return ResultVoUtil.error("该用户不存在");
        }
        // 判断昵称、邮箱唯一性
        GfUserInfo gfUserInfo = gfUserInfoForm.buildEntity();
        // 昵称是否修改了
        boolean hasUpdatedByName = false;
        // 如果昵称修改了
        if (!gfUserInfo.getNickname().equals(gfUserInfoByUId.getNickname())) {
            hasUpdatedByName = !hasUpdatedByName;
            GfUserInfo nickname = gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("nickname", gfUserInfo.getNickname()));
            if (nickname != null) {
                return ResultVoUtil.error("用户昵称已存在");
            }
        }
        // 如果邮箱修改了
        if (!gfUserInfo.getEmail().equals(gfUserInfoByUId.getEmail())) {
            GfUserInfo email = gfUserInfoService.getOne(new QueryWrapper<GfUserInfo>().eq("email", gfUserInfo.getEmail()));
            if (email != null) {
                return ResultVoUtil.error("邮箱已被绑定");
            }
        }
        gfUserInfo.setId(gfUserInfoByUId.getId());
        gfUserInfo.setHobby(gfUserInfoByUId.getHobby());
        gfUserInfo.setWork(gfUserInfoByUId.getWork());
        if (gfUserInfoService.updateById(gfUserInfo)) {
            if (hasUpdatedByName) {
                //只更新一个属性，把用户表id为信息表uid的用户名称更新为修改的昵称，其他属性不变
                UpdateWrapper<GfUser> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("id",gfUserInfo.getUid()).set("username", gfUserInfo.getNickname());
                gfUserService.update(null, updateWrapper);
            }
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }


    }

}
