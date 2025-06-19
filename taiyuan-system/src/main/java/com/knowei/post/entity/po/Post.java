package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 博客文章表
 *
 * @TableName blog_post
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value = "post")
@Data
public class Post extends IdModel {
    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 作者ID（关联 blog_user.id）
     */
    private Long userId;

    /**
     * 标题
     */
    private String title;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 内容
     */
    private String content;

    /**
     * 分类ID（关联 blog_category.id）
     */
    private Long categoryId;

    /**
     * 封面图片
     */
    private String coverImage;

    /**
     * 浏览量
     */
    private Integer viewCount;

    /**
     * 点赞数
     */
    private Integer likeCount;

    /**
     * 状态（0草稿，1发布）
     */
    private String status;

    /**
     * 是否置顶（0否，1是）
     */
    private Integer isTop;

    /**
     * 是否为资源贴（0否，1是）
     */
    private String isResource;
}