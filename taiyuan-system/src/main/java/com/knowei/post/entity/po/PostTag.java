package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 文章标签关联表
 *
 * @TableName blog_post_tag
 */
@TableName(value = "post_tag")
@Data
public class PostTag {

    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 文章ID（关联 blog_post.id）
     */
    private Long postId;

    /**
     * 标签ID（关联 blog_tag.id）
     */
    private Long tagId;
}