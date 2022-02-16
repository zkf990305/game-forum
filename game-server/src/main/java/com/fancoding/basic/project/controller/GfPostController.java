package com.fancoding.basic.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.*;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_post.AddPostForm;
import com.fancoding.basic.project.form.user.AddUserForm;
import com.fancoding.basic.project.service.*;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 帖子表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-02
 */
@RestController
@Api(tags = "帖子")
@AllArgsConstructor
@RequestMapping("/gf-post")
public class GfPostController {

    private IGfPostService gfPostService;

    private IGfPostGfPostClassifyService gfPostGfPostClassifyService;

    private IGfPostGfPostTagService gfPostGfPostTagService;

    /**
     * 发表帖子
     * @param postForm 表单数据
     * @return 成功或者失败
     */
    @Transactional(rollbackFor = Exception.class)
    @ApiOperation("发表帖子")
    @PostMapping("/addPost")
    public ResultVo addUser(@Validated @RequestBody AddPostForm postForm){
        System.out.println(postForm.toString());
        GfPost gfPost = new GfPost();
        gfPost.setTitle(postForm.getTitle());
        gfPost.setContent(postForm.getContent());
        gfPost.setOutline(postForm.getOutline());
        gfPost.setPhotoUrl(postForm.getPhotoUrl());
        gfPost.setAuthorId(postForm.getAuthorId());
        gfPost.setAuthorName(postForm.getAuthorName());
        gfPost.setAuthorAvatar(postForm.getAuthorAvatar());
        gfPost.setViews(postForm.getViews());
        gfPost.setGmtCreate(postForm.getGmtCreate());
        gfPost.setGmtUpdate(postForm.getGmtUpdate());
        gfPost.setStatus(postForm.getStatus());

        GfPostClassify classify = postForm.getClassify();
        GfPostGfPostClassify gfPostGfPostClassify = new GfPostGfPostClassify();
        gfPostGfPostClassify.setClassifyId(classify.getId());

        List<GfPostTag> tags = postForm.getTags();


        try {
            gfPostService.addPost(gfPost);
            // 主键ID会回填
            int pid = gfPost.getId();
            gfPostGfPostClassify.setPid(pid);
            gfPostGfPostClassifyService.addClassify(gfPostGfPostClassify);
            for (int i = 0; i < tags.size(); i++) {
                GfPostGfPostTag gfPostGfPostTag = new GfPostGfPostTag();
                gfPostGfPostTag.setPid(pid);
                gfPostGfPostTag.setTagId(tags.get(i).getId());
                gfPostGfPostTagService.addTags(gfPostGfPostTag);
            }
            return ResultVoUtil.success();
        }catch (Exception e) {
            System.out.println("操作异常" + e);
            // controller 中增加事务
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 获取帖子列表
     * @return 帖子列表
     */
    @ApiOperation("获取帖子列表")
    @GetMapping("/postList")
    public ResultVo listPost() {
        List<GfPost> list = gfPostService.listPost();
        return ResultVoUtil.success(list);
    }

    /**
     * 获取对应类型的帖子
     * @param classify
     * @return
     */
    @ApiOperation("获取对应类型的游戏")
    @GetMapping("/classify/detail/{classify}")
    public ResultVo getPostListOfClassify(@PathVariable String classify) {
        // 联表查询 通过类别找游戏
        List<GfPost> list = gfPostService.findByPostClassify(classify);
        return ResultVoUtil.success(list);
    }

    /**
     * 获取对应标签的帖子
     * @param tag
     * @return
     */
    @ApiOperation("获取对应标签的游戏")
    @GetMapping("/tag/detail/{tag}")
    public ResultVo getPostListOfTag(@PathVariable String tag) {
        // 联表查询 通过类别找游戏
        List<GfPost> list = gfPostService.findByPostTag(tag);
        return ResultVoUtil.success(list);
    }

    /**
     * 按帖子名模糊查询帖子列表
     * @param title
     * @return
     */
    @ApiOperation("按帖子名模糊查询帖子列表")
    @GetMapping("/likeTitle/detail/{title}")
    public ResultVo getPostListOfLikeTitle(@PathVariable String title) {
        List<GfPost> list = gfPostService.getPostListOfLikeTitle(title);
        return ResultVoUtil.success(list);
    }

    /**
     * 收藏了的帖子
     * @param id
     * @return
     */
    @ApiOperation("收藏了的帖子")
    @GetMapping("/collect/detail/{id}")
    public ResultVo getPostListOfCollect(@PathVariable String id) {
        List<GfPost> list = gfPostService.getPostListOfCollect(id);
        return ResultVoUtil.success(list);
    }

    /**
     * 自己发布的帖子
     * @return 帖子列表
     */
    @ApiOperation("自己发布的帖子")
    @GetMapping("/postList/{id}")
    public ResultVo listPostOfMe(@PathVariable String id) {
        List<GfPost> list = gfPostService.listPostOfMe(id);
        return ResultVoUtil.success(list);
    }


}
