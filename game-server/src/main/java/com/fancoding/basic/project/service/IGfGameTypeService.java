package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfGameType;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.form.gf_game_type.AddGameTypeForm;

/**
 * <p>
 * 游戏类型表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-01-26
 */
public interface IGfGameTypeService extends IService<GfGameType> {

    /**
     * 添加分类
     * @param gameTypeForm
     * @return
     */
    boolean addGameType(AddGameTypeForm gameTypeForm);

    /**
     * 删除游戏分类
     * @param id
     */
    void deleteGameType(Integer id);

    /**
     * 更新游戏分类信息
     * @param gameTypeForm
     * @return
     */
    boolean updateGameType(AddGameTypeForm gameTypeForm);
}
