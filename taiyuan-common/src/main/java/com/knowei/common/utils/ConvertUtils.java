package com.knowei.common.utils;

import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

public class ConvertUtils {
    /**
     * 将集合对象转换为指定的VO类型列表
     *
     * @param sourceList  源集合
     * @param targetClass 目标VO类的class
     * @return List<T> 转换后的VO列表
     */
    public static <S, T> List<T> convertList(List<S> sourceList, Class<T> targetClass) {
        return sourceList.stream().map(source -> {
            try {
                T target = targetClass.getDeclaredConstructor().newInstance();
                BeanUtils.copyProperties(source, target);
                return target;
            } catch (Exception e) {
                throw new RuntimeException("对象转换失败：" + e.getMessage(), e);
            }
        }).collect(Collectors.toList());
    }

    public static <S, T> T convertVO(S source, Class<T> targetClass) {
        T target = null;
        try {
            target = targetClass.getDeclaredConstructor().newInstance();
            BeanUtils.copyProperties(source, target);
            return target;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
