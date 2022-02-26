package com.fancoding.basic.project.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.service.IGfLinksService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 友情链接表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-01-24
 */
@RestController
@Api(tags = "友情链接")
@AllArgsConstructor
@RequestMapping("/gf-links")
public class GfLinksController {

    private IGfLinksService gfLinksService;

    /**
     * 获取友情链接列表
     * @return
     */
    @ApiOperation("获取友情链接列表")
    @GetMapping("/linkList")
    public ResultVo listGfLinks() {
        List<GfLinks> list = gfLinksService.list();
        return ResultVoUtil.success(list);
    }

    /**
     * 添加友链
     * @param link
     * @return
     */
    @ApiOperation("添加友链")
    @PostMapping("/addLinks")
    public ResultVo addLink(@Validated @RequestBody GfLinks link) {
        link.setCreateDate(UUIDUtils.getTime().toLocalDateTime());
        boolean save = gfLinksService.save(link);
        if (save) {
            return ResultVoUtil.success();
        } else {
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 更新友链封面
     * @param avatarFile
     * @return
     */
    @ApiOperation("更新用户头像")
    @RequestMapping(value = "/upload/avatar/update", method = RequestMethod.POST)
    public ResultVo updateLinksPic(@RequestParam("file") MultipartFile avatarFile) {
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
            return ResultVoUtil.success("/files/" + flag);
        } catch (IOException e) {
            return ResultVoUtil.error(ResultEnum.UPLOAD_ERROR);
        }
    }

    /**
     * 更新友链信息
     * @param gfLinks
     * @return
     */
    @ApiOperation("更新友链信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody GfLinks gfLinks) {
        boolean res = gfLinksService.updateById(gfLinks);
        if (res) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }
    }

    /**
     * 删除友链
     * @param id
     * @return
     */
    @ApiOperation("删除友链")
    @DeleteMapping("/delete/{id}")
    public ResultVo deleteLinks(@PathVariable Integer id) {
        boolean result = gfLinksService.deleteLinks(id);
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
    public ResultVo removeBatchOfLinks(@Validated @RequestBody List<String> ids) {
        System.out.println(ids.toString());
        return ResultVoUtil.success(gfLinksService.removeByIds(ids));
    }

}
