package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfPostCollect;
import com.fancoding.basic.project.entity.GfPostLike;
import com.fancoding.basic.project.service.IGfPostLikeService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 帖子点赞表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-13
 */
@RestController
@Api(tags = "点赞")
@AllArgsConstructor
@RequestMapping("/gf-post-like")
public class GfPostLikeController {

    private IGfPostLikeService gfPostLikeService;

    /**
     * 点赞
     * @param like
     * @return
     */
    @ApiOperation("点赞")
    @PostMapping("/add")
    public ResultVo addLike(@Validated @RequestBody GfPostLike like){
        // 查看是否点赞了
        GfPostLike flag =  gfPostLikeService.selectByLike(like);
        if (flag != null) {
            return ResultVoUtil.error("只能点赞一次");
        }
        like.setGmtCreate(UUIDUtils.getTime().toLocalDateTime());
        boolean res = gfPostLikeService.addLike(like);
        if (res){
            return ResultVoUtil.success("点赞成功");
        }else {
            return ResultVoUtil.error("点赞失败");
        }
    }


    /**
     * 查看是否点赞了
     * @param like
     * @return
     */
    @ApiOperation("查看是否点赞了")
    @PostMapping("/isLike")
    public ResultVo selectByLike(@Validated @RequestBody GfPostLike like){
        // 查看是否点赞了
        return  ResultVoUtil.success(gfPostLikeService.selectByLike(like));
    }

    /**
     * 取消点赞
     * @param like
     * @return
     */
    @ApiOperation("取消点赞")
    @PostMapping("/deleteLike")
    public ResultVo deleteLike(@Validated @RequestBody GfPostLike like) {
        // 查看是否点赞了
        GfPostLike flag =  gfPostLikeService.selectByLike(like);
        if (flag == null) {
            return ResultVoUtil.error("取消失败");
        }
        boolean res = gfPostLikeService.deleteLike(like);
        if (res){
            return ResultVoUtil.success("取消点赞");
        }else {
            return ResultVoUtil.error("取消失败");
        }
    }


}
