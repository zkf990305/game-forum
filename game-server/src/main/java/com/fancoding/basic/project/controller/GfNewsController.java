package com.fancoding.basic.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.fancoding.basic.project.entity.GfNews;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_user.RegisterGfUserForm;
import com.fancoding.basic.project.form.gf_user_info.GfUserInfoForm;
import com.fancoding.basic.project.service.IGfNewsService;
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
 * 通告板 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-02-09
 */
@RestController
@Api(tags = "公告")
@AllArgsConstructor
@RequestMapping("/gf-news")
public class GfNewsController {

    private IGfNewsService gfNewsService;

    /**
     * 获取全部公告
     * @return
     */
    @ApiOperation("获取全部公告")
    @GetMapping("/newsList")
    public ResultVo newsList() {
        List<GfNews> list = gfNewsService.getAllNewsList();
        return ResultVoUtil.success(list);
    }

    /**
     * 获取前8条公告
     * @return
     */
    @ApiOperation("获取前8条公告")
    @GetMapping("/newsList8")
    public ResultVo newsListOfTheFirstEight() {
        List<GfNews> list = gfNewsService.getNewsOfTheFirstEight();
        return ResultVoUtil.success(list);
    }

    /**
     * 发布公告
     * @param gfNews
     * @return
     */
    @ApiOperation("发布公告")
    @PostMapping("/addNews")
    public ResultVo addGfNews(@Validated @RequestBody GfNews gfNews){
        gfNews.setCreatetime(UUIDUtils.getTime().toLocalDateTime());
        gfNews.setGmtUpdatetime(UUIDUtils.getTime().toLocalDateTime());
        boolean save = gfNewsService.save(gfNews);
        if (save) {
            return ResultVoUtil.success();
        } else {
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 删除公告
     * @param id
     * @return
     */
    @ApiOperation("删除公告")
    @DeleteMapping("/delete/{id}")
    public ResultVo deleteNews(@PathVariable Integer id) {
        boolean result = gfNewsService.deleteNews(id);
        if (result) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.DELETE_ERROR);
        }
    }

    /**
     * 更新公告信息
     * @param gfNews
     * @return
     */
    @ApiOperation("更新公告信息")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody GfNews gfNews) {
        gfNews.setGmtUpdatetime(UUIDUtils.getTime().toLocalDateTime());
        boolean res = gfNewsService.updateById(gfNews);
        if (res) {
            return ResultVoUtil.success();
        }else {
            return ResultVoUtil.error(ResultEnum.UPDATE_ERROR);
        }
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ApiOperation("批量删除")
    @PostMapping("/removeBatch")
    public ResultVo removeBatchOfNews(@Validated @RequestBody List<String> ids) {
        System.out.println(ids.toString());
        return ResultVoUtil.success(gfNewsService.removeByIds(ids));
    }
}
