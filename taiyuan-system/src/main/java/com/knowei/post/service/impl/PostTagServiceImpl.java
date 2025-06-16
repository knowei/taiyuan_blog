package com.knowei.post.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowei.post.entity.po.PostTag;
import com.knowei.post.mapper.PostTagMapper;
import com.knowei.post.service.PostTagService;
import org.springframework.stereotype.Service;

/**
 * @author zheng
 * @description 针对表【blog_post_tag(文章标签关联表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
public class PostTagServiceImpl extends ServiceImpl<PostTagMapper, PostTag> implements PostTagService {

}




