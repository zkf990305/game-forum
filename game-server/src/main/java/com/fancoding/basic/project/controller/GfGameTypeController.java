package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.service.IGfGameTypeService;
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
 * 游戏类型表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
@RestController
@Api(tags = "游戏类别")
@AllArgsConstructor
@RequestMapping("/gf-game-type")
public class GfGameTypeController {

    private IGfGameTypeService gfGameTypeService;
    /**
     * 获取全部游戏类型列表
     * @return
     */
    @ApiOperation("获取全部游戏类型列表")
    @GetMapping("/typeList")
    public ResultVo listGameTypes() {
        List<GfGameType> list = gfGameTypeService.list();
        return ResultVoUtil.success(list);
    }

}
