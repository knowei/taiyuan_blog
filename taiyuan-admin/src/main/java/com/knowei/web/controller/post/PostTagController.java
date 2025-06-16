package com.knowei.web.controller.post;

import com.knowei.common.response.Result;
import com.knowei.post.entity.po.PostTag;
import com.knowei.post.service.PostTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/post/tag")
public class PostTagController {

    @Autowired
    private PostTagService postTagService;

    @PostMapping()
    public Result<Boolean> saveOrUpdate(@RequestBody PostTag postTag) {
        boolean saved = postTagService.saveOrUpdate(postTag);
        return saved ? Result.success() : Result.fail("保存失败");
    }
}
