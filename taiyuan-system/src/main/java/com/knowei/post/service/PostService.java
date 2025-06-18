package com.knowei.post.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowei.common.response.PageResult;
import com.knowei.post.entity.dto.PostAddDto;
import com.knowei.post.entity.dto.PostPageDto;
import com.knowei.post.entity.po.Post;
import com.knowei.post.entity.vo.ArchiveVo;
import com.knowei.post.entity.vo.PostVo;

import java.util.List;

/**
 * @author zheng
 * @description 针对表【blog_post(博客文章表)】的数据库操作Service
 * @createDate 2025-05-23 17:02:10
 */
public interface PostService extends IService<Post> {

    PageResult<PostVo> pageResult(PostPageDto dto);

    /**
     * 添加或更新
     *
     * @param postAddDto
     * @return
     */
    Boolean saveOrUpdate(PostAddDto postAddDto);

    PostVo getPostVo(Long postId);

    /**
     * 归档
     *
     * @return
     */
    List<ArchiveVo> archive();

    List<PostVo> getCategoryById(Long id);

    List<PostVo> getTagById(Long id);
}
