package com.knowei.post.entity.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.IdModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @TableName post_resource
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value = "post_resource")
@Data
public class PostResource extends IdModel {
    /**
     * 文章id
     */
    private Long postId;
    /**
     * 百度网盘，夸克，123网盘
     */
    private String url;

    /**
     * 提取密码
     */
    private String openPassword;

    /**
     * 解压密码
     */
    private String decompressionPassword;
}