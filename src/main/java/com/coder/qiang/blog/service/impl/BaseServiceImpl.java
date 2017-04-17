package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.service.BaseService;
import com.coder.qiang.common.data.PageRequest;
import com.coder.qiang.common.data.PageResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by Gong on 2016/4/8.
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {

    public abstract BaseMapper<T> getMapper();

    public static final Logger logger = LoggerFactory.getLogger(BaseServiceImpl.class);

    @Override
    public boolean deleteByPrimaryKey(Integer id) {
        if (null != id) {
            return 1 == getMapper().deleteByPrimaryKey(id);
        }
        return false;
    }

    @Override
    public boolean deleteByPrimaryKey(Integer id, Integer userId) {
        if (null != id && null != userId) {
            return 1 == getMapper().deleteByPrimaryKey(id, userId);
        }
        return false;
    }

    @Override
    public boolean insert(T record) {
        if (null != record) {
            return 1 == getMapper().insert(record);
        }
        return false;
    }

    @Override
    public T selectByPrimaryKey(Integer id) {
        if (null != id) {
            return getMapper().selectByPrimaryKey(id);
        }
        return null;
    }

    @Override
    public boolean updateByPrimaryKeySelective(T record) {
        if (null != record) {
            return 1 == getMapper().updateByPrimaryKeySelective(record);
        }
        return false;
    }

    @Override
    public PageResponse<T> selectPageList(T filter, PageRequest pageRequest) {
        PageResponse<T> pageResponse = new PageResponse<T>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setData(getMapper().selectPageList(filter, pageRequest));
        pageResponse.setRecordsTotal(pageResponse.getData().size());
        pageResponse.setRecordsFiltered(getMapper().count(filter));
        return pageResponse;
    }


    @Override
    public int count(T filter) {
        return getMapper().count(filter);
    }



}
