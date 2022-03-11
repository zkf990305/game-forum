package com.fancoding.basic.project.controller;


import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_user_gf_user_role.GfUserGfUserRoleForm;
import com.fancoding.basic.project.form.gf_user_info.GfUserInfoForm;
import com.fancoding.basic.project.service.IGfUserGfUserRoleService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户角色关联表
用户表
    《中间表》
角色表 前端控制器
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@RestController
@Api(tags = "用户角色关联表")
@AllArgsConstructor
@RequestMapping("/gf-user-gf-user-role")
public class GfUserGfUserRoleController {

    private IGfUserGfUserRoleService gfUserGfUserRoleService;

    @ApiOperation("更新用户权限")
    @PutMapping("/update")
    public ResultVo update(@Validated @RequestBody GfUserGfUserRoleForm gfUserGfUserRoleForm) {
        if(gfUserGfUserRoleService.updateRole(gfUserGfUserRoleForm)){
            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

}
