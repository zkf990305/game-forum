package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fancoding.basic.project.entity.GfPostClassify;
import com.fancoding.basic.project.entity.GfPostTag;
import com.fancoding.basic.project.enums.ResultEnum;
import com.fancoding.basic.project.exception.CustomException;
import com.fancoding.basic.project.form.gf_post_tag.AddPostTagForm;
import com.fancoding.basic.project.mapper.GfPostTagMapper;
import com.fancoding.basic.project.service.IGfPostTagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fancoding.basic.project.utils.MethodUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 帖子标签 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-08
 */
@Service
@AllArgsConstructor
public class GfPostTagServiceImpl extends ServiceImpl<GfPostTagMapper, GfPostTag> implements IGfPostTagService {

    private GfPostTagMapper  gfPostTagMapper;
    /**
     * 获取标签列表
     * @return
     */
    @Override
    public List<GfPostTag> getAllPostTag() {
        return gfPostTagMapper.selectList(new QueryWrapper<>());
    }

    /**
     * 通过帖子id查找帖子标签
     * @param id
     * @return
     */
    @Override
    public List<GfPostTag> getPostTagOfPostId(Integer id) {
        return gfPostTagMapper.getPostTagOfPostId(id);
    }

    /**
     * 添加分类
     * @param postTagForm
     * @return
     */
    @Override
    public boolean addPostTag(AddPostTagForm postTagForm) {
        return save(postTagForm.buildEntity());
    }

    /**
     * 删除帖子标签
     * @param id
     */
    @Override
    public void deletePostTag(Integer id) {
        // 如果删除失败抛出异常。 -- 演示而已不推荐这样干
        if(!removeById(id)){
            throw new CustomException(ResultEnum.DELETE_ERROR, MethodUtil.getLineInfo());
        }
    }

    /**
     * 更新帖子标签信息
     * @param postTagForm
     * @return
     */
    @Override
    public boolean updatePostTag(AddPostTagForm postTagForm) {
        return updateById(postTagForm.buildEntity());
    }
}
