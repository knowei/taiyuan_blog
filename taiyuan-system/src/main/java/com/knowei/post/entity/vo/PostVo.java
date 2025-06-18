package com.knowei.post.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 博客文章表
 *
 * @TableName blog_post
 */
@Data
public class PostVo {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 作者ID（关联 sys_user.id）
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
     * 封面图片
     */
    private String coverImage;

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

    /**
     * 评论数
     */
    private Integer commentCount;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}