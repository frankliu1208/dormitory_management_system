<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- front-end page related to the "Dormitory Administrator management" section --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/c2a154e786.js" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Dormitory management system</title>
</head>
<body>

<%--  front-end page for dormitory administrator management CRUD  --%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">

            <!--  search part on the top -->
            <div class="panel panel-default">
                <div class="panel-heading">Search</div>
                <div class="panel-body">
<%--  In this searching form, 2 name property (name="key",name="value" )  will send to DormitoryAdminController            --%>
                    <form role="form" class="form-inline" action="/dormitoryAdmin/search" method="post">
                        <div class="form-group">
                            <label for="name">Field：</label>
                            <select name="key" class="form-control">
                                <option value="username">DormitoryAdmin username</option>
                                <option value="name">DormitoryAdmin name</option>
                                <option value="telephone">DormitoryAdmin telephone</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">Value：</label>
                            <input type="text" class="form-control" id ="value" name="value" placeholder="field value" maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info ">
										<span style="margin-right: 5px"
                                              class="glyphicon glyphicon-search" aria-hidden="true">
										</span>Start searching
                            </button>
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="button" class="btn btn-default"
                                    data-toggle="modal" data-target="#addUserModal">
										<span style="margin-right: 2px; color: sandybrown" class="" aria-hidden="true">
											<i class="fa fa-user-plus fa-sm"></i>Add DormitoryAdmin information
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
                        <th>Username</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Sex</th>
                        <th>Contact telephone</th>
                        <th>Operation</th>
                    </tr>
                    </thead>
                    <%--   list comes from DormitoryAdminController.java, it is a collection       --%>
                    <tbody>

                    <c:forEach items="${list}" var="dormitoryAdmin">
                        <tr>
                            <td>${dormitoryAdmin.id}</td>
                            <td>${dormitoryAdmin.username}</td>
                            <td>${dormitoryAdmin.password}</td>
                            <td>${dormitoryAdmin.name}</td>
                            <td>${dormitoryAdmin.gender}</td>
                            <td>${dormitoryAdmin.telephone}</td>
                            <td>
                                    <%--     when clicking the modify button at end of each line, pop a new modal,  fill the existing data above into the new modifying modal --%>
<%--                        将按钮和数据绑定          --%>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default "
                                            data-id="${dormitoryAdmin.id}"
                                            data-username="${dormitoryAdmin.username}"
                                            data-password="${dormitoryAdmin.password}"
                                            data-name="${dormitoryAdmin.name}"
                                            data-gender="${dormitoryAdmin.gender}"
                                            data-telephone="${dormitoryAdmin.telephone}"
                                            data-toggle="modal"
                                            data-target="#updateUserModal">
                                          <%--   when clicking modify button, go to the method "updateUserModal" , these data-* values will go to L300  --%>
                                        <i class="fa fa-user-o fa-xs">Modify</i>
                                    </button>

                                  <%--when clicking the delete, send the id to the sheet,  then the sheet send the id to DormitoryAdminController --%>
                                    <button type="button" class="btn btn-danger "
                                            data-id="${dormitoryAdmin.id}" data-toggle="modal"
                                            onclick="" data-target="#delUserModal">
                                        <i class="fa fa-user-times fa-xs">Delete</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

                <!--  add form , send the data to DormitoryAdminController -->
                <form method="post" action="/dormitoryAdmin/save" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">Add DormitoryAdmin information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="username" class="col-sm-3 control-label">Username</label>
                                            <div class="col-sm-9">
                                                <%--   name property aligned with property in entity class， therefore in the Controller save(), only need to define object of DormitoryAdmin as the parameter  （自动封装）       --%>
                                                <input type="text" required class="form-control" id="username"
                                                       name="username" placeholder="Please enter the username">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="password" class="col-sm-3 control-label">Password</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="password"
                                                       name="password" value="" placeholder="Please enter password">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="adminname" class="col-sm-3 control-label">Name</label>
                                            <div class="col-sm-9" >
                                                <input type="text" required class="form-control" id="adminname"
                                                       name="name" value="" placeholder="Please enter the name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="gender" class="col-sm-3 control-label">Sex</label>
                                            <div class="col-sm-9" >
                                                <input type="radio" checked value="Man" class="gender"
                                                       name="gender"> Man
                                                &nbsp;&nbsp;&nbsp;<input type="radio" value="Woman" class="gender"
                                                                         name="gender"> Woman
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="telephone" class="col-sm-3 control-label">Telephone</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="telephone"
                                                       name="telephone" value="" placeholder="Please enter phone number">
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


                <!-- update Modal :  update funcationality -->
                <form method="post" action="/dormitoryAdmin/update" class="form-horizontal" style="margin-top: 0px" role="form"
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
                                                <%--     id can only be displayed, can not be modified in the update interface  --%>
                                                <input type="text" readonly required class="form-control" id="id"
                                                       name="id">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Username</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="username"
                                                       name="username" placeholder="Please enter username">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Password</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="password"
                                                       name="password" value="" placeholder="Please enter password">
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

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Telephone</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="telephone"
                                                       name="telephone" value="" placeholder="">
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


                <!-- Delete Modal : delete form   -->
                <form method="post" action="/dormitoryAdmin/delete"
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
                                                <h5 class="col-sm-18 control-label" id="deleteLabel">Delete information</h5>

                                                <%--  Only set the name property in the input tag, we can send the data to the backend
                                                   --%>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin">
                                                <input
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

<script>
     // modal window "updateUserModal"  binds an event,  get the data from the button in L308 - 317, after clicking modify, refill the data into inut tags L319 - 333
    $('#updateUserModal').on('show.bs.modal', function(event) {

        var button = $(event.relatedTarget)
        var id = button.data('id')
        var username = button.data('username')
        var password = button.data('password')
        var name = button.data('name')
        var gender = button.data('gender')
        var telephone = button.data('telephone')
        var modal = $(this)  // "modal" is the current updating modal

        //  find the related input tags in updateUserModal modal window,  fill the data to these input tags (将按钮上绑定的数据取出后，回填到modal中各个栏目中，作为初始默认数据)
        modal.find('.modal-title').text('modify dormitory administrator information')
        modal.find('#id').val(id)   // related to L201 - 203
        modal.find('#username').val(username)
        modal.find('#password').val(password)
        modal.find('#name').val(name)

        //  make judgement on gender
        var list = modal.find('.gender')
        for(var i=0;i<list.length;i++){
            if(gender == $(list.get(i)).val()){
                $(list.get(i)).prop('checked',true)
            }
        }
        modal.find('#telephone').val(telephone)

    })

    //  after clicking the delete button, get the id. the id is attached to the delete button
    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id') // get the id from the delete button
        var modal = $(this)
        modal.find('.modal-title').text('Delete dormitory admin information')
        modal.find('#deleteLabel').text('Do you confirm the delete of the information with id No.'+ id + "?" )
        modal.find('#id').val(id)   // attach the id info to the sheet
    })
</script>

</body>

</html>