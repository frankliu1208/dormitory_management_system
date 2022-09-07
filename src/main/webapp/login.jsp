<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- introduce Bootstrap, jquery -->
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- introduce font-awesome -->
    <script src="https://kit.fontawesome.com/c2a154e786.js" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%--     <%=request.getContextPath()%>是为了解决相对路径的问题，可返回站点的根路径。  --%>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
</head>

<body>
<div class="container">
    <div class="form row" style="height: 300px;">
        <form class="form-horizontal col-md-offset-3" id="login_form" action="/account/login" method="post">
            <h3 class="form-title">User Login</h3>
            <div class="col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <span style="color: red;font-size: 13px;margin-left: -17px;">${usernameError}</span>
                    <input class="form-control required" required placeholder="Please enter the username" type="text" name="username"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <span style="color: red;font-size: 13px;margin-left: -17px;">${passwordError}</span>
                    <input class="form-control required" required placeholder="Please enter the password" type="password" name="password"/>
                </div>
                <div class="form-group">
                    <label class="radio-inline">
                        <input type="radio" name="type" checked value="systemAdmin" class="radio-inline"> System Administrator
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="type" value="dormitoryAdmin" class="radio-inline" > Dormitory Administrator
                    </label>
                </div>
                <div class="form-group col-md-offset-9">
                    <button type="submit" class="btn btn-success pull-left" name="submit">Login</button>
                    <button type="reset" class="btn btn-success pull-right" name="submit">Reset</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>