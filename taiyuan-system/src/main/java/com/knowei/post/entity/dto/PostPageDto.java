package com.knowei.post.entity.dto;

import com.knowei.common.request.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class PostPageDto extends PageRequest {

    private String title;

    private String status;
}
