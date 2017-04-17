package com.coder.qiang.blog.service.impl;

import com.coder.qiang.blog.dao.BaseMapper;
import com.coder.qiang.blog.dao.ResponseMapper;
import com.coder.qiang.blog.modal.Response;
import com.coder.qiang.blog.service.ResponseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CoderQiang on 2017/4/13.
 */
@Service
public class ResponseServiceImpl extends BaseServiceImpl<Response> implements ResponseService {
    @Autowired
    private ResponseMapper mapper;

    @Override
    public BaseMapper<Response> getMapper() {
        return mapper;
    }
}
