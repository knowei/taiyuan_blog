package com.knowei.web.controller.post.portal;

import com.knowei.common.response.PageResult;
import com.knowei.common.response.Result;
import com.knowei.post.entity.dto.PostPageDto;
import com.knowei.post.entity.vo.CategoryVo;
import com.knowei.post.entity.vo.PostVo;
import com.knowei.post.entity.vo.TagVo;
import com.knowei.post.service.CategoryService;
import com.knowei.post.service.PostService;
import com.knowei.post.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/portal")
public class ArticleController {

    @Autowired
    private PostService postService;

    @Autowired
    private TagService tagService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 分页查询
     *
     * @param dto
     * @return
     */
    @PostMapping("/post/page")
    public Result<PageResult<PostVo>> pageResult(@RequestBody PostPageDto dto) {
        PageResult<PostVo> paged = postService.pageResult(dto);
        List<PostVo> list =
            paged.getList().stream().filter(item -> "1".equals(item.getStatus())).collect(Collectors.toList());
        paged.setList(list);
        paged.setTotal((long)list.size());
        return Result.success(paged);
    }

    /**
     * 获取详情
     *
     * @param id
     * @return
     */
    @GetMapping("/post/{id}")
    public Result<PostVo> getPostVo(@PathVariable Long id) {
        return Result.success(postService.getPostVo(id));
    }

    @GetMapping("/category/list")
    public Result<List<CategoryVo>> listCategory() {
        return Result.success(categoryService.listCategory());
    }

    @GetMapping("/tag/list")
    public Result<List<TagVo>> listTag() {
        return Result.success(tagService.listTag());
    }

}
