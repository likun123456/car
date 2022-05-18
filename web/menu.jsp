<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<li class="layui-nav-item <%=request.getParameter("User_active")%>"><a href="user_list.jsp">用户管理</a></li>
<li class="layui-nav-item <%=request.getParameter("Car_active")%>"><a href="car_list.jsp">车辆管理</a></li>
<li class="layui-nav-item <%=request.getParameter("Notice_active")%>"><a href="notice_list.jsp">公告管理</a></li>

