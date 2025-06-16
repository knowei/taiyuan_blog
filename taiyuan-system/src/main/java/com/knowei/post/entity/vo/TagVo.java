package com.knowei.post.entity.vo;

import lombok.Data;

/**
 * 标签表
 *
 * @TableName blog_tag
 */
@Data
public class TagVo {
    private Long id;

    /**
     * 标签名
     */
    private String name;

}