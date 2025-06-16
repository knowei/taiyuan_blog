package com.knowei.post.entity.vo;

import lombok.Data;

/**
 * 文章分类表
 *
 * @TableName category
 */
@Data
public class CategoryVo {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 分类名称
     */
    private String name;

    /**
     * 描述
     */
    private String description;

}