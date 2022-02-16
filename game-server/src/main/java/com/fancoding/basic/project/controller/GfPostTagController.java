package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.service.IGfLinksService;
import com.fancoding.basic.project.service.IGfPostTagService;
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
 * 帖子标签 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@RestController
@Api(tags = "标签")
@AllArgsConstructor
@RequestMapping("/gf-post-tag")
public class GfPostTagController {

    private IGfPostTagService gfPostTagService;

    /**
     * 获取标签列表
     * @return
     */
    @ApiOperation("获取标签列表")
    @GetMapping("/tagList")
    public ResultVo listGfPostTag() {
        List<GfPostTag> list = gfPostTagService.getAllPostTag();
        return ResultVoUtil.success(list);
    }

    /**
     * 通过帖子id查找帖子标签
     * @param id
     * @return
     */
    @ApiOperation("通过帖子id查找帖子分类")
    @GetMapping("/tag/detail/{id}")
    public ResultVo getPostTagOfPostId(@PathVariable Integer id) {
        List<GfPostTag> list = gfPostTagService.getPostTagOfPostId(id);
        return ResultVoUtil.success(list);
    }

}
