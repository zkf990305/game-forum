package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_post_classify.AddPostClassifyForm;
import com.fancoding.basic.project.form.gf_post_tag.AddPostTagForm;
import com.fancoding.basic.project.service.IGfLinksService;
import com.fancoding.basic.project.service.IGfPostTagService;
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
 * 帖子标签 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@RestController
@Api(tags = "标签")
@AllArgsConstructor
@RequestMapping("/gf-post-tag")
public class GfPostTagController {

    private IGfPostTagService gfPostTagService;



    /**
     * 获取标签列表
     * @return
     */
    @ApiOperation("获取标签列表")
    @GetMapping("/tagList")
    public ResultVo listGfPostTag() {
        List<GfPostTag> list = gfPostTagService.getAllPostTag();
        return ResultVoUtil.success(list);
    }

    /**
     * 通过帖子id查找帖子标签
     * @param id
     * @return
     */
    @ApiOperation("通过帖子id查找帖子分类")
    @GetMapping("/tag/detail/{id}")
    public ResultVo getPostTagOfPostId(@PathVariable Integer id) {
        List<GfPostTag> list = gfPostTagService.getPostTagOfPostId(id);
        return ResultVoUtil.success(list);
    }

    /**
     * 添加分类
     * @param postTagForm
     * @return
     */
    @ApiOperation("添加分类")
    @PostMapping("/addPostTag")
    public ResultVo addPostTag(@Validated @RequestBody AddPostTagForm postTagForm) {
        if(gfPostTagService.addPostTag(postTagForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 删除帖子标签
     * @param id 帖子编号
     * @return 成功或者失败
     */
    @ApiOperation("删除帖子标签")
    @DeleteMapping("/deletePostTag/{id}")
    public ResultVo deletePostTag(@PathVariable("id") Integer id){
        gfPostTagService.deletePostTag(id);
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
        return ResultVoUtil.success(gfPostTagService.removeByIds(ids));
    }

    /**
     * 更新帖子标签信息
     * @param postTagForm
     * @return
     */
    @ApiOperation("更新帖子标签信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody AddPostTagForm postTagForm) {
        if(gfPostTagService.updatePostTag(postTagForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }
    }

}
