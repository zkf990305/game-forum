package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.service.IGfNewsService;
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
 * 通告板 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-09
 */
@RestController
@Api(tags = "公告")
@AllArgsConstructor
@RequestMapping("/gf-news")
public class GfNewsController {

    private IGfNewsService gfNewsService;

    /**
     * 获取全部公告
     * @return
     */
    @ApiOperation("获取全部公告")
    @GetMapping("/newsList")
    public ResultVo newsList() {
        List<GfNews> list = gfNewsService.getAllNewsList();
        return ResultVoUtil.success(list);
    }

    /**
     * 获取前8条公告
     * @return
     */
    @ApiOperation("获取前8条公告")
    @GetMapping("/newsList8")
    public ResultVo newsListOfTheFirstEight() {
        List<GfNews> list = gfNewsService.getNewsOfTheFirstEight();
        return ResultVoUtil.success(list);
    }



}
