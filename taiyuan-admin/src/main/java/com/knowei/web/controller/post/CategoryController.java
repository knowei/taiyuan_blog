package com.knowei.web.controller.post;

import com.knowei.common.response.PageResult;
import com.knowei.common.response.Result;
import com.knowei.common.utils.ConvertUtils;
import com.knowei.post.entity.dto.CategoryAddDto;
import com.knowei.post.entity.dto.CategoryPageDto;
import com.knowei.post.entity.po.Category;
import com.knowei.post.entity.vo.CategoryVo;
import com.knowei.post.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    //@PostMapping()
    //public Result<Boolean> saveOrUpdate(@RequestBody Category category) {
    //    boolean saved = categoryService.saveOrUpdate(category);
    //    return saved ? Result.success() : Result.fail("保存失败");
    //}

    @GetMapping("/list")
    public Result<List<CategoryVo>> listCategory() {
        return Result.success(categoryService.listCategory());
    }

    /**
     * 分页
     *
     * @param dto
     * @return
     */
    @PostMapping("/page")
    public Result<PageResult<CategoryVo>> pageResult(@RequestBody CategoryPageDto dto) {
        PageResult<CategoryVo> pageResult = categoryService.pageResult(dto);
        return Result.success(pageResult);
    }

    /**
     * 保存或更新
     *
     * @param tag
     * @return
     */
    @PostMapping("")
    public Result<Boolean> saveOrUpdate(@RequestBody CategoryAddDto tag) {
        return Result.success(categoryService.saveOrUpdate(tag));
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<Boolean> delete(@PathVariable Long id) {
        return Result.success(categoryService.removeById(id));
    }

    @GetMapping("/{id}")
    public Result<CategoryVo> getCategoryVo(@PathVariable Long id) {
        return Result.success(ConvertUtils.convertVO(categoryService.getById(id), CategoryVo.class));
    }
}
