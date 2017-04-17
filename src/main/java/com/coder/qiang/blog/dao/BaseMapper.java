package com.coder.qiang.blog.dao;

import com.coder.qiang.common.data.PageRequest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Gong on 2016/4/8.
 */
public interface BaseMapper<T> {

    /**
     * 根据主键 id 删除
     *
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据主键 id 和创建者 id 删除
     *
     * @param id
     * @param creatorId
     * @return
     */
    int deleteByPrimaryKey(@Param("id") Integer id, @Param("creatorId") Integer creatorId);

    /**
     * 保存对象
     *
     * @param record
     * @return
     */
    int insert(T record);

    /**
     * 根据主键 id 查询
     *
     * @param id
     * @return
     */
    T selectByPrimaryKey(Integer id);

    /**
     * 更新对象
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(T record);

    /**
     * 分页查询
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<T> selectPageList(@Param("filter") T t, @Param("page") PageRequest pageRequest);

    /**
     * 统计所有数据
     *
     * @return
     */
    int countAll();

    /**
     * 统计筛选后的数据
     *
     * @param filter
     * @return
     */
    int count(T filter);

}
