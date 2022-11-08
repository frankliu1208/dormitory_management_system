<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- frontend page regarding move out records   --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/c2a154e786.js" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Dormitory management system</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">

            <!-- Search section on the top -->
            <div class="panel panel-default">
                <div class="panel-heading">Search</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="/moveout/recordSearch" method="post">
                        <div class="form-group">
                            <label for="name">Field：</label>
                            <select name="key" class="form-control">
                                <option value="studentName">Student</option>
                                <option value="dormitoryName">Dormitory</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">Value：</label>
                            <input type="text" class="form-control" name="value" placeholder=" " maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info ">
										<span style="margin-right: 5px"
                                              class="glyphicon glyphicon-search" aria-hidden="true">
										</span>Start searching
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- List display-->
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student</th>
                        <th>Dormitory</th>
                        <th>Move-out reason</th>
                        <th>Move-out date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="moveout">
                        <tr>
                            <td>${moveout.id}</td>
                            <td>${moveout.studentName}</td>
                            <td>${moveout.dormitoryName}</td>
                            <td>${moveout.reason}</td>
                            <td>${moveout.createDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
</div>

</body>

</html>