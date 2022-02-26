package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fancoding.basic.project.utils.vo.GfUserVo;
import com.fancoding.basic.project.utils.vo.InfoVo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-01-19
 */
@Repository
public interface GfUserMapper extends BaseMapper<GfUser> {

    /**
     * 返回所有用户
     * @return
     */
    List<GfUserVo> getAllUser();

    /**
     * 个人信息
     * @param id
     * @return
     */
    InfoVo getGfUserByUserId(String id);
}
