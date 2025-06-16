package com.knowei.web.controller.post;

import com.knowei.common.response.PageResult;
import com.knowei.common.response.Result;
import com.knowei.common.utils.ConvertUtils;
import com.knowei.post.entity.dto.TagAddDto;
import com.knowei.post.entity.dto.TagPageDto;
import com.knowei.post.entity.vo.TagVo;
import com.knowei.post.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tag")
public class TagController {

    @Autowired
    private TagService tagService;

    //@PostMapping()
    //public Result<Boolean> saveOrUpdate(@RequestBody Tag tag) {
    //    boolean saveOrUpdate = tagService.saveOrUpdate(tag);
    //    return saveOrUpdate ? Result.success() : Result.fail("保存失败");
    //}

    /**
     * 获取列表
     *
     * @return
     */
    @GetMapping("/list")
    public Result<List<TagVo>> listTag() {
        return Result.success(tagService.listTag());
    }

    /**
     * 分页
     *
     * @param dto
     * @return
     */
    @PostMapping("/page")
    public Result<PageResult<TagVo>> pageResult(@RequestBody TagPageDto dto) {
        PageResult<TagVo> pageResult = tagService.pageResult(dto);
        return Result.success(pageResult);
    }

    /**
     * 保存或更新
     *
     * @param tag
     * @return
     */
    @PostMapping("")
    public Result<Boolean> saveOrUpdate(@RequestBody TagAddDto tag) {
        return Result.success(tagService.saveOrUpdate(tag));
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<Boolean> delete(@PathVariable Long id) {
        return Result.success(tagService.removeById(id));
    }

    @GetMapping("/{id}")
    public Result<TagVo> getCategoryVo(@PathVariable Long id) {
        return Result.success(ConvertUtils.convertVO(tagService.getById(id), TagVo.class));
    }
}
