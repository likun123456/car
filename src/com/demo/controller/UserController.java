package com.demo.controller;

import com.demo.util.Util;
import com.demo.service.UserService;
import com.demo.vo.User;
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
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 增加用户
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("userAdd")
    public void add(HttpServletResponse response, HttpServletRequest request) throws IOException {
        User vo = new User();
        //取出页面传进来的参数
        vo.setUsername(Util.decode(request, "username"));
        vo.setPassword(Util.decode(request, "password"));
        vo.setRealName(Util.decode(request, "realName"));
        vo.setUserSex(Util.decode(request, "userSex"));
        vo.setUserPhone(Util.decode(request, "userPhone"));
        vo.setUserText(Util.decode(request, "userText"));
        vo.setUserType(Util.decode(request, "userType"));
        //调用Service层的增加（insert）方法
        userService.insert(vo);
        this.redirectList(request, response);
    }

    /**
     * 删除用户
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("userDelete")
    public void delete(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Serializable id = Util.decode(request, "id");
        userService.delete(Arrays.asList(id));
        this.redirectList(request, response);
    }

    /**
     * 编辑用户
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("userEdit")
    public void edit(HttpServletResponse response, HttpServletRequest request) throws IOException {
        User vo = new User();
        vo.setId(Long.valueOf(Util.decode(request, "id")));
        vo.setUsername(Util.decode(request, "username"));
        vo.setPassword(Util.decode(request, "password"));
        vo.setRealName(Util.decode(request, "realName"));
        vo.setUserSex(Util.decode(request, "userSex"));
        vo.setUserPhone(Util.decode(request, "userPhone"));
        vo.setUserText(Util.decode(request, "userText"));
        vo.setUserType(Util.decode(request, "userType"));
        userService.update(vo);
        this.redirectList(request, response);
    }

    /**
     * 获取用户的详细信息（详情页面与编辑页面要显示该用户的详情）并跳转回页面
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping({"userGet", "userEditPre"})
    public void get(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Serializable id = Util.decode(request, "id");//取出主键id
        User vo = userService.get(id);
        request.getSession().setAttribute("vo", vo);
        String to = request.getRequestURI().toLowerCase().contains("get") ? "info" : "edit";//判断是去详情显示页面还是编辑页面
        response.sendRedirect("user_" + to + ".jsp");
    }

    /**
     * 根据条件查询用户的列表并跳转回页面
     *
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping("userList")
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
        response.getWriter().println(com.alibaba.fastjson.JSONObject.toJSONString(userService.list(params).get("list")));
    }
}
