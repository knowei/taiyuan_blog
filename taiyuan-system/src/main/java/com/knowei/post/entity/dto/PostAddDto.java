package com.knowei.post.entity.dto;

import lombok.Data;

import java.util.List;

/**
 * 博客文章表
 *
 * @TableName blog_post
 */
@Data
public class PostAddDto {
    /**
     * 主键ID
     */
    private Long id;

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
     * 分类名称
     */
    private Long categoryId;

    /**
     * 标签名称
     */
    private List<Long> tagIds;

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

}