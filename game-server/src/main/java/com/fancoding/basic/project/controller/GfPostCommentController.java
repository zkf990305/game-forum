package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfPostComment;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.service.IGfPostCommentService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 帖子/游戏评论表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-11
 */
@RestController
@Api(tags = "评论")
@AllArgsConstructor
@RequestMapping("/gf-post-comment")
public class GfPostCommentController {

    private IGfPostCommentService gfPostCommentService;


    /**
     * 提交评论
     * @param comment
     * @return
     */
    @ApiOperation("提交评论")
    @PostMapping("/add")
    public ResultVo addComment(@Validated @RequestBody GfPostComment comment){
        comment.setGmtCreate(UUIDUtils.getTime().toLocalDateTime());
        boolean res = gfPostCommentService.addComment(comment);
        if (res){
            return ResultVoUtil.success("评论成功");
        }else {
            return ResultVoUtil.error("评论失败");
        }
    }



    /**
     * 获得指定游戏ID的评论列表
     * @param id
     * @return
     */
    @ApiOperation("获得指定游戏ID的评论列表")
    @GetMapping("/game/detail/{id}")
    public ResultVo commentOfGameId(@PathVariable Integer id){
        boolean res = gfPostCommentService.updateCommentNumberOfLikes(1 ,id);
        List<GfPostComment> list = gfPostCommentService.commentOfGameId(id);
        return ResultVoUtil.success(list);
    }

    /**
     * 获得指定帖子ID的评论列表
     * @param id
     * @return
     */
    @ApiOperation("获得指定帖子ID的评论列表")
    @GetMapping( "/post/detail/{id}")
    public ResultVo commentOfPostId(@PathVariable Integer id){
        boolean res = gfPostCommentService.updateCommentNumberOfLikes(0 ,id);
        List<GfPostComment> list = gfPostCommentService.commentOfPostId(id);
        return ResultVoUtil.success(list);
    }

    /**
     * 获取所有评论列表
     * @return
     */
    @ApiOperation("获取所有评论列表")
    @GetMapping("/commentList")
    public ResultVo allComment(){
        List<GfPostComment> comments =  gfPostCommentService.allComment();
        return ResultVoUtil.success(comments);
    }

    /**
     * 删除评论
     * @param id
     * @return
     */
    @ApiOperation("删除评论")
    @GetMapping( "/delete/{id}")
    public ResultVo deleteComment(@PathVariable Integer id){
        if (gfPostCommentService.deleteComment(id)) {
            return ResultVoUtil.success("成功删除评论");
        }else {
            return ResultVoUtil.error(ResultEnum.DELETE_ERROR);
        }
    }
}
