package com.fancoding.basic.project.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_user.ResetPwdForm;
import com.fancoding.basic.project.service.IGfUserService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.GfUserVo;
import com.fancoding.basic.project.utils.vo.InfoVo;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@RestController
@Api(tags = "用户信息")
@AllArgsConstructor
@RequestMapping("/gf-user")
public class GfUserController {

    private IGfUserService gfUserService;

    /**
     * 我的个人信息
     * @param id
     * @return
     */
    @ApiOperation("我的个人信息")
    @GetMapping("/details/{id}")
    public ResultVo getGfUserByUserId(@PathVariable String id) {
        InfoVo gfUserVo = gfUserService.getGfUserByUserId(id);
        // 用户为 null 则查找失败
        if (gfUserVo == null) {
            return ResultVoUtil.error(ResultEnum.GET_ERROR);
        }
        return ResultVoUtil.success(gfUserVo);
    }

    /**
     * 修改密码
     * @param resetPwdForm
     * @return
     */
    @ApiOperation("修改密码")
    @PostMapping("/updatePwd")
    public ResultVo updateUserPwd(@Validated @RequestBody ResetPwdForm resetPwdForm) {
        System.out.println(resetPwdForm.toString());
        // 表单密码重复判断
        if (!resetPwdForm.getNewPassword().equals(resetPwdForm.getConfirmPassword())){
            return ResultVoUtil.error("两次密码不一致");
        }
        GfUser byId = gfUserService.getById(resetPwdForm.getId());
        if (byId == null) {
            return ResultVoUtil.error("该用户不存在！");
        }
        // 判断密码是否正确
        if (!(new BCryptPasswordEncoder().matches(resetPwdForm.getOldPassword(), byId.getPassword())
                || resetPwdForm.getOldPassword().equals(byId.getPassword()))) {
            return ResultVoUtil.error("旧密码错误");
        }
        // 密码加密
        String bCryptPassword = new BCryptPasswordEncoder().encode(resetPwdForm.getNewPassword());
        resetPwdForm.setNewPassword(bCryptPassword);
        return gfUserService.updateUserPwd(resetPwdForm.getId(), resetPwdForm.getNewPassword());

    }

    /**
     * 返回所有用户
     * @return
     */
    @ApiOperation("返回所有用户")
    @GetMapping("/user")
    public ResultVo getAllUser() {
        List<GfUserVo> users = gfUserService.getAllUser();
        return ResultVoUtil.success(users);
    }

    /**
     * 获取评论用户的昵称和头像
     * @param id
     * @return
     */
    @ApiOperation("获取评论用户的昵称和头像")
    @GetMapping("/detail/{id}")
    public ResultVo getGfUserInfoByUserId(@PathVariable String id) {
        GfUser gfUser = gfUserService.getGfUserInfoByUserId(id);
        // 用户为 null 则查找失败
        if (gfUser == null) {
            return ResultVoUtil.error(ResultEnum.GET_ERROR);
        }
        return ResultVoUtil.success(gfUser);
    }

    /**
     * 更新用户头像
     * @param avatarFile
     * @param id
     * @return
     */
    @ApiOperation("更新用户头像")
    @RequestMapping(value = "/upload/avatar/update", method = RequestMethod.POST)
    public ResultVo updateUserPic(@RequestParam("file") MultipartFile avatarFile, @RequestParam("id")String id) {
        if (avatarFile.isEmpty()) {
            return ResultVoUtil.error(ResultEnum.UPLOAD_ERROR);
        }
        // 获取源文件的名称
        String originalFilename = avatarFile.getOriginalFilename();

        // 定义文件的唯一标识（前缀）
        String flag = IdUtil.fastSimpleUUID();
        // 获取上传的路径
        String rootFilePath = System.getProperty("user.dir") + "/files/" + flag +
                "_" + originalFilename;
        try {
            // 把文件写入到上传的路径
            FileUtil.writeBytes(avatarFile.getBytes(), rootFilePath);
            int res = gfUserService.updatePic(id, "/files/" + flag);
            if (res == 1) {
                return ResultVoUtil.success("/files/" + flag);
            }else {
                return ResultVoUtil.error(ResultEnum.UPLOAD_ERROR);
            }
        } catch (IOException e) {
            return ResultVoUtil.error(ResultEnum.UPLOAD_ERROR);
        }
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @ApiOperation("删除用户")
    @DeleteMapping("/delete/{id}")
    public ResultVo deleteUser(@PathVariable String id) {
        boolean result = gfUserService.deleteUser(id);
        if (result) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.DELETE_ERROR);
        }
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ApiOperation("批量删除")
    @PostMapping("/removeBatch")
    public ResultVo removeBatch(@Validated @RequestBody List<String> ids) {
        System.out.println(ids.toString());
        return ResultVoUtil.success(gfUserService.removeByIds(ids));
    }

}
