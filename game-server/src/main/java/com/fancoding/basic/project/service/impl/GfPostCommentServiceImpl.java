package com.fancoding.basic.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.fancoding.basic.project.entity.GfPost;
import com.fancoding.basic.project.entity.GfPostComment;
import com.fancoding.basic.project.mapper.GfPostCommentMapper;
import com.fancoding.basic.project.service.IGfPostCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * <p>
 * 帖子/游戏评论表 服务实现类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-11
 */
@Service
@AllArgsConstructor
public class GfPostCommentServiceImpl extends ServiceImpl<GfPostCommentMapper, GfPostComment> implements IGfPostCommentService {

    private GfPostCommentMapper gfPostCommentMapper;

    /**
     * 提交评论
     * @param comment
     * @return
     */
    @Override
    public boolean addComment(GfPostComment comment) {
        return gfPostCommentMapper.insert(comment) == 1;
    }



    /**
     * 删除评论
     * @param id
     * @return
     */
    @Override
    public boolean deleteComment(Integer id) {
        return gfPostCommentMapper.deleteById(id) == 1;
    }

    /**
     * 获取所有评论列表 (可查看-审核通过)
     * @return
     */
    @Override
    public List<GfPostComment> allComment() {
        return gfPostCommentMapper.selectList(new QueryWrapper<GfPostComment>().eq("status", 1));
    }

    /**
     * 获得指定游戏ID的评论列表
     * @param id
     * @return
     */
    @Override
    public List<GfPostComment> commentOfGameId(Integer id) {
        return gfPostCommentMapper.selectList(new QueryWrapper<GfPostComment>().eq("status", 1).eq("comment_id", id).eq("type", 1));
    }

    /**
     * 获得指定帖子ID的评论列表
     * @param id
     * @return
     */
    @Override
    public List<GfPostComment> commentOfPostId(Integer id) {
        return gfPostCommentMapper.selectList(
                new QueryWrapper<GfPostComment>()
                        .eq("status", 1)
                        .eq("comment_id", id)
                        .eq("type", 0));
    }

    /**
     * 更新指定游戏ID的评论列表点赞数目
     * @param type
     * @param id
     * @return
     */
    @Override
    public boolean updateCommentNumberOfLikes(Integer type, Integer id) {
        return gfPostCommentMapper.updateCommentNumberOfLikes(type, id);
    }

    /**
     * 状态修改
     * @param id
     * @param status
     * @return
     */
    @Override
    public boolean changeCommentStatus(Integer id, Integer status) {
        return gfPostCommentMapper.update(null,
                new UpdateWrapper<GfPostComment>()
                        .eq("id", id)
                        .set("status", status)) == 1;
    }

    /**
     * 自己发布的帖子下的评论
     * @param id
     * @return
     */
    @Override
    public List<GfPostComment> selectOfCommentOfMe(String id) {
        return gfPostCommentMapper.selectOfCommentOfMe(id);
    }


}
