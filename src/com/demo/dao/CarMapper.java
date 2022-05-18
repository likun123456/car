package com.demo.dao;

import com.demo.vo.Car;
import org.apache.ibatis.annotations.Mapper;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * Car模块的DAO层（数据层）接口，提供增删改查等数据库操作的方法抽象
 */
@Mapper
public interface CarMapper {
    /**
     * 增加车辆表记录
     *
     * @param vo
     * @return
     */
    int doCreate(Car vo);

    /**
     * 根据主键id的集合，批量删除对应的车辆表记录
     *
     * @param ids
     * @return
     */
    int doRemoveBatch(Collection<Serializable> ids);

    /**
     * 更新车辆表记录
     *
     * @param vo
     * @return
     */
    int doUpdate(Car vo);

    /**
     * 根据主键id获取车辆表记录的详情
     *
     * @param id
     * @return
     */
    Car findById(Serializable id);

    /**
     * 根据条件查询车辆表集合
     *
     * @param params
     * @return
     */
    List<Car> findAllSplit(Map<String, Object> params);

    /**
     * 根据条件查询车辆数量
     *
     * @param params
     * @return
     */
    Integer getAllCount(Map<String, Object> params);
}
