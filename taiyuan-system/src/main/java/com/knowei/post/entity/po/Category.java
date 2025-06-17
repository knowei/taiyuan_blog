package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;

/**
 * 文章分类表
 *
 * @TableName category
 */
@TableName(value = "category")
@Data
public class Category extends IdModel {

    /**
     * 分类名称
     */
    private String name;

    /**
     * 描述
     */
    private String description;

}