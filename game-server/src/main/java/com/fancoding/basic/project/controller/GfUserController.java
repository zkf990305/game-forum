package com.fancoding.basic.project.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.service.IGfUserService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

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

}
