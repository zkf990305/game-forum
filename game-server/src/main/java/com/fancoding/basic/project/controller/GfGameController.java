package com.fancoding.basic.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfGame;
import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.service.IGfGameGfGameTypeService;
import com.fancoding.basic.project.service.IGfGameService;
import com.fancoding.basic.project.service.IGfGameTypeService;
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
 * 游戏表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
@RestController
@Api(tags = "游戏")
@AllArgsConstructor
@RequestMapping("/gf-game")
public class GfGameController {

    private IGfGameService gfGameService;

    private IGfGameTypeService gfGameTypeService;

    private IGfGameGfGameTypeService gfGameGfGameTypeService;

    /**
     * 获取全部游戏列表
     * @return
     */
    @ApiOperation("获取全部游戏列表")
    @GetMapping("/gameList")
    public ResultVo gameLists() {
        List<GfGame> list = gfGameService.list();
        return ResultVoUtil.success(list);
    }

    /**
     * 获取前8条游戏
     * @return
     */
    @ApiOperation("获取前8条游戏")
    @GetMapping("/gameList8")
    public ResultVo gameListOfTheFirstEight() {
        List<GfGame> list = gfGameService.getNewsOfTheFirstEight();
        return ResultVoUtil.success(list);
    }

    /**
     * 获取对应类型的游戏
     * @param style
     * @return
     */
    @ApiOperation("获取对应类型的游戏")
    @GetMapping("/style/detail/{style}")
    public ResultVo getGameListOfStyle(@PathVariable String style) {
        // 判断这个类型存在
        GfGameType type = gfGameTypeService.getOne(new QueryWrapper<GfGameType>().eq("type", style));
        if (type == null) {
            return ResultVoUtil.success();
        }
        // 联表查询 通过类别找游戏
        List<GfGame> byGameType = gfGameService.findByGameType(style);
        return ResultVoUtil.success(byGameType);
    }

    /**
     * 按游戏名模糊查询游戏列表
     * @param title
     * @return
     */
    @ApiOperation("按游戏名模糊查询游戏列表")
    @GetMapping("/likeTitle/detail/{title}")
    public ResultVo getGameListOfLikeTitle(@PathVariable String title) {
        List<GfGame> list = gfGameService.getGameListOfLikeTitle(title);
        return ResultVoUtil.success(list);
    }

    /**
     * 收藏了的游戏
     * @param id
     * @return
     */
    @ApiOperation("收藏了的游戏")
    @GetMapping("/collect/detail/{id}")
    public ResultVo getGameListOfCollect(@PathVariable String id) {
        List<GfGame> list = gfGameService.getGameListOfCollect(id);
        return ResultVoUtil.success(list);
    }

}
