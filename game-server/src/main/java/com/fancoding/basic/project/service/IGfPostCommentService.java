package com.fancoding.basic.project.service;

import com.fancoding.basic.project.entity.GfPostComment;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 帖子/游戏评论表 服务类
 * </p>
 *
 * @author fancoding
 * @since 2022-02-11
 */
public interface IGfPostCommentService extends IService<GfPostComment> {

    /**
     * 提交评论
     * @param comment
     * @return
     */
    boolean addComment(GfPostComment comment);

    /**
     * 删除评论
     * @param id
     * @return
     */
    boolean deleteComment(Integer id);

    /**
     * 获取所有评论列表
     * @return
     */
    List<GfPostComment> allComment();

    /**
     * 获得指定游戏ID的评论列表
     * @param id
     * @return
     */
    List<GfPostComment> commentOfGameId(Integer id);

    /**
     * 获得指定帖子ID的评论列表
     * @param id
     * @return
     */
    List<GfPostComment> commentOfPostId(Integer id);


    /**
     * 更新指定游戏ID的评论列表点赞数目
     * @param id
     * @return
     */
    boolean updateCommentNumberOfLikes(Integer type, Integer id);

    /**
     * 状态修改
     * @param id
     * @param status
     * @return
     */
    boolean changeCommentStatus(Integer id, Integer status);
}
