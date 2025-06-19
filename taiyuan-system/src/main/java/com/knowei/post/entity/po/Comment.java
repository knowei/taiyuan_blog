package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 评论表
 *
 * @TableName blog_comment
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value = "comment")
@Data
public class Comment extends IdModel {

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
     * 操作系统名称
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

}