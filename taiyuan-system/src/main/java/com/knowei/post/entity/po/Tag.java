package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 标签表
 *
 * @TableName blog_tag
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value = "tag")
@Data
public class Tag extends IdModel {

    /**
     * 标签名
     */
    private String name;

}