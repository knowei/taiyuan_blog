package com.knowei.post.entity.vo;

import lombok.Data;

import java.util.List;

/**
 * 归档
 */
@Data
public class ArchiveVo {

    private String year;

    private List<PostVo> postList;
}
