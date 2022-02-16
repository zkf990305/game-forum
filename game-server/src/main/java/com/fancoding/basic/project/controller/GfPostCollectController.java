package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfPostCollect;
import com.fancoding.basic.project.entity.GfPostComment;
import com.fancoding.basic.project.entity.GfPostLike;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.service.IGfPostCollectService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 帖子收藏表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@RestController
@Api(tags = "收藏表")
@AllArgsConstructor
@RequestMapping("/gf-post-collect")
public class GfPostCollectController {

    private IGfPostCollectService gfPostCollectService;

    /**
     * 添加收藏
     * @param collect
     * @return
     */
    @ApiOperation("添加收藏")
    @PostMapping("/add")
    public ResultVo addCollect(@Validated @RequestBody GfPostCollect collect){

        collect.setGmtCreate(UUIDUtils.getTime().toLocalDateTime());
        boolean res = gfPostCollectService.addCollect(collect);
        if (res){
            return ResultVoUtil.success("收藏成功");
        }else {
            return ResultVoUtil.error("收藏失败");
        }
    }

    /**
     * 查看是否收藏了
     * @param collect
     * @return
     */
    @ApiOperation("查看是否收藏了")
    @PostMapping("/isCollect")
    public ResultVo selectByCollect(@Validated @RequestBody GfPostCollect collect){
        // 查看是否点赞了
        return  ResultVoUtil.success(gfPostCollectService.selectByCollect(collect));
    }

    /**
     * 取消收藏
     * @param collect
     * @return
     */
    @ApiOperation("取消收藏")
    @PostMapping("/deleteCollect")
    public ResultVo deleteCollect(@Validated @RequestBody GfPostCollect collect) {
        // 查看是否点赞了
        GfPostCollect flag =  gfPostCollectService.selectByCollect(collect);
        if (flag == null) {
            return ResultVoUtil.error("取消失败");
        }
        boolean res = gfPostCollectService.deleteCollect(collect);
        if (res){
            return ResultVoUtil.success("取消收藏");
        }else {
            return ResultVoUtil.error("取消失败");
        }
    }


    /**
     * 返回的指定用户ID收藏列表
     * @param id
     * @return
     */
    @ApiOperation("返回的指定用户ID收藏列表")
    @GetMapping("/collect/detail/{id}")
    public ResultVo collectOfUserId(@PathVariable String id){
        List<GfPostCollect> list = gfPostCollectService.collectOfUserId(id);
        return ResultVoUtil.success(list);
    }

    /**
     * 删除收藏的游戏或帖子
     * @param id
     * @return
     */
    @ApiOperation("删除收藏的游戏或帖子")
    @GetMapping( "/delete/{id}")
    public ResultVo deleteComment(@PathVariable Integer id){
        if (gfPostCollectService.deleteComment(id)) {
            return ResultVoUtil.success("成功删除该收藏");
        }else {
            return ResultVoUtil.error(ResultEnum.DELETE_ERROR);
        }
    }
}
