package com.knowei.post.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.knowei.common.response.PageResult;
import com.knowei.common.utils.ConvertUtils;
import com.knowei.post.entity.dto.CategoryAddDto;
import com.knowei.post.entity.dto.CategoryPageDto;
import com.knowei.post.entity.po.Category;
import com.knowei.post.entity.vo.CategoryVo;
import com.knowei.post.mapper.CategoryMapper;
import com.knowei.post.service.CategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author zheng
 * @description 针对表【blog_category(文章分类表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Override
    public List<CategoryVo> listCategory() {
        List<Category> list = this.list();
        return ConvertUtils.convertList(list, CategoryVo.class);
    }

    @Override
    public PageResult<CategoryVo> pageResult(CategoryPageDto dto) {
        Page<Category> page = new Page<>(dto.getPageNum(), dto.getPageSize());
        LambdaQueryWrapper<Category> qw = new LambdaQueryWrapper<>();

        if (dto.getName() != null) {
            qw.like(Category::getName, dto.getName());
        }

        Page<Category> result = this.page(page, qw);
        List<CategoryVo> categoryVos = ConvertUtils.convertList(result.getRecords(), CategoryVo.class);

        return new PageResult<>(result.getTotal(), categoryVos);
    }

    @Override
    public Boolean saveOrUpdate(CategoryAddDto dto) {
        if (dto.getId() != null) {
            Category category = new Category();
            BeanUtils.copyProperties(dto, category);
            return this.updateById(category);
        } else {
            Category category = new Category();
            BeanUtils.copyProperties(dto, category);
            return this.save(category);
        }
    }
}




