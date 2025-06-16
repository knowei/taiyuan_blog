package com.knowei.common.request;

import lombok.Data;

/**
 * 分页请求参数
 */
@Data
public class PageRequest {
    private Integer pageNum = 1;   // 当前页码，默认1
    private Integer pageSize = 10; // 每页大小，默认10
}
