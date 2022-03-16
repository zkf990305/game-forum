package com.fancoding.basic.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.*;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_post.AddPostForm;
import com.fancoding.basic.project.form.user.AddUserForm;
import com.fancoding.basic.project.service.*;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

        List<GfPostClassify> classify = postForm.getClassify();
        // GfPostGfPostClassify gfPostGfPostClassify = new GfPostGfPostClassify();
        // gfPostGfPostClassify.setClassifyId(classify.getId());

        List<GfPostTag> tags = postForm.getTags();


        try {
            gfPostService.addPost(gfPost);
            // 主键ID会回填
            int pid = gfPost.getId();
            // gfPostGfPostClassify.setPid(pid);
            // gfPostGfPostClassifyService.addClassify(gfPostGfPostClassify);
            for (int i = 0; i < classify.size(); i++) {
                GfPostGfPostClassify gfPostGfPostClassify = new GfPostGfPostClassify();
                gfPostGfPostClassify.setPid(pid);
                gfPostGfPostClassify.setClassifyId(classify.get(i).getId());
                gfPostGfPostClassifyService.addClassify(gfPostGfPostClassify);
            }
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
     * 编辑帖子
     * @param postForm
     * @param uid
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @ApiOperation("编辑帖子")
    @PostMapping("/editPost/{uid}")
    public ResultVo editPost(@Validated @RequestBody AddPostForm postForm, @PathVariable String uid){
        System.out.println(postForm);
        GfPost post = gfPostService.getOne(
                new QueryWrapper<GfPost>()
                        .eq("id", postForm.getId()));
        if (!uid.equals(postForm.getAuthorId())) {
            return ResultVoUtil.error("禁止非法编辑");
        }
        // 更新信息
        post.setTitle(postForm.getTitle());
        post.setContent(postForm.getContent());
        post.setOutline(postForm.getOutline());
        post.setPhotoUrl(post.getPhotoUrl());
        // 更新修改时间
        post.setGmtUpdate(UUIDUtils.getTime().toLocalDateTime());

        // 更新后的帖子分类
        List<GfPostClassify> classify = postForm.getClassify();
        // 原先的帖子分类
        List<GfPostGfPostClassify> gfPostGfPostClassifyList = gfPostGfPostClassifyService.list(
                new QueryWrapper<GfPostGfPostClassify>()
                        .eq("pid", post.getId())
        );

        // 更新后的帖子标签
        List<GfPostTag> tags = postForm.getTags();
        List<GfPostGfPostTag> gfPostGfPostTagsList = gfPostGfPostTagService.list(
                new QueryWrapper<GfPostGfPostTag>()
                        .eq("pid", post.getId())
        );

        try {
            gfPostService.updateById(post);

            // 分类
            // 添加没有的
            for (int i = 0; i < classify.size(); i++) {
                boolean res = false;
                for (GfPostGfPostClassify gfPostGfPostClassify : gfPostGfPostClassifyList) {
                    if (classify.get(i).getId().equals(gfPostGfPostClassify.getClassifyId())) {
                        res = true;
                    }
                }
                if (!res) {
                    GfPostGfPostClassify gfPostGfPostClassify = new GfPostGfPostClassify();
                    gfPostGfPostClassify.setPid(post.getId());
                    gfPostGfPostClassify.setClassifyId(classify.get(i).getId());
                    gfPostGfPostClassifyService.addClassify(gfPostGfPostClassify);
                }
            }
            // 不存在就删除
            for (GfPostGfPostClassify gfPostGfPostClassify : gfPostGfPostClassifyList) {
                boolean res = false;
                for (int i = 0; i < classify.size(); i++) {
                    if (classify.get(i).getId().equals(gfPostGfPostClassify.getClassifyId())) {
                        res = true;
                    }
                }
                if (!res) {
                    gfPostGfPostClassifyService.removeById(gfPostGfPostClassify);
                }
            }

            // 标签
            // 添加没有的
            for (int i = 0; i < tags.size(); i++) {
                boolean res = false;
                for (GfPostGfPostTag gfPostGfPostTag : gfPostGfPostTagsList) {
                    if (tags.get(i).getId().equals(gfPostGfPostTag.getTagId())) {
                        res = true;
                    }
                }
                if (!res) {
                    GfPostGfPostTag gfPostGfPostTag = new GfPostGfPostTag();
                    gfPostGfPostTag.setPid(post.getId());
                    gfPostGfPostTag.setTagId(tags.get(i).getId());
                    gfPostGfPostTagService.addTags(gfPostGfPostTag);
                }
            }
            // 不存在就删除
            for (GfPostGfPostTag gfPostGfPostTag : gfPostGfPostTagsList) {
                boolean res = false;
                for (int i = 0; i < tags.size(); i++) {
                    if (tags.get(i).getId().equals(gfPostGfPostTag.getTagId())) {
                        res = true;
                    }
                }
                if (!res) {
                    gfPostGfPostTagService.removeById(gfPostGfPostTag);
                }
            }

        }catch (Exception e) {
            System.out.println("操作异常" + e);
            // controller 中增加事务
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }
        return ResultVoUtil.success();
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
     * 获取全部帖子列表
     * @return 帖子列表
     */
    @ApiOperation("获取全部帖子列表")
    @GetMapping("/allPostList")
    public ResultVo allPostList() {
        List<GfPost> list = gfPostService.list(
                new QueryWrapper<GfPost>()
                        .orderByAsc("status"));
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

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ApiOperation("批量删除")
    @PostMapping("/removeBatch")
    public ResultVo removeBatchOfPost(@Validated @RequestBody List<String> ids) {
        System.out.println(ids.toString());
        return ResultVoUtil.success(gfPostService.removeByIds(ids));
    }

    /**
     * 删除帖子
     * @param id
     * @return
     */
    @ApiOperation("删除帖子")
    @DeleteMapping("/delete/{id}")
    public ResultVo deletePost(@PathVariable Integer id) {
        boolean result = gfPostService.deletePost(id);
        if (result) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.DELETE_ERROR);
        }
    }

    /**
     * 状态修改
     * @param gfPost
     * @return
     */
    @ApiOperation("状态修改")
    @ResponseBody
    @PostMapping("/changePostStatus")
    public ResultVo changePostStatus(@Validated @RequestBody GfPost gfPost) {
        boolean res = gfPostService.changePostStatus(gfPost.getId(), gfPost.getStatus());
        if (res) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error("状态修改失败");
        }

    }


}
