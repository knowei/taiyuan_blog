package com.knowei.web.controller.post.portal;

import com.knowei.common.response.Result;
import com.knowei.post.entity.dto.CommentAddDto;
import com.knowei.post.entity.vo.CommentVo;
import com.knowei.post.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/portal/comment")
public class PortalCommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 根据文章ID获取当前文章的评论列表
     *
     * @param postId
     * @return
     */
    @GetMapping("/{postId}")
    public Result<List<CommentVo>> getCommentList(@PathVariable Long postId) {
        return Result.success(commentService.getCommentList(postId));
    }

    /**
     * 新增评论
     *
     * @param commentAddDto
     * @return
     */
    @PostMapping("")
    public Result<Boolean> addComment(@RequestBody CommentAddDto commentAddDto, HttpServletRequest request) {
        return Result.success(commentService.addComment(commentAddDto, request));
    }

}
