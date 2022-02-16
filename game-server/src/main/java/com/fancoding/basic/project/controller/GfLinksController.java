package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.service.IGfLinksService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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

}
