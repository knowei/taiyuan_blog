package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 评论表
 *
 * @TableName blog_comment
 */
@TableName(value = "comment")
@Data
public class Comment {
    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
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
     * 评论内容
     */
    private String content;

    /**
     * 父评论ID（0表示一级评论）
     */
    private Long parentId;

    /**
     * 创建时间
     */
    private Date createTime;
}