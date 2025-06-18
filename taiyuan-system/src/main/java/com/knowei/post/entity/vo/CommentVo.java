package com.knowei.post.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 评论表
 *
 * @TableName blog_comment
 */
@Data
public class CommentVo {

    private Long id;
    /**
     * 文章ID（关联 blog_post.id）
     */
    private Long postId;

    /**
     * 用户ID（关联 blog_user.id）
     */
    private Long userId;

    /**
     * @的用户
     */
    private Long replyUserId;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 头像
     */
    private String authorImg;

    /**
     * IP
     */
    private String ip;

    /**
     * 浏览器名称
     */
    private String browserName;

    /**
     * os
     */
    private String osName;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 父评论ID（0表示一级评论）
     */
    private Long parentId;

    /**
     * 点赞数
     */
    private Integer likeCount;

    /**
     * 子评论
     */
    private List<CommentVo> children;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
}