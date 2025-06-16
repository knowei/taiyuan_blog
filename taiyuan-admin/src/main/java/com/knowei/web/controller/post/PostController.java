package com.knowei.web.controller.post;

import com.knowei.common.response.PageResult;
import com.knowei.common.response.Result;
import com.knowei.post.entity.dto.PostAddDto;
import com.knowei.post.entity.dto.PostPageDto;
import com.knowei.post.entity.vo.PostVo;
import com.knowei.post.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    /**
     * 分页查询
     *
     * @param dto
     * @return
     */
    @PostMapping("/page")
    public Result<PageResult<PostVo>> pageResult(@RequestBody PostPageDto dto) {
        return Result.success(postService.pageResult(dto));
    }

    /**
     * 添加或更新
     *
     * @param postAddDto
     * @return
     */
    @PostMapping("")
    public Result<Boolean> saveOrUpdate(@RequestBody PostAddDto postAddDto) {
        return Result.success(postService.saveOrUpdate(postAddDto));
    }

    /**
     * 获取详情
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<PostVo> getPostVo(@PathVariable Long id) {
        return Result.success(postService.getPostVo(id));
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<Boolean> delete(@PathVariable Long id) {
        return Result.success(postService.removeById(id));
    }

}
