package com.knowei.post.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowei.common.response.PageResult;
import com.knowei.post.entity.dto.TagAddDto;
import com.knowei.post.entity.dto.TagPageDto;
import com.knowei.post.entity.po.Tag;
import com.knowei.post.entity.vo.TagVo;

import java.util.List;

/**
 * @author zheng
 * @description 针对表【blog_tag(标签表)】的数据库操作Service
 * @createDate 2025-05-23 17:02:10
 */
public interface TagService extends IService<Tag> {

    List<TagVo> listTag();

    PageResult<TagVo> pageResult(TagPageDto dto);

    Boolean saveOrUpdate(TagAddDto tag);

}
