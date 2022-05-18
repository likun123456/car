package com.demo.service.impl;

import com.demo.dao.CarMapper;
import com.demo.service.CarService;
import com.demo.vo.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Car模块的Service层（业务层）的具体实现类，对CarService接口中定义的抽象方法作出具体的功能实现
 */
@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;


    //@Override
    public boolean insert(Car vo) {
        return this.carMapper.doCreate(vo) == 1;
    }

    //@Override
    public boolean delete(Collection<Serializable> ids) {
        return ids.isEmpty() ? false : this.carMapper.doRemoveBatch(ids) == ids.size();
    }

    //@Override
    public boolean update(Car vo) {
        return this.carMapper.doUpdate(vo) == 1;
    }

    //@Override
    public Car get(Serializable id) {
        return this.carMapper.findById(id);
    }

    //@Override
    public Map<String, Object> list(Map<String, Object> params) {
        Map<String, Object> resultMap = new HashMap();
        resultMap.put("totalCount", this.carMapper.getAllCount(params));
        resultMap.put("list", this.carMapper.findAllSplit(params));
        return resultMap;
    }
}
