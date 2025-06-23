package com.knowei.post.service.impl;

import com.alibaba.fastjson2.util.DateUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowei.common.GlobalException;
import com.knowei.common.response.PageResult;
import com.knowei.common.utils.ConvertUtils;
import com.knowei.common.utils.StringUtils;
import com.knowei.post.entity.dto.PostAddDto;
import com.knowei.post.entity.dto.PostPageDto;
import com.knowei.post.entity.po.*;
import com.knowei.post.entity.vo.ArchiveVo;
import com.knowei.post.entity.vo.PostVo;
import com.knowei.post.mapper.PostMapper;
import com.knowei.post.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author zheng
 * @description 针对表【blog_post(博客文章表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
@Slf4j
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PostTagService postTagService;

    @Autowired
    private TagService tagService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private PostResourceService postResourceService;

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
            LambdaQueryWrapper<Comment> comqw = new LambdaQueryWrapper<>();
            comqw.eq(Comment::getPostId, id);
            long count = commentService.count(comqw);
            vo.setCommentCount(Math.toIntExact(count));
            list.add(vo);
        });

        return new PageResult<>(postPage.getTotal(), list);
    }

    @Override
    @Transactional
    public Boolean saveOrUpdate(PostAddDto postAddDto) {
        Post blogPost = new Post();
        if (postAddDto.getId() == null) {
            // 保存
            BeanUtils.copyProperties(postAddDto, blogPost);
            blogPost.setIsResource(postAddDto.getIsUrl());
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

            if ("1".equals(postAddDto.getIsUrl())) {
                PostResource resource = new PostResource();
                BeanUtils.copyProperties(postAddDto, resource);
                resource.setPostId(postId);
                resource.setId(null);
                postResourceService.save(resource);
            }

            return true;
        } else {
            //更新
            BeanUtils.copyProperties(postAddDto, blogPost);
            blogPost.setIsResource(postAddDto.getIsUrl());
            Long postId = blogPost.getId();

            postTagService.remove(new LambdaQueryWrapper<PostTag>().eq(PostTag::getPostId, postId));
            List<Long> tagIds = postAddDto.getTagIds();
            for (Long tagId : tagIds) {
                PostTag postTag = new PostTag();
                postTag.setPostId(postId);
                postTag.setTagId(tagId);
                postTagService.save(postTag);
            }
            if ("1".equals(postAddDto.getIsUrl())) {
                PostResource postResource = postResourceService.getOne(
                    new LambdaQueryWrapper<PostResource>().eq(PostResource::getPostId, postId));

                postResource.setUrl(postAddDto.getUrl());
                postResource.setOpenPassword(postAddDto.getOpenPassword());
                postResource.setDecompressionPassword(postAddDto.getDecompressionPassword());

                postResourceService.updateById(postResource);
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

        PostResource postResource =
            postResourceService.getOne(new LambdaQueryWrapper<PostResource>().eq(PostResource::getPostId, id));

        if (postResource != null) {
            postVo.setUrl(postResource.getUrl());
            postVo.setOpenPassword(postResource.getOpenPassword());
            postVo.setDecompressionPassword(postResource.getDecompressionPassword());
            postVo.setIsUrl("1");
        } else {
            postVo.setIsUrl("0");
        }

        return postVo;
    }

    /**
     * 归档
     *
     * @return
     */
    @Override
    public List<ArchiveVo> archive() {
        List<Post> list = this.list(
            new LambdaQueryWrapper<Post>().select(Post::getId, Post::getCreateTime, Post::getTitle)
                .eq(Post::getStatus, "1"));
        Map<Date, List<Post>> map = list.stream().collect(Collectors.groupingBy(Post::getCreateTime));
        log.info("map:{}", map);

        List<ArchiveVo> archiveVos = new ArrayList<>();
        for (Map.Entry<Date, List<Post>> entry : map.entrySet()) {
            ArchiveVo archiveVo = new ArchiveVo();
            archiveVo.setYear(DateUtils.format(entry.getKey(), "yyyy"));
            archiveVo.setPostList(ConvertUtils.convertList(entry.getValue(), PostVo.class));
            archiveVos.add(archiveVo);
        }
        return archiveVos;
    }

    /**
     * 根据分类id查询
     *
     * @param id
     * @return
     */
    @Override
    public List<PostVo> getCategoryById(Long id) {
        LambdaQueryWrapper<Post> qw = new LambdaQueryWrapper<Post>();
        qw.eq(Post::getCategoryId, id);
        qw.eq(Post::getStatus, "1");
        List<Post> list = this.list(qw);

        List<PostVo> postVos = ConvertUtils.convertList(list, PostVo.class);
        postVos.forEach(item -> {
            LambdaQueryWrapper<Comment> comqw = new LambdaQueryWrapper<>();
            comqw.eq(Comment::getPostId, item.getId());
            long count = commentService.count(comqw);
            item.setCommentCount(Math.toIntExact(count));
        });

        return postVos;
    }

    @Override
    public List<PostVo> getTagById(Long id) {
        List<PostTag> postTagList = postTagService.list(new LambdaQueryWrapper<PostTag>().eq(PostTag::getTagId, id));
        List<Long> postId = postTagList.stream().map(PostTag::getPostId).collect(Collectors.toList());

        List<Post> posts = this.listByIds(postId);
        List<Post> resultPost =
            posts.stream().filter(item -> "1".equals(item.getStatus())).collect(Collectors.toList());

        List<PostVo> postVos = ConvertUtils.convertList(resultPost, PostVo.class);
        postVos.forEach(item -> {
            LambdaQueryWrapper<Comment> comqw = new LambdaQueryWrapper<>();
            comqw.eq(Comment::getPostId, item.getId());
            long count = commentService.count(comqw);
            item.setCommentCount(Math.toIntExact(count));
        });

        return postVos;
    }

}




