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
 * 帖子表 
《中间表》
分类表
 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@RestController
@Api(tags = "帖子类型--中间表--帖子表")
@AllArgsConstructor
@RequestMapping("/gf-post-gf-post-classify")
public class GfPostGfPostClassifyController {



}
