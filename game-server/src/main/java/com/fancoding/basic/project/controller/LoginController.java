package com.fancoding.basic.project.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.config.email.MailClient;
import com.fancoding.basic.project.entity.GfUser;
import com.fancoding.basic.project.entity.GfUserGfUserRole;
import com.fancoding.basic.project.entity.GfUserInfo;
import com.fancoding.basic.project.entity.GfUserRole;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.form.gf_user.LoginGfUserForm;
import com.fancoding.basic.project.form.gf_user.RegisterGfUserForm;
import com.fancoding.basic.project.form.gf_user.RetrieveForm;
import com.fancoding.basic.project.service.IGfUserGfUserRoleService;
import com.fancoding.basic.project.service.IGfUserInfoService;
import com.fancoding.basic.project.service.IGfUserRoleService;
import com.fancoding.basic.project.service.IGfUserService;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.UUIDUtils;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: caidaxing
 * @Date: 2022/01/19/15:07
 * @Description:
 */
@RestController
@Api(tags = "注册用户")
@AllArgsConstructor
@RequestMapping("/gf-user")
public class LoginController {

    private IGfUserService gfUserService;
    private IGfUserInfoService gfUserInfoService;
    private IGfUserRoleService  gfUserRoleService;
    private IGfUserGfUserRoleService gfUserGfUserRoleService;
    private MailClient mailClient;

    /**
     * 登录前台
     * @param loginGfUserForm
     * @return
     */
    @ApiOperation("登录前台")
    @PostMapping("/login/status")
    public ResultVo login(@Validated @RequestBody LoginGfUserForm loginGfUserForm) {
        UUIDUtils.print("登录表单信息：" + loginGfUserForm.toString());
        GfUser hasGfUser = gfUserService.getOne(new QueryWrapper<GfUser>().eq("username", loginGfUserForm.getUsername()));
        // 用户名不存在
        if (hasGfUser == null) {
            return ResultVoUtil.error("用户名不存在");
        }
        QueryWrapper<GfUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", loginGfUserForm.getUsername());
        queryWrapper.eq("password", hasGfUser.getPassword());
        GfUser gfUser = gfUserService.getOne(queryWrapper);
        if (gfUser == null) {
            return ResultVoUtil.error("用户名或密码错误");
        }
        // 判断密码是否正确
        if (!(new BCryptPasswordEncoder().matches(loginGfUserForm.getPassword(), gfUser.getPassword())
                || loginGfUserForm.getPassword().equals(gfUser.getPassword()))) {
            return ResultVoUtil.error("密码错误");
        }
        // 是否权限正确
        GfUserGfUserRole roles = gfUserGfUserRoleService.getOne(new QueryWrapper<GfUserGfUserRole>().eq("uid", gfUser.getId()).eq("rid", loginGfUserForm.getRole()));
        if (roles == null) {
            return ResultVoUtil.error("用户名或密码错误");
        }
        // 账户正常
        if (gfUser.getStatus() == 1){
            return ResultVoUtil.error("该账户被锁定");
        }

        return ResultVoUtil.success(gfUser);
    }

    /**
     * 注册用户
     * @param registerGfUserForm
     * @return
     */
    @ApiOperation("添加用户")
    @PostMapping("/register")
    public ResultVo addGfUser(@Validated @RequestBody RegisterGfUserForm registerGfUserForm){
        UUIDUtils.print("注册表单信息：" + registerGfUserForm.toString());
        // 表单密码重复判断
        if (!registerGfUserForm.getPassword().equals(registerGfUserForm.getRePassword())){
            return ResultVoUtil.error("两次密码不一致");
        }
        // 用户名已存在
        GfUser hasGfUser = gfUserService.getOne(new QueryWrapper<GfUser>().eq("username", registerGfUserForm.getUsername()));
        if(hasGfUser != null) {
            return ResultVoUtil.error("用户名已存在");
        }
        // 构建用户对象
        GfUser gfUser = new GfUser();
        gfUser.setUsername(registerGfUserForm.getUsername());
        // 密码加密
        String bCryptPassword = new BCryptPasswordEncoder().encode(registerGfUserForm.getPassword());
        gfUser.setPassword(bCryptPassword);
        // 用户唯一id
        gfUser.setId(UUIDUtils.getUuid());
        gfUser.setLoginDate(UUIDUtils.getTime().toLocalDateTime());
        gfUser.setGmtCreate(UUIDUtils.getTime().toLocalDateTime());
        gfUser.setStatus(0);
        if(gfUserService.save(gfUser)){
            UUIDUtils.print("新用户注册成功："+ gfUser);

            // 构建用户信息对象
            GfUserInfo gfUserInfo = new GfUserInfo();
            gfUserInfo.setUid(gfUser.getId());
            gfUserInfo.setNickname(registerGfUserForm.getUsername());
            gfUserInfo.setBirthday(registerGfUserForm.getBirthday());
            gfUserInfo.setGender(registerGfUserForm.getGender());
            gfUserInfo.setEmail(registerGfUserForm.getEmail());
            gfUserInfoService.save(gfUserInfo);

            // 构建用户权限信息对象
            GfUserGfUserRole gfUserGfUserRole = new GfUserGfUserRole();
            gfUserGfUserRole.setUid(gfUser.getId());
            // 普通用户
            gfUserGfUserRole.setRid(3);
            gfUserGfUserRoleService.save(gfUserGfUserRole);

            return ResultVoUtil.success();
        }else{
            return ResultVoUtil.error(ResultEnum.ADD_ERROR);
        }
    }

    /**
     * 找回密码
     * @param retrieveForm
     * @return
     */
    @ApiOperation("找回密码")
    @PostMapping("/retrieve")
    public ResultVo retrievePass(@Validated @RequestBody RetrieveForm retrieveForm){

        UUIDUtils.print("找回密码：" + retrieveForm.toString());
        GfUserInfo gfUserInfo = gfUserInfoService.selectByEmail(retrieveForm.getEmail());
        System.out.println(gfUserInfo);
        if(gfUserInfo == null) {
            return ResultVoUtil.error("抱歉！使用此Email用户不存在，不能使用找回密码功能！");
        }
        GfUser gfUser = gfUserService.selectByUserName(retrieveForm.getUsername());
        if (gfUser == null) {
            return ResultVoUtil.error("抱歉！您填写的账号资料不匹配，不能使用找回密码功能！");
        }
        mailClient.sendMail(
                gfUserInfo.getEmail(),
                "找回密码",
                "您好！您的论坛密码为" + gfUser.getPassword() + " 请查收");
        return ResultVoUtil.success();
    }

}
