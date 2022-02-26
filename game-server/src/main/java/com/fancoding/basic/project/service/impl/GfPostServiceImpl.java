package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.fancoding.basic.project.entity.GfPost;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.form.gf_post.AddPostForm;
import com.fancoding.basic.project.mapper.GfPostMapper;
import com.fancoding.basic.project.service.IGfPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 帖子表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-02
 */
@Service
@AllArgsConstructor
public class GfPostServiceImpl extends ServiceImpl<GfPostMapper, GfPost> implements IGfPostService {

    private GfPostMapper gfPostMapper;



    @Override
    public List<GfPost> listPost() {
        return gfPostMapper.listPost();
    }

    @Override
    public List<GfPost> findByPostClassify(String classify) {
        return gfPostMapper.findByClassify(classify);
    }


    /**
     * 添加帖子
     * @param gfPost 表单数据
     * @return
     */
    @Override
    public int addPost(GfPost gfPost) {
        return gfPostMapper.insert(gfPost);
    }

    /**
     * 获取对应标签的帖子
     * @param tag
     * @return
     */
    @Override
    public List<GfPost> findByPostTag(String tag) {
        return gfPostMapper.findByTag(tag);
    }

    /**
     * 按帖子名模糊查询帖子列表
     * @param title
     * @return
     */
    @Override
    public List<GfPost> getPostListOfLikeTitle(String title) {
        return gfPostMapper.selectList(new QueryWrapper<GfPost>().like(
                "title", title
        ));
    }

    /**
     * 收藏了的帖子
     * @param id
     * @return
     */
    @Override
    public List<GfPost> getPostListOfCollect(String id) {
        return gfPostMapper.getPostListOfCollect(id);
    }

    /**
     * 自己发布的帖子
     * @param id
     * @return
     */
    @Override
    public List<GfPost> listPostOfMe(String id) {
        return gfPostMapper.selectList(
                new QueryWrapper<GfPost>()
                        .eq("author_id", id));
    }

    /**
     * 删除帖子
     * @param id
     * @return
     */
    @Override
    public boolean deletePost(Integer id) {
        return gfPostMapper.deleteById(id) == 1;
    }

    /**
     * 状态修改
     * @param id
     * @param status
     */
    @Override
    public boolean changePostStatus(Integer id, Integer status) {
        return gfPostMapper.update(null,
                new UpdateWrapper<GfPost>()
                        .eq("id", id)
                        .set("status", status)) == 1;
    }
}
