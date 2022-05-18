<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>车辆详情</title>
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/layui/css/layui.css">
</head>
<body style="padding: 20px">
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">车牌：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carPai}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">品牌型号：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carName}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">车型：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carChexing}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">里程：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carCheng}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">购买日期：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carIndate}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态：</label>
        <div class="layui-input-block">
            <input name="carStatus" type="radio" value="正常" ${vo.carStatus=='正常'?'checked':''} class="layui-input" title="正常" disabled/>
            <input name="carStatus" type="radio" value="故障" ${vo.carStatus=='故障'?'checked':''} class="layui-input" title="故障" disabled/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">驾驶员：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carUser}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系方式：</label>
        <div class="layui-input-block" style="padding: 9px 15px;">
            ${vo.carPhone}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-block">
            <textarea type="text" name="carText" disabled="disabled" class="layui-input" style="height: 100px;padding-left: 10px;" placeholder="请输入内容......">${vo.carText}</textarea>
        </div>
    </div>
</form>
<script src="js/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        let form = layui.form, layer = layui.layer, layedit = layui.layedit;
        //创建一个编辑器
        let editIndex = layedit.build('LAY_demo_editor');
    });
</script>
</body>
</html>
