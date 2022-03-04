package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_game_type.AddGameTypeForm;
import com.fancoding.basic.project.form.gf_post_classify.AddPostClassifyForm;
import com.fancoding.basic.project.service.IGfPostClassifyService;
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
 * 帖子分类管理 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-07
 */
@RestController
@Api(tags = "帖子分类")
@AllArgsConstructor
@RequestMapping("/gf-post-classify")
public class GfPostClassifyController {

    private IGfPostClassifyService gfPostClassifyService;

    /**
     * 获取帖子分类列表
     * @return
     */
    @ApiOperation("获取帖子分类列表")
    @GetMapping("/postClassifyList")
    public ResultVo getAllPostClassify() {
        List<GfPostClassify> list = gfPostClassifyService.getAllPostClassify();
        return ResultVoUtil.success(list);
    }



    /**
     * 通过帖子id查找帖子分类
     * @param id
     * @return
     */
    @ApiOperation("通过帖子id查找帖子分类")
    @GetMapping("/classify/detail/{id}")
    public ResultVo getPostClassifyOfPostId(@PathVariable Integer id) {
        System.out.println(id);
        List<GfPostClassify> list = gfPostClassifyService.getPostClassifyOfPostId(id);
        return ResultVoUtil.success(list);
    }

    /**
     * 添加分类
     * @param postClassifyForm
     * @return
     */
    @ApiOperation("添加分类")
    @PostMapping("/addPostClassify")
    public ResultVo addPostClassify(@Validated @RequestBody AddPostClassifyForm postClassifyForm) {
        if(gfPostClassifyService.addPostClassify(postClassifyForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 删除帖子分类
     * @param id 帖子编号
     * @return 成功或者失败
     */
    @ApiOperation("删除帖子分类")
    @DeleteMapping("/deletePostClassify/{id}")
    public ResultVo deletePostClassify(@PathVariable("id") Integer id){
        gfPostClassifyService.deletePostClassify(id);
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
        return ResultVoUtil.success(gfPostClassifyService.removeByIds(ids));
    }

    /**
     * 更新帖子分类信息
     * @param postClassifyForm
     * @return
     */
    @ApiOperation("更新帖子分类信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody AddPostClassifyForm postClassifyForm) {
        if(gfPostClassifyService.updatePostClassify(postClassifyForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }


}
