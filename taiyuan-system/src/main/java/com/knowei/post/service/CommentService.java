package com.knowei.post.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowei.post.entity.dto.CommentAddDto;
import com.knowei.post.entity.po.Comment;
import com.knowei.post.entity.vo.CommentVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author zheng
 * @description 针对表【blog_comment(评论表)】的数据库操作Service
 * @createDate 2025-05-23 17:02:10
 */
public interface CommentService extends IService<Comment> {

    /**
     * 获取评论列表
     *
     * @param postId
     * @return
     */
    List<CommentVo> getCommentList(Long postId);

    /**
     * 新增评论
     *
     * @param commentAddDto
     * @return
     */
    Boolean addComment(CommentAddDto commentAddDto, HttpServletRequest request);

}
