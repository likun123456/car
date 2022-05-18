<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <script type="text/javascript">
        let alert_msg = '${alert_msg}';
        if (alert_msg != null && alert_msg.trim() != '') {
            window.alert(alert_msg);
        }
    </script>
    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            letter-spacing: .05em;
        }

        html {
            height: 100%;
        }

        body {
            height: 100%;
        }

        .container {
            height: 100%;
            /*background-image: linear-gradient(to right, #fbc2eb, #a6c1ee); 设置渐变色 */
            padding: 0;
            margin: 0;
            background: url("img/1.jpg") no-repeat;
            background-size: 100% 100%;
        }

        .login-wrapper {
            background-color: #fff;
            width: 250px;
            height: 500px;
            position: relative;
            padding: 0 50px;
            border-radius: 15px;
            /* 设置框的居中位置也可以采用flex布局方式 */
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .login-wrapper .header {
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            line-height: 120px;
        }

        .login-wrapper .form-wrapper .input-item {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128, 125, 125);
            font-size: 15px;
            outline: none;
        }

        .login-wrapper .form-wrapper .input-item ::placeholder {
            text-transform: uppercase;
        }

        .login-wrapper .form-wrapper .btn {
            text-align: center;
            padding: 10px;
            margin-top: 40px;
            width: 100%;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            color: #fff;
        }

        .login-wrapper .msg {
            text-align: center;
            line-height: 80px;
        }

        .login-wrapper .msg a {
            /* 消除下划线 */
            text-decoration: none;
            text-decoration-color: unset;
            color: #a6c1ee;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="login-wrapper">
        <div class="header">Login</div>
        <div class="form-wrapper">
            <form action="authLogin" method="post" onsubmit="return check()">
                <input type="text" name="username" id="username" placeholder="登录账号"  class="input-item">
                <input type="password" name="password" id="password" placeholder="登录密码"  class="input-item">
				
                <input type="text" name="validationCode" id="validationCode" placeholder="请输入验证码" class="input-item"
                       style="width: 120px;float: left;">
                <img id="img_validation_code" src="authValidationCode" onclick="refresh()"
                     style="height: 37px;width: 120px;float: right;border-radius: 4px;"/>
					 
                <input class="btn" type="submit" value="登录"/>
            </form>
        </div>
        <div class="msg">
            Don't have account?<a href='register.jsp' style="font-weight: bold;">Sign up</a>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //提交之前进行检查，如果return false，则不允许提交
    function check() {
        //根据ID获取值
        let username = document.getElementById("username").value;
        let password = document.getElementById("password").value;
        if (username == "") {
            alert("用户名不能为空");
            return false;
        }
        if (password == "") {
            alert("密码不能为空");
            return false;
        }
        return true;
    }

    function refresh() {
        let img = document.getElementById("img_validation_code")
        img.src = "authValidationCode?r=" + Math.random();
    }
</script>
</html>
