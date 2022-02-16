package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.service.IGfPostClassifyService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 帖子分类管理 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-07
 */
@RestController
@Api(tags = "帖子分类")
@AllArgsConstructor
@RequestMapping("/gf-post-classify")
public class GfPostClassifyController {

    private IGfPostClassifyService gfPostClassifyService;

    /**
     * 获取帖子分类列表
     * @return
     */
    @ApiOperation("获取帖子分类列表")
    @GetMapping("/postClassifyList")
    public ResultVo getAllPostClassify() {
        List<GfPostClassify> list = gfPostClassifyService.getAllPostClassify();
        return ResultVoUtil.success(list);
    }



    /**
     * 通过帖子id查找帖子分类
     * @param id
     * @return
     */
    @ApiOperation("通过帖子id查找帖子分类")
    @GetMapping("/classify/detail/{id}")
    public ResultVo getPostClassifyOfPostId(@PathVariable Integer id) {
        System.out.println(id);
        List<GfPostClassify> list = gfPostClassifyService.getPostClassifyOfPostId(id);
        return ResultVoUtil.success(list);
    }


}
