package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.entity.GfLinks;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_message.AddMessageForm;
import com.fancoding.basic.project.service.IGfMessageService;
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
 * 留言表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-03-02
 */
@RestController
@Api(tags = "留言表")
@AllArgsConstructor
@RequestMapping("/gf-message")
public class GfMessageController {

    private IGfMessageService gfMessageService;

    /**
     * 添加留言
     * @param messageForm
     * @return
     */
    @ApiOperation("添加留言")
    @PostMapping("/addMessage")
    public ResultVo addMessage(@Validated @RequestBody AddMessageForm messageForm) {
        if(gfMessageService.addMessage(messageForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 获取留言列表
     * @return
     */
    @ApiOperation("获取留言列表")
    @GetMapping("/messageList")
    public ResultVo listGfMessage() {
        return ResultVoUtil.success(gfMessageService.listGfMessage());
    }

    /**
     * 删除留言
     * @param id 留言编号
     * @return 成功或者失败
     */
    @ApiOperation("删除留言")
    @DeleteMapping("/deleteMessage/{id}")
    public ResultVo deleteMessage(@PathVariable("id") Integer id){
        gfMessageService.deleteMessage(id);
        return ResultVoUtil.success();
    }

}
