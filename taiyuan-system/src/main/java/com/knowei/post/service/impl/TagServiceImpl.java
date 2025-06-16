package com.knowei.post.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowei.common.response.PageResult;
import com.knowei.common.utils.ConvertUtils;
import com.knowei.common.utils.bean.BeanUtils;
import com.knowei.post.entity.dto.TagAddDto;
import com.knowei.post.entity.dto.TagPageDto;
import com.knowei.post.entity.po.Tag;
import com.knowei.post.entity.vo.TagVo;
import com.knowei.post.mapper.TagMapper;
import com.knowei.post.service.TagService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zheng
 * @description 针对表【blog_tag(标签表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {

    @Override
    public List<TagVo> listTag() {
        List<Tag> list = this.list();
        return ConvertUtils.convertList(list, TagVo.class);
    }

    @Override
    public PageResult<TagVo> pageResult(TagPageDto dto) {
        Page<Tag> tagPage = new Page<>(dto.getPageNum(), dto.getPageSize());
        LambdaQueryWrapper<Tag> qw = new LambdaQueryWrapper<>();

        Page<Tag> result = this.page(tagPage, qw);
        List<TagVo> tagVos = ConvertUtils.convertList(result.getRecords(), TagVo.class);

        return new PageResult<>(result.getTotal(), tagVos);
    }

    @Override
    public Boolean saveOrUpdate(TagAddDto dto) {
        if (dto.getId() != null) {
            Tag tag = new Tag();
            BeanUtils.copyProperties(dto, tag);
            return this.updateById(tag);
        } else {
            Tag tag = new Tag();
            BeanUtils.copyProperties(dto, tag);
            return this.save(tag);
        }
    }
}




