<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>汽车管理系统</title>
    <link rel="stylesheet" href="js/layui/css/layui.css">
    <script src="js/jquery.js"></script>
    <script src="js/layer.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-weight: bold;font-size: 19px">汽车管理系统</div>
        <ul class="layui-nav layui-layout-left"></ul>
        <c:if test="${loginUser==null}">
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item"><a href="login.jsp">请登录</a></li>
            </ul>
        </c:if>
        <c:if test="${loginUser!=null}">
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item"><a>${loginUser.username}</a></li>
                <li class="layui-nav-item"><a href="authLogout">退出登录</a></li>
            </ul>
        </c:if>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边栏 -->
                <jsp:include page="menu.jsp">
                    <jsp:param value="active" name="User_active"/>
                </jsp:include>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div class="search_style" style="padding-top: 10px;padding-left: 15px;">
            <div class="searchTable">
                搜索：
                <div class="layui-inline">
                    <input class="layui-input" name="search_keyword" id="search_keyword" autocomplete="off" placeholder="姓名">
                    <input type="hidden" class="layui-input" name="searchColumn" id="searchColumn" autocomplete="off" value="real_name">
                </div>
                <button class="layui-btn" data-type="reload">搜索</button>
            </div>
        </div>
        <!-- 内容主体区域 -->
        <table class="layui-hide" id="myData" lay-filter="myTable"></table>
    </div>
</div>
<script src="js/layui/layui.js"/>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        let element = layui.element;
    });
</script>
<script type="text/html" id="myToolbar">
    <div class="layui-btn-container">
        <c:if test="${loginUser.userType == '管理员'}"><button class='layui-btn layui-btn-sm' lay-event='add'>添加</button></c:if>
    </div>
</script>
<script>
    function arrayBufferToBase64(buffer) {
        let binary = '';
        let bytes = new Uint8Array(buffer);
        let len = bytes.byteLength;
        for (let i = 0; i < len; i++) {
            binary += String.fromCharCode(bytes[i]);
        }
        return window.btoa(binary);
    }

    layui.use('table', function () {
        let table = layui.table;
        table.render({
            elem: '#myData',
            id: 'myTable',
            url: 'userList',
            parseData: function (res) { //res：即为原始返回的数据
                let result = this.page.curr ? res.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr) : res.slice(0, this.limit);
                return {
                    "code": 0, //解析接口状态
                    "msg": '', //解析提示文本
                    "count": res.length, //解析数据长度（集合个数）
                    "data": result //解析数据列表
                };
            },
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                groups: 1, //只显示 1 个连续页码
                first: false, //不显示首页
                last: false, //不显示尾页
            },
            toolbar: '#myToolbar', //开启头部工具栏，并为其绑定左侧模板
            defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            title: '用户列表',
            cols: [
                [
                        {
                            field: 'username',
                            title: '用户名',
                        },
                        {
                            field: 'realName',
                            title: '姓名',
                            templet: vo => (vo = vo.realName) ? '<a href="#" style="color: #009688;">' + vo + '</a>' : '',
                            event: 'info',
                        },
                        {
                            field: 'userSex',
                            title: '性别',
                            templet: vo => vo.userSex ? vo.userSex : "",
                        },
                        {
                            field: 'userPhone',
                            title: '手机',
                        },
                        {
                            field: 'userText',
                            title: '备注',
                        },
                        {
                            field: 'userType',
                            title: '类型',
                            templet: vo => vo.userType ? vo.userType : "",
                        },
                    {
                        align: 'center',
                        fixed: 'right',
                        title: '操作',
                        width: 130,
                        templet: vo => {
                            let flag1 = ${loginUser.id} == vo.id;
                            let flag2 = ${loginUser.userType == '管理员'};
                            return ((flag1 || flag2) ? '<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>' : '') + ((flag2) ? '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>' : '');
                        }
                    }
                ]
            ],
        });
        //监听工具条
        table.on('tool(myTable)', function (obj) { //注：tool 是工具条事件名，myTable 是 table 原始容器的属性 lay-filter="对应的值"
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                // layer.confirm('删除' + data.realName + "?", function (index) {
                $.ajax({
                    type: "GET",
                    dataType: "text",
                    url: "userDelete?id=" + data.id,
                    success: function () {
                        console.log("已删除！");
                    }
                });
                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                //parent.location.reload();//刷新父级页面
                // layer.close(index);
                //parent.location.reload();//刷新父级页面
                layer.msg(data.realName + ' 删除成功！');
                // });
            } else if (layEvent === 'edit') { //编辑
                layer.open({
                    type: 2,
                    area: ['800px', '550px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: 'userEditPre?id=' + data.id
                });
                obj.update({});//同步更新缓存对应的值
            } else if (layEvent === 'info') { //详情
                layer.open({
                    type: 2,
                    area: ['800px', '650px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: 'userGet?id=' + data.id
                });
                obj.update({});//同步更新缓存对应的值
            } else if (layEvent === 'LAYTABLE_TIPS') {
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });
        //头工具栏事件
        table.on('toolbar(myTable)', function (obj) {
            if ('add' == obj.event) {
                layer.msg('添加');
                layer.open({
                    type: 2,
                    area: ['800px', '550px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: 'user_add.jsp'
                });
            } else {
                //layer.alert('这是工具栏右侧自定义的一个图标按钮');
            }
        });
        //搜索
        let $ = layui.$, active = {
            reload: function () {
                let url = 'userList?keyword=' + $('#search_keyword').val() + '&searchColumn=' + $('#searchColumn').val();
                //执行重载
                table.reload('myTable', {
                    url: url,
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
            }
        };
        $('.searchTable .layui-btn').on('click', function () {
            let type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>
