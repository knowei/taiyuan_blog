package com.knowei.post.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowei.common.GlobalException;
import com.knowei.common.response.PageResult;
import com.knowei.common.utils.StringUtils;
import com.knowei.post.entity.dto.PostAddDto;
import com.knowei.post.entity.dto.PostPageDto;
import com.knowei.post.entity.po.Post;
import com.knowei.post.entity.po.PostTag;
import com.knowei.post.entity.po.Tag;
import com.knowei.post.entity.vo.PostVo;
import com.knowei.post.mapper.PostMapper;
import com.knowei.post.service.CategoryService;
import com.knowei.post.service.PostService;
import com.knowei.post.service.PostTagService;
import com.knowei.post.service.TagService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zheng
 * @description 针对表【blog_post(博客文章表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PostTagService postTagService;

    @Autowired
    private TagService tagService;
    ;

    /**
     * 分页查询
     *
     * @param dto
     * @return
     */
    @Override
    public PageResult<PostVo> pageResult(PostPageDto dto) {
        List<PostVo> list = new ArrayList<>();

        //分页获取
        Page<Post> page = new Page<>(dto.getPageNum(), dto.getPageSize());
        LambdaQueryWrapper<Post> qw = new LambdaQueryWrapper<>();

        if (StringUtils.isNotEmpty(dto.getTitle())) {
            qw.like(Post::getTitle, dto.getTitle());
        }

        if (StringUtils.isNotEmpty(dto.getStatus())) {
            qw.eq(Post::getStatus, dto.getStatus());
        }

        Page<Post> postPage = this.page(page, qw);
        postPage.getRecords().forEach(item -> {
            PostVo vo = new PostVo();
            BeanUtils.copyProperties(item, vo);
            Long id = item.getId();
            //获取标签名称
            List<PostTag> postTags = postTagService.list(new LambdaQueryWrapper<PostTag>().eq(PostTag::getPostId, id));
            List<Long> tagIds = postTags.stream().map(e -> {
                Long tagId = e.getTagId();
                Tag tag = tagService.getById(tagId);
                return tag.getId();
            }).collect(Collectors.toList());
            vo.setTagIds(tagIds);
            list.add(vo);
        });

        return new PageResult<>(postPage.getTotal(), list);
    }

    @Override
    public Boolean saveOrUpdate(PostAddDto postAddDto) {
        Post blogPost = new Post();
        if (postAddDto.getId() == null) {
            // 保存
            BeanUtils.copyProperties(postAddDto, blogPost);
            boolean save = this.save(blogPost);
            if (!save) {
                throw new GlobalException("保存失败");
            }

            List<Long> tagIds = postAddDto.getTagIds();
            Long postId = blogPost.getId();
            for (Long tagId : tagIds) {
                PostTag postTag = new PostTag();
                postTag.setPostId(postId);
                postTag.setTagId(tagId);
                postTagService.save(postTag);
            }
            return true;
        } else {
            //更新
            BeanUtils.copyProperties(postAddDto, blogPost);
            Long postId = blogPost.getId();

            postTagService.remove(new LambdaQueryWrapper<PostTag>().eq(PostTag::getPostId, postId));
            List<Long> tagIds = postAddDto.getTagIds();
            for (Long tagId : tagIds) {
                PostTag postTag = new PostTag();
                postTag.setPostId(postId);
                postTag.setTagId(tagId);
                postTagService.save(postTag);
            }
            return this.updateById(blogPost);
        }
    }

    /**
     * 根据postId获取文章详情
     *
     * @param postId
     * @return
     */
    @Override
    public PostVo getPostVo(Long postId) {
        Post post = this.getById(postId);
        PostVo postVo = new PostVo();
        BeanUtils.copyProperties(post, postVo);

        Long id = post.getId();

        //获取标签名称
        List<PostTag> postTags = postTagService.list(new LambdaQueryWrapper<PostTag>().eq(PostTag::getPostId, id));
        List<Long> tagIds = postTags.stream().map(e -> {
            Long tagId = e.getTagId();
            Tag tag = tagService.getById(tagId);
            return tag.getId();
        }).collect(Collectors.toList());
        postVo.setTagIds(tagIds);
        return postVo;
    }

}




