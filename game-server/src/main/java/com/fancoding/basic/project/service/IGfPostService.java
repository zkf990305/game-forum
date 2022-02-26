package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPost;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.form.gf_post.AddPostForm;

import java.util.List;

/**
 * <p>
 * 帖子表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-02
 */
public interface IGfPostService extends IService<GfPost> {



    /**
     * 获取帖子列表
     * @return
     */
    List<GfPost> listPost();

    /**
     * 获取对应类型的帖子
     * @param classify
     * @return
     */
    List<GfPost> findByPostClassify(String classify);

    /**
     * 添加帖子
     * @param gfPost
     * @return
     */
    int addPost(GfPost gfPost);

    /**
     * 获取对应标签的帖子
     * @param tag
     * @return
     */
    List<GfPost> findByPostTag(String tag);

    /**
     * 按帖子名模糊查询帖子列表
     * @param title
     * @return
     */
    List<GfPost> getPostListOfLikeTitle(String title);

    /**
     * 收藏了的帖子
     * @param id
     * @return
     */
    List<GfPost> getPostListOfCollect(String id);

    /**
     * 自己发布的帖子
     * @param id
     * @return
     */
    List<GfPost> listPostOfMe(String id);

    /**
     * 删除帖子
     * @param id
     * @return
     */
    boolean deletePost(Integer id);

    /**
     * 状态修改
     * @param id
     * @param status
     * @return
     */
    boolean changePostStatus(Integer id, Integer status);
}
