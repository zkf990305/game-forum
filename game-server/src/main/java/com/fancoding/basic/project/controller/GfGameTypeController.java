package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_game_type.AddGameTypeForm;
import com.fancoding.basic.project.form.gf_message.AddMessageForm;
import com.fancoding.basic.project.service.IGfGameTypeService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
     * 添加分类
     * @param gameTypeForm
     * @return
     */
    @ApiOperation("添加分类")
    @PostMapping("/addGameType")
    public ResultVo addGameType(@Validated @RequestBody AddGameTypeForm gameTypeForm) {
        if(gfGameTypeService.addGameType(gameTypeForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

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

    /**
     * 删除游戏分类
     * @param id 留言编号
     * @return 成功或者失败
     */
    @ApiOperation("删除游戏分类")
    @DeleteMapping("/deleteGameType/{id}")
    public ResultVo deleteGameType(@PathVariable("id") Integer id){
        gfGameTypeService.deleteGameType(id);
        return ResultVoUtil.success();
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ApiOperation("批量删除")
    @PostMapping("/removeBatch")
    public ResultVo removeBatch(@Validated @RequestBody List<String> ids) {
        return ResultVoUtil.success(gfGameTypeService.removeByIds(ids));
    }

    /**
     * 更新游戏分类信息
     * @param gameTypeForm
     * @return
     */
    @ApiOperation("更新游戏分类信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody AddGameTypeForm gameTypeForm) {
        if(gfGameTypeService.updateGameType(gameTypeForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }
}
