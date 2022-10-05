<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%--Student management front-end page--%>
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

                    <form role="form" class="form-inline" action="/student/search" method="post">
                        <div class="form-group">
                            <label for="name">Field：</label>
                    <%--  the form will send "key" and "value" to the backend controller,  becuase  <select name="key" ...>     <input  name="value" ...>                  --%>
                    <%--  the backend controller will get  "key" and "value"  , "value" means value in option tage(either "number" or "name")
                         and user input    --%>

                            <select name="key" class="form-control">
                                <option value="number">Student ID</option>
                                <option value="name">Name</option>
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
											<i class="fa fa-user-plus">Add student information</i>
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
                        <th>Dormitory</th>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Sex</th>
                        <th>Status</th>
                        <th>Move-in date</th>
                        <th>Operation</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--   EL expression , list is coming from the StudentController, give a nickname "student"    --%>
                    <c:forEach items="${list}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.dormitoryName}</td>
                            <td>${student.number}</td>
                            <td>${student.name}</td>
                            <td>${student.gender}</td>
                            <td>${student.state}</td>
                            <td>${student.createDate}</td>
                            <td>
                             <%--     attach the data with the button       --%>
                             <%--  data-* : self-defined property       --%>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default "

                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-number="${student.number}"
                                            data-name="${student.name}"
                                            data-gender="${student.gender}"
                                            data-time="${student.createDate}"
                                            data-toggle="modal"
                                            data-target="#updateUserModal">
                                        <i class="fa fa-user-o">Modify</i>
                                    </button>

                                    <button type="button" class="btn btn-danger "
                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-toggle="modal"
                                            onclick="" data-target="#delUserModal">
                                        <i class="fa fa-user-times">Delete</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- Add （Modal） functionality, when clicking "Add student information", pop out adding window  -->
                <form method="post" action="/student/save" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <%--       when clicking the "x", close the modal window, because data-dismiss = "modal"                        --%>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">Add student infromation</h4>
                                </div>
                                <%--          main body of modal window             --%>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Dormitory</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="dormitoryId">
                                                    <c:forEach items="${dormitoryList}" var="dormitory">
                                                        <option value="${dormitory.id}" class="dormitory">${dormitory.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Student ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="number"
                                                       name="number" value="" placeholder="Please enter student ID">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name"
                                                       name="name" value="" placeholder="Please enter name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Sex</label>
                                            <div class="col-sm-9">
                                                <input type="radio" checked value="Man" class="gender"
                                                       name="gender"> Man
                                                &nbsp;&nbsp;&nbsp;<input type="radio" value="Woman" class="gender"
                                                                         name="gender"> Woman
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


                <!-- update（Modal）, modify function -->
                <form method="post" action="/student/update" class="form-horizontal" style="margin-top: 0px" role="form"
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
                                            <label for="user_id" class="col-sm-3 control-label">Dorimitory</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="dormitoryId">
                                                     <%--  come from studentcontroller,  L33.   nickname is dormitory,    --%>
                                                    <c:forEach items="${dormitoryList}" var="dormitory">
                                                     <%-- send to backend controller by ${dormitory.id} = ${dormitory.name}.   (value定义了提交服务器时，Key的值，option标签体中的内容为展示在页面上的内容，提交服务器时为value属性的值= 标签体中的值)      --%>
                                                        <option value="${dormitory.id}" class="dormitory">${dormitory.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <%--when updating, at the frontend, the original dormitory id also needs to send to the backend,  because later the available bed
                                        number of original dormitory needs to be decreased by 1,  value of "name property" is aligned with property in Student entity class --%>
                                        <input type="hidden" id="oldDormitoryId" name="oldDormitoryId">

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Student ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="number"
                                                       name="number" value="" placeholder="Please enter student ID">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name"
                                                       name="name" value="" placeholder="Please enter the name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Sex</label>
                                            <div class="col-sm-9">
                                                <input type="radio" checked value="Man" class="gender"
                                                       name="gender"> Man
                                                &nbsp;&nbsp;&nbsp;<input type="radio" value="Woman" class="gender"
                                                                         name="gender"> Woman
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Move-in date</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly class="form-control" id="time"
                                                       value="createTime">
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

                <!--   delete functionality  -->
                <form method="post" action="/student/delete"
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">User information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel">Delete information</h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin">
                                                <input
                                                    type="hidden" class="form-control" id="id"
                                                    name="id" placeholder="">
                                                <input type="hidden" id="dormitoryId" name="dormitoryId">
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


<script>
    $('#updateUserModal').on('show.bs.modal', function(event) {
        // get the data from the button,  check L91, the data from the list is attached to the button.
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var dormitoryId = button.data('dormitory-id')
        var number = button.data('number')
        var name = button.data('name')
        var gender = button.data('gender')
        var time = button.data('time')
        var modal = $(this)

        // find the related input tags in the update modal window, fill the data getting from the button to these input tags.
        modal.find('.modal-title').text('Modify student information')
        modal.find('#id').val(id)
        modal.find('#number').val(number)
        modal.find('#name').val(name)
        modal.find('#time').val(time)
        modal.find('#oldDormitoryId').val(dormitoryId)

        // select gender according to the list
        var list = modal.find('.gender')
        for(var i=0;i<list.length;i++){
            if(gender == $(list.get(i)).val()){
                $(list.get(i)).prop('checked',true)
            }
        }
        // deal with dormitory id
        var list2 = modal.find('.dormitory')
        for(var i=0;i<list2.length;i++){
            if(dormitoryId == $(list2.get(i)).val()){
                $(list2.get(i)).prop('selected',true)
            }
        }
    })


    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var dormitoryId = button.data('dormitoryId') // dormitory id need to send to backend controller, because later the available bed number of dormitory shall add 1
        var modal = $(this)

        modal.find('.modal-title').text('Delete student information')
        modal.find('#deleteLabel').text('Do you wnat to delete with id:  ' + id)
        modal.find('#id').val(id)
        modal.find('#dormitoryId').val(dormitoryId)
    })
</script>

</body>

</html>