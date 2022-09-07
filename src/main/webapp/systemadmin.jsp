<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://kit.fontawesome.com/c2a154e786.js" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="application/javascript">
        function change(url,index){
            $(".list-group-item").removeClass("active");
            $(".list-group-item").eq(index).addClass("active");
            // attr used to get or set self-defined property, below re-set the value of src in the iframe tag
            $("iframe").attr("src","/"+url);
        }
    </script>
</head>
<body>
<%--when clicking the menu on the left side of the home page, jump to related pages--%>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <ul class="nav navbar-nav navbar-left">
            <li>
                <a style="font-size: 26px;">DORMS Dormitory management system-system administrator</a>
            </li>
        </ul>
        <span style="color: #CCCCCC;font-size: 26px;position: relative;top: 5px;"></span>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a>Welcome ,${systemAdmin.name}</a>
            </li>
            <li>
<%--                exit  functionality    --%>
                <a href="/account/logout">Exit</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
<%--href="#"与href="javascript:void(0)"的区别
    # 包含了一个位置信息，默认的锚是#top 也就是网页的上端。
    而javascript:void(0), 仅仅表示一个死链接。    --%>
            <a href="javascript:void(0)" class="list-group-item active" onclick="change('dormitoryAdmin/list',0)">
						<span class="" aria-hidden="true">
							<i class="fa fa-user-circle-o fa-fw"></i>
						</span>Dormitory Administrator management
            </a>
<%--            when clicking the menu on the left side,  call the change(),  go to he backend controller,  controller gets data from database, then display in .jsp--%>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('student/list',1)">
						<span class="" aria-hidden="true">
							<i class="fa fa-user-circle fa-fw"></i>
						</span>Student management
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('building/list',2)">
						<span class="" aria-hidden="true">
							<i class="fa fa-home fa-fw"></i>
						</span>Building management
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('dormitory/list',3)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bed fa-fw"></i>
						</span>Dormitory management
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('moveout/list',4)">
						<span class="" aria-hidden="true">
							<i class="fa fa-address-card-o fa-fw"></i>
						</span>Moveout register
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('moveout/record',5)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bookmark fa-fw"></i>
						</span>Moveout record
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('absent/list',6)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bookmark-o fa-fw"></i>
						</span>Student absence record
            </a>

        </div>
        <!--content on the right side-->

        <!-- with src, we can go to the back end, i.e. DormitoryAdminController, fetch the data, then go to adminmanager.jsp-->
        <iframe style="width: 81%; height: 600px; border: 0px;" src="/dormitoryAdmin/list"></iframe>

    </div>
</div>
<div class="footer">
    <p class="text-center">
        2022 © DORMS
    </p>
</div>
</body>
</html>
