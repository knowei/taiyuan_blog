package com.knowei.post.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowei.common.response.PageResult;
import com.knowei.post.entity.dto.CategoryAddDto;
import com.knowei.post.entity.dto.CategoryPageDto;
import com.knowei.post.entity.po.Category;
import com.knowei.post.entity.vo.CategoryVo;

import java.util.List;

/**
 * @author zheng
 * @description 针对表【blog_category(文章分类表)】的数据库操作Service
 * @createDate 2025-05-23 17:02:10
 */
public interface CategoryService extends IService<Category> {

    List<CategoryVo> listCategory();

    PageResult<CategoryVo> pageResult(CategoryPageDto dto);

    Boolean saveOrUpdate(CategoryAddDto tag);
}
