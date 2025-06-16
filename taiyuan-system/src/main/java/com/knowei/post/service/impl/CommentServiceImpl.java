package com.knowei.post.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowei.post.entity.po.Comment;
import com.knowei.post.mapper.CommentMapper;
import com.knowei.post.service.CommentService;
import org.springframework.stereotype.Service;

/**
 * @author zheng
 * @description 针对表【blog_comment(评论表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}




