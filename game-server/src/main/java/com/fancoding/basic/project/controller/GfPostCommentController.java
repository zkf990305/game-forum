package com.fancoding.basic.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.config.SensitiveFilter;
import com.fancoding.basic.project.entity.GfPost;
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

    private SensitiveFilter sensitiveFilter;


    /**
     * 提交评论
     * @param comment
     * @return
     */
    @ApiOperation("提交评论")
    @PostMapping("/add")
    public ResultVo addComment(@Validated @RequestBody GfPostComment comment){
        comment.setGmtCreate(UUIDUtils.getTime().toLocalDateTime());
        comment.setContent(sensitiveFilter.filter(comment.getContent()));
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
     * 获取所有评论列表 已审核
     * @return
     */
    @ApiOperation("获取所有评论列表")
    @GetMapping("/commentList")
    public ResultVo CommentList(){
        List<GfPostComment> comments =  gfPostCommentService.allComment();
        return ResultVoUtil.success(comments);
    }

    /**
     * 获取所有评论列表
     * @return
     */
    @ApiOperation("获取所有评论列表")
    @GetMapping("/allComment")
    public ResultVo allComment(){
        List<GfPostComment> comments =  gfPostCommentService.list(
                new QueryWrapper<GfPostComment>()
                        .orderByDesc("gmt_create"));
        return ResultVoUtil.success(comments);
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ApiOperation("批量删除")
    @PostMapping("/removeBatch")
    public ResultVo removeBatchOfComment(@Validated @RequestBody List<String> ids) {
        return ResultVoUtil.success(gfPostCommentService.removeByIds(ids));
    }

    /**
     * 删除评论
     * @param id
     * @return
     */
    @ApiOperation("删除评论")
    @DeleteMapping( "/delete/{id}")
    public ResultVo deleteComment(@PathVariable Integer id){
        if (gfPostCommentService.deleteComment(id)) {
            return ResultVoUtil.success("成功删除评论");
        }else {
            return ResultVoUtil.error(ResultEnum.DELETE_ERROR);
        }
    }

    /**
     * 状态修改
     * @param gfPostComment
     * @return
     */
    @ApiOperation("状态修改")
    @ResponseBody
    @PostMapping("/changeCommentStatus")
    public ResultVo changeCommentStatus(@Validated @RequestBody GfPostComment gfPostComment) {
        boolean res = gfPostCommentService.changeCommentStatus(gfPostComment.getId(), gfPostComment.getStatus());
        if (res) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error("状态修改失败");
        }

    }

    /**
     * 自己发布的帖子下的评论
     * @return 帖子列表
     */
    @ApiOperation("自己发布的帖子下的评论")
    @GetMapping("/commentList/{id}")
    public ResultVo listCommentOfMe(@PathVariable String id) {
        List<GfPostComment> list = gfPostCommentService.selectOfCommentOfMe(id);
        return ResultVoUtil.success(list);
    }
}
