package com.fancoding.basic.project.service.impl;

import com.fancoding.basic.project.entity.GfGameType;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.exception.CustomException;
import com.fancoding.basic.project.form.gf_game_type.AddGameTypeForm;
import com.fancoding.basic.project.mapper.GfGameTypeMapper;
import com.fancoding.basic.project.service.IGfGameTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fancoding.basic.project.utils.MethodUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 游戏类型表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
@Service
@AllArgsConstructor
public class GfGameTypeServiceImpl extends ServiceImpl<GfGameTypeMapper, GfGameType> implements IGfGameTypeService {


    /**
     * 添加分类
     * @param gameTypeForm
     * @return
     */
    @Override
    public boolean addGameType(AddGameTypeForm gameTypeForm) {
        return save(gameTypeForm.buildEntity());
    }

    /**
     * 删除游戏分类
     * @param id
     */
    @Override
    public void deleteGameType(Integer id) {
        // 如果删除失败抛出异常。 -- 演示而已不推荐这样干
        if(!removeById(id)){
            throw new CustomException(ResultEnum.DELETE_ERROR, MethodUtil.getLineInfo());
        }
    }

    /**
     * 更新游戏分类信息
     * @param gameTypeForm
     * @return
     */
    @Override
    public boolean updateGameType(AddGameTypeForm gameTypeForm) {
        return updateById(gameTypeForm.buildEntity());
    }
}
