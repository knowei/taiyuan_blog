package com.knowei.post.entity.dto;

import lombok.Data;

@Data
public class TagAddDto {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 标签名
     */
    private String name;
}
