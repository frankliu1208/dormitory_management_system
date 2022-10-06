<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%--Building management front-end page--%>
<head>
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
                    <form role="form" class="form-inline" action="/building/search" method="post">
                        <div class="form-group">
                            <label for="name">Field：</label>
                            <select name="key" class="form-control">
                                <option value="name">Name</option>
                                <option value="introduction">Introduction</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">Value：</label>
                            <input type="text" class="form-control" name="value" placeholder="field value" maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info ">
										<span style="margin-right: 5px"
                                              class="glyphicon glyphicon-search" aria-hidden="true">
										</span>Start searching
                            </button>
                        </div>
                        <div class="form-group " style="margin-left: 48px">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addUserModal">
										<span style="margin-right: 5px" class="" aria-hidden="true">
											<i class="fa fa-user-plus fa-sm">Add building information</i>
											</span>
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
                        <th>Name</th>
                        <th>Introduction</th>
                        <th>Administrator</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="building">
                        <tr>
                            <td>${building.id}</td>
                            <td>${building.name}</td>
                            <td>${building.introduction}</td>
                            <td>${building.adminName}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default "
                                            data-id="${building.id}"
                                            data-name="${building.name}"
                                            data-introduction="${building.introduction}"
                                            data-admin-id="${building.adminId}"
                                            data-toggle="modal"
                                            data-target="#updateUserModal">
                                        <i class="fa fa-user-o">Modify</i>
                                    </button>

<%--                                    when cilick deleting,  we can get the buildiing.id  --%>
                                    <button type="button" class="btn btn-danger "
                                            data-id="${building.id}" data-toggle="modal"
                                            onclick="" data-target="#delUserModal">
                                        <i class="fa fa-user-times">Delete</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- add框示例（Modal） -->
                <form method="post" action="/building/save" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">Add building information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name"
                                                       name="name" value="" placeholder="Please enter the name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Introduction</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="introduction"
                                                       name="introduction" value="" placeholder="Please enter introduction">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Administration</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="adminId">
                                                    <c:forEach items="${dormitoryAdminList}" var="dormitoryAdmin">
                                                        <option value="${dormitoryAdmin.id}">${dormitoryAdmin.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- update框示例（Modal） -->
                <form method="post" action="/building/update" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="updateUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">User information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="id"
                                                       name="id">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name"
                                                       name="name" value="" placeholder="请输入名称">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Introduction</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="introduction"
                                                       name="introduction" value="" placeholder="Please enter introduction">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Administrator</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="adminId">
                                                    <c:forEach items="${dormitoryAdminList}" var="dormitoryAdmin">
                                                        <option class="adminId" value="${dormitoryAdmin.id}">${dormitoryAdmin.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>


                <!-- Delete function（Modal） -->
                <form method="post" action="/building/delete"
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">Information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel">Delete information</h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin"> <input
                                                    type="hidden" class="form-control" id="id"
                                                    name="id" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                    <span id="tip"> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--The text() method sets or returns the text content of the selected elements.
When this method is used to return content, it returns the text content of all matched elements (HTML markup will be removed).
When this method is used to set content, it overwrites the content of ALL matched elements.--%>

<script>
    $('#updateUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var adminId = button.data('admin-id')
        var name = button.data('name')
        var introduction = button.data('introduction')
        var modal = $(this)

        //The find() method returns descendant elements of the selected element.
          //  A descendant is a child, grandchild, great-grandchild, and so on.

        modal.find('.modal-title').text('modify building information')
        modal.find('#id').val(id)
        var list = modal.find('.adminId')
        for (var i=0;i<list.length;i++){
            var obj = $(list.get(i));
            if(adminId == obj.val()){
                obj.attr("selected","selected");
            }
        }
        modal.find('#introduction').val(introduction)
        modal.find('#name').val(name)
    })

    // https://www.w3schools.com/bootstrap/bootstrap_ref_js_modal.asp

    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
            var modal = $(this)
        modal.find('.modal-title').text('delete building information')
        modal.find('#deleteLabel').text('Do you wnat to delete with id:  ' + id )
        modal.find('#id').val(id)
    })
</script>

</body>

</html>