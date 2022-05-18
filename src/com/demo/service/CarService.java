package com.demo.service;

import com.demo.vo.Car;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

/**
 * Car模块的Service层（业务层）接口，提供业务方法的抽象
 */
public interface CarService {
    /**
     * 增加车辆
     *
     * @param vo
     * @return
     */
    boolean insert(Car vo);

    /**
     * 删除车辆
     *
     * @param ids
     * @return
     */
    boolean delete(Collection<Serializable> ids);

    /**
     * 修改车辆
     *
     * @param vo
     * @return
     */
    boolean update(Car vo);

    /**
     * 根据主键Id查询车辆详情
     *
     * @param id
     * @return
     */
    Car get(Serializable id);

    /**
     * 根据条件查询车辆的列表与数量
     *
     * @param params
     * @return
     */
    Map<String, Object> list(Map<String, Object> params);
}
