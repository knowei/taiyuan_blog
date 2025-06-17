package com.knowei.post.entity.dto;

import lombok.Data;

/**
 * 评论
 */
@Data
public class CommentAddDto {

    private Long id;
    /**
     * 文章ID（关联 blog_post.id）
     */
    private Long postId;

    /**
     * 用户ID（关联 blog_user.id）
     */
    private Long userId;

    private String nickName;

    /**
     * @的用户
     */
    private Long replyUserId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 父评论ID（0表示一级评论）
     */
    private Long parentId;

}