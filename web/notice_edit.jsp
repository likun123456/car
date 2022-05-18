<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改公告</title>
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/layui/css/layui.css">
</head>
<body style="padding: 20px">
<form class="layui-form" action="">
    <input type="hidden" name="id" class="layui-input" value="${vo.id}">
    
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
            <input type="text" name="noticeName" lay-verify="required|noticeName" class="layui-input" value="${vo.noticeName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">内容：</label>
        <div class="layui-input-block">
            <textarea type="text" name="noticeText" class="layui-input" style="height: 100px;padding-left: 10px;" placeholder="请输入内容......">${vo.noticeText}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型：</label>
        <div class="layui-input-block">
            <input type="text" name="noticeType" lay-verify="required|noticeType" class="layui-input" value="${vo.noticeType}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间：</label>
        <div class="layui-input-block">
            <input type="text" name="createDate" lay-verify="required|createDate" class="layui-input" value="${vo.createDate}">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="submit-button">保存</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="js/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        let form = layui.form, layer = layui.layer, layedit = layui.layedit;
        //创建一个编辑器
        let editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(submit-button)', function (data) {
            $.post("noticeEdit", data.field, function () {
                let index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
                parent.location.reload();//刷新父级页面

            }, "text");//这里用的是post提交，如果不懂可以参考JQuery中ajax提
            return false;
        });
    });
</script>
</body>
</html>
