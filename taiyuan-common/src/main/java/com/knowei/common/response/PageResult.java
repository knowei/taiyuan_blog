package com.knowei.common.response;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class PageResult<T> {
    private Long total;      // 总记录数
    private List<T> list; // 当前页数据

    public PageResult(Long total, List<T> list) {
        this.total = total;
        this.list = list;
    }
}