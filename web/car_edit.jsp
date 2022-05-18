<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改车辆</title>
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/layui/css/layui.css">
</head>
<body style="padding: 20px">
<form class="layui-form" action="">
    <input type="hidden" name="id" class="layui-input" value="${vo.id}">
    
    <div class="layui-form-item">
        <label class="layui-form-label">车牌：</label>
        <div class="layui-input-block">
            <input type="text" name="carPai" lay-verify="required|carPai" class="layui-input" value="${vo.carPai}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">品牌型号：</label>
        <div class="layui-input-block">
            <input type="text" name="carName" lay-verify="required|carName" class="layui-input" value="${vo.carName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">车型：</label>
        <div class="layui-input-block">
            <input type="text" name="carChexing" lay-verify="required|carChexing" class="layui-input" value="${vo.carChexing}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">里程：</label>
        <div class="layui-input-block">
            <input type="text" name="carCheng" lay-verify="required|carCheng" class="layui-input" value="${vo.carCheng}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">购买日期：</label>
        <div class="layui-input-block">
            <input type="text" name="carIndate" lay-verify="required|carIndate" class="layui-input" value="${vo.carIndate}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态：</label>
        <div class="layui-input-block">
                   <input name="carStatus" type="radio" value="正常" ${vo.carStatus=='正常'?'checked':''} class="layui-input" title="正常"/>
                   <input name="carStatus" type="radio" value="故障" ${vo.carStatus=='故障'?'checked':''} class="layui-input" title="故障"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾驶员：</label>
        <div class="layui-input-block">
            <input type="text" name="carUser" lay-verify="required|carUser" class="layui-input" value="${vo.carUser}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系方式：</label>
        <div class="layui-input-block">
            <input type="text" name="carPhone" lay-verify="required|carPhone" class="layui-input" value="${vo.carPhone}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-block">
            <textarea type="text" name="carText" class="layui-input" style="height: 100px;padding-left: 10px;" placeholder="请输入内容......">${vo.carText}</textarea>
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
            $.post("carEdit", data.field, function () {
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
