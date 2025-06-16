package com.knowei.common;

/**
 * 全局异常
 */
public class GlobalException extends RuntimeException {
    private final Integer code;

    public GlobalException(String message) {
        super(message);
        this.code = 500;
    }

    public GlobalException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}