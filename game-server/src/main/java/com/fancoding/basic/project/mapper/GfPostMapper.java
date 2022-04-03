package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfPost;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.form.gf_post.AddPostForm;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 帖子表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-02-02
 */
@Repository
public interface GfPostMapper extends BaseMapper<GfPost> {

    /**
     * 获取全部帖子
     * @return
     */
    List<GfPost> listPost();

    /**
     *  获取对应分类的帖子
     * @param classify
     * @return
     */
    List<GfPost> findByClassify(String classify);

    /**
     * 获取对应标签的帖子
     * @param tag
     * @return
     */
    List<GfPost> findByTag(String tag);

    /**
     * 收藏了的帖子
     * @param id
     * @return
     */
    List<GfPost> getPostListOfCollect(String id);

    /**
     * 获取帖子列表-随机八条
     * @return
     */
    List<GfPost> listPostOfRound();

    /**
     * 获取帖子列表-最新八条
     * @return
     */
    List<GfPost> listPostOfUpToDate();

    /**
     * 获取帖子列表-加精八条
     * @return
     */
    List<GfPost> listPostOfTop();

    /**
     * 获取帖子列表-加精八条
     * @return
     */
    List<GfPost> listPostOfRefined();
}
