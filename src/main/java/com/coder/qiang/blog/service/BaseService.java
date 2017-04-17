package com.coder.qiang.blog.service;



import com.coder.qiang.common.data.PageRequest;
import com.coder.qiang.common.data.PageResponse;

import java.util.List;

/**
 * Created by Gong on 2016/4/8.
 */
public interface BaseService<T> {

    boolean deleteByPrimaryKey(Integer id, Integer userId);

    boolean deleteByPrimaryKey(Integer id);

    boolean insert(T record);

    T selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(T record);

    PageResponse<T> selectPageList(T filter, PageRequest pageRequest);

    int count(T filter);

}
