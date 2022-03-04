package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.form.gf_post_tag.AddPostTagForm;

import java.util.List;

/**
 * <p>
 * 帖子标签 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
public interface IGfPostTagService extends IService<GfPostTag> {

    /**
     * 获取标签列表
     * @return
     */
    List<GfPostTag> getAllPostTag();

    /**
     * 通过帖子id查找帖子标签
     * @param id
     * @return
     */
    List<GfPostTag> getPostTagOfPostId(Integer id);

    /**
     * 添加分类
     * @param postTagForm
     * @return
     */
    boolean addPostTag(AddPostTagForm postTagForm);

    /**
     * 删除帖子标签
     * @param id
     */
    void deletePostTag(Integer id);

    /**
     * 更新帖子标签信息
     * @param postTagForm
     * @return
     */
    boolean updatePostTag(AddPostTagForm postTagForm);
}
