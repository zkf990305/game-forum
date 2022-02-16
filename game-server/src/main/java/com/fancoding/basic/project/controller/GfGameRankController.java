package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfGameRank;
import com.fancoding.basic.project.service.IGfGameRankService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 游戏评价分数表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@RestController
@Api(tags = "游戏评分")
@AllArgsConstructor
@RequestMapping("/gf-game-rank")
public class GfGameRankController {


    private IGfGameRankService gfGameRankService;

    /**
     * 评分
     * @param gfGameRank
     * @return
     */
    @ApiOperation("评分")
    @PostMapping("/add")
    public ResultVo addRank(@Validated @RequestBody GfGameRank gfGameRank) {
        boolean res = gfGameRankService.addRank(gfGameRank);
        if (res){
            return ResultVoUtil.success("评分成功");
        }else {
            return ResultVoUtil.error("评分失败");
        }
    }

    /**
     * 求最后评分 -- 每个游戏
     * @param gid
     * @return
     */
    @ApiOperation("求最后评分 -- 每个游戏")
    @GetMapping("/checkTheTotalScore/{gid}")
    public ResultVo checkTheTotalScore( @PathVariable Integer gid) {
        int res = gfGameRankService.checkTheTotalScore(gid);
        return ResultVoUtil.success(res);
    }

    /**
     * 参与评分人数 -- 游戏划分
     * @param gid
     * @return
     */
    @ApiOperation("参与评分人数 -- 游戏划分")
    @PostMapping("/theNumberOfParticipants/{gid}")
    public ResultVo theNumberOfParticipants( @PathVariable Integer gid) {
        int res = gfGameRankService.theNumberOfParticipants(gid);
        return ResultVoUtil.success(res);
    }
}
