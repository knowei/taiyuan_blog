package com.knowei.common;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IdBaseModel {

    @TableId(value = "id", type = IdType.AUTO)
    protected Long id;

}
