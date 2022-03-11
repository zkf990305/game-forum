package com.fancoding.basic.project.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.*;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_game.AddGameForm;
import com.fancoding.basic.project.form.gf_post.AddPostForm;
import com.fancoding.basic.project.service.IGfGameGfGameTypeService;
import com.fancoding.basic.project.service.IGfGameService;
import com.fancoding.basic.project.service.IGfGameTypeService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.GfGameVo;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javafx.scene.control.CheckBox;
import lombok.AllArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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

        List<GfGameVo> list = gfGameService.getGameList();
        return ResultVoUtil.success(list);
    }

    /**
     * 获取前8条游戏
     * @return
     */
    @ApiOperation("获取前8条游戏")
    @GetMapping("/gameList8")
    public ResultVo gameListOfTheFirstEight() {
        List<GfGameVo> list = gfGameService.getNewsOfTheFirstEight();
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

    /**
     * 更新游戏信息
     * @param gfGame
     * @return
     */
    @ApiOperation("更新游戏信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody GfGame gfGame) {
        boolean res = gfGameService.updateById(gfGame);
        if (res) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }
    }

    /**
     * 删除游戏
     * @param id
     * @return
     */
    @ApiOperation("删除游戏")
    @DeleteMapping("/delete/{id}")
    public ResultVo deleteGame(@PathVariable Integer id) {
        boolean result = gfGameService.deleteGame(id);
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
    public ResultVo removeBatchOfGame(@Validated @RequestBody List<String> ids) {
        System.out.println(ids.toString());
        return ResultVoUtil.success(gfGameService.removeByIds(ids));
    }

    /**
     * 添加游戏
     * @param gameForm
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @ApiOperation("发表帖子")
    @PostMapping("/addGame")
    public ResultVo addUser(@Validated @RequestBody AddGameForm gameForm){
        System.out.println(gameForm.toString());
        GfGame gfGame = new GfGame();
        gfGame.setName(gameForm.getName());
        gfGame.setStatus(gameForm.getStatus());
        gfGame.setContent(gameForm.getContent());
        gfGame.setImage(gameForm.getImage());
        gfGame.setOfficialWebsite(gameForm.getOfficialWebsite());

        List<GfGameType> type = gameForm.getType();


        try {
            gfGameService.addGame(gfGame);
            // 主键ID会回填
            int gid = gfGame.getId();

            for (int i = 0; i < type.size(); i++) {
                GfGameGfGameType gfGameGfGameType = new GfGameGfGameType();
                gfGameGfGameType.setGid(gid);
                gfGameGfGameType.setTypeId(type.get(i).getId());
                gfGameGfGameTypeService.addType(gfGameGfGameType);
            }
            return ResultVoUtil.success();
        }catch (Exception e) {
            System.out.println("操作异常" + e);
            // controller 中增加事务
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

}
