package com.knowei.post.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowei.common.utils.ConvertUtils;
import com.knowei.common.utils.bean.BeanUtils;
import com.knowei.common.utils.ip.IpUtils;
import com.knowei.post.entity.dto.CommentAddDto;
import com.knowei.post.entity.po.Comment;
import com.knowei.post.entity.vo.CommentVo;
import com.knowei.post.mapper.CommentMapper;
import com.knowei.post.service.CommentService;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author zheng
 * @description 针对表【blog_comment(评论表)】的数据库操作Service实现
 * @createDate 2025-05-23 17:02:10
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    @Override
    public List<CommentVo> getCommentList(Long postId) {
        LambdaQueryWrapper<Comment> qw = new LambdaQueryWrapper<>();
        qw.eq(Comment::getPostId, postId);

        // 先全部查询出来
        List<Comment> list = this.list(qw);

        //构建树形结构，先把parent_id=0查询出来，单独放入一个list，并且构建一个map<Comment,List<Comment>，
        // 然后遍历所有的parent_id!=0的，判断parent_id是不是在map中，放入List之中，然后根据评论的时间
        //排序

        List<Comment> topLevelComment = new ArrayList<Comment>();
        Map<Long, List<Comment>> childrenMap = new HashMap<>();
        List<CommentVo> result = new ArrayList<>();

        for (Comment comment : list) {
            if (comment.getParentId() == 0) {
                topLevelComment.add(comment);
            } else {
                List<Comment> comments = childrenMap.get(comment.getParentId());
                if (comments == null) {
                    comments = new ArrayList<>();
                }
                comments.add(comment);
                childrenMap.put(comment.getParentId(), comments);
            }
        }

        for (Comment comment : topLevelComment) {
            CommentVo commentVo = ConvertUtils.convertVO(comment, CommentVo.class);
            List<Comment> comments = childrenMap.get(commentVo.getId());
            if (CollectionUtils.isNotEmpty(comments)) {
                List<CommentVo> commentVos = ConvertUtils.convertList(comments, CommentVo.class);
                Collections.sort(commentVos, Comparator.comparing(CommentVo::getCreateTime));
                commentVo.setChildren(commentVos);
            }
            result.add(commentVo);
        }

        return result;

    }

    /**
     * 新增评论
     *
     * @param commentAddDto
     * @return
     */
    @Override
    public Boolean addComment(CommentAddDto commentAddDto, HttpServletRequest request) {
        String ipAddr = IpUtils.getIpAddr();
        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        Browser browser = userAgent.getBrowser();
        //当前浏览器名称
        String browserName = browser.getName();
        String image = "https://api.dicebear.com/6.x/bottts/png?seed=" + commentAddDto.getNickName();

        Comment comment = new Comment();
        BeanUtils.copyProperties(commentAddDto, comment);

        comment.setIp(ipAddr);
        comment.setBrowserName(browserName);
        comment.setAuthorImg(image);

        return this.save(comment);
    }
}




