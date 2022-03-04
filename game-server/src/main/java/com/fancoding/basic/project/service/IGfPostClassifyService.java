package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.form.gf_post_classify.AddPostClassifyForm;

import java.util.List;

/**
 * <p>
 * 帖子分类管理 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-07
 */
public interface IGfPostClassifyService extends IService<GfPostClassify> {

    /**
     * 获取帖子分类列表
     * @return
     */
    List<GfPostClassify> getAllPostClassify();

    /**
     * 通过帖子id查找帖子分类
     * @param id
     * @return
     */
    List<GfPostClassify> getPostClassifyOfPostId(Integer id);

    /**
     * 添加分类
     * @param postClassifyForm
     * @return
     */
    boolean addPostClassify(AddPostClassifyForm postClassifyForm);

    /**
     * 删除帖子分类
     * @param id
     */
    void deletePostClassify(Integer id);

    /**
     * 更新帖子分类信息
     * @param postClassifyForm
     * @return
     */
    boolean updatePostClassify(AddPostClassifyForm postClassifyForm);
}
