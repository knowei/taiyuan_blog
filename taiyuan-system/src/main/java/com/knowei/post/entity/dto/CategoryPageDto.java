package com.knowei.post.entity.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.knowei.common.request.PageRequest;
import lombok.Data;

import java.util.Date;

/**
 * 文章分类表
 *
 * @TableName category
 */
@Data
public class CategoryPageDto extends PageRequest {

    /**
     * 分类名称
     */
    private String name;
}