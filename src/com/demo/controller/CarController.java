package com.demo.controller;

import com.demo.util.Util;
import com.demo.service.CarService;
import com.demo.vo.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class CarController {

    @Autowired
    private CarService carService;

    /**
     * 增加车辆
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("carAdd")
    public void add(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Car vo = new Car();
        //取出页面传进来的参数
        vo.setCarPai(Util.decode(request, "carPai"));
        vo.setCarName(Util.decode(request, "carName"));
        vo.setCarChexing(Util.decode(request, "carChexing"));
        vo.setCarCheng(Util.decode(request, "carCheng"));
        vo.setCarIndate(Util.decode(request, "carIndate"));
        vo.setCarStatus(Util.decode(request, "carStatus"));
        vo.setCarUser(Util.decode(request, "carUser"));
        vo.setCarPhone(Util.decode(request, "carPhone"));
        vo.setCarText(Util.decode(request, "carText"));
        //调用Service层的增加（insert）方法
        carService.insert(vo);
        this.redirectList(request, response);
    }

    /**
     * 删除车辆
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("carDelete")
    public void delete(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Serializable id = Util.decode(request, "id");
        carService.delete(Arrays.asList(id));
        this.redirectList(request, response);
    }

    /**
     * 编辑车辆
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("carEdit")
    public void edit(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Car vo = new Car();
        vo.setId(Long.valueOf(Util.decode(request, "id")));
        vo.setCarPai(Util.decode(request, "carPai"));
        vo.setCarName(Util.decode(request, "carName"));
        vo.setCarChexing(Util.decode(request, "carChexing"));
        vo.setCarCheng(Util.decode(request, "carCheng"));
        vo.setCarIndate(Util.decode(request, "carIndate"));
        vo.setCarStatus(Util.decode(request, "carStatus"));
        vo.setCarUser(Util.decode(request, "carUser"));
        vo.setCarPhone(Util.decode(request, "carPhone"));
        vo.setCarText(Util.decode(request, "carText"));
        carService.update(vo);
        this.redirectList(request, response);
    }

    /**
     * 获取车辆的详细信息（详情页面与编辑页面要显示该车辆的详情）并跳转回页面
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping({"carGet", "carEditPre"})
    public void get(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Serializable id = Util.decode(request, "id");//取出主键id
        Car vo = carService.get(id);
        request.getSession().setAttribute("vo", vo);
        String to = request.getRequestURI().toLowerCase().contains("get") ? "info" : "edit";//判断是去详情显示页面还是编辑页面
        response.sendRedirect("car_" + to + ".jsp");
    }

    /**
     * 根据条件查询车辆的列表并跳转回页面
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("carList")
    public void list(HttpServletResponse response, HttpServletRequest request) throws IOException {
        this.redirectList(request, response);
    }

    /**
     * 跳转到列表页面
     *
     * @param request
     * @param response
     */
    private void redirectList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //查询列和关键字
        String searchColumn = Util.decode(request, "searchColumn");
        String keyword = Util.decode(request, "keyword");
        Map<String, Object> params = new HashMap();//用来保存控制层传进来的参数(查询条件)
        params.put("searchColumn", searchColumn);//要查询的列
        params.put("keyword", keyword);//查询的关键字
        response.getWriter().println(com.alibaba.fastjson.JSONObject.toJSONString(carService.list(params).get("list")));
    }
}
