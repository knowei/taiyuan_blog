package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;

/**
 * 标签表
 *
 * @TableName blog_tag
 */
@TableName(value = "tag")
@Data
public class Tag extends IdModel {

    /**
     * 标签名
     */
    private String name;

}