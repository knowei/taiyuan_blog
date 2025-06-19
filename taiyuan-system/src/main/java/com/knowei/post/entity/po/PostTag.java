package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文章标签关联表
 *
 * @TableName blog_post_tag
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value = "post_tag")
@Data
public class PostTag extends IdModel {
    /**
     * 文章ID（关联 blog_post.id）
     */
    private Long postId;

    /**
     * 标签ID（关联 blog_tag.id）
     */
    private Long tagId;
}