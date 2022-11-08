<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%--student move-out registger section     --%>
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
                    <form role="form" class="form-inline" action="/moveout/search" method="post">
                        <div class="form-group">
                            <label for="name">Field：</label>
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
                        <th>Operation</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.dormitoryName}</td>
                            <td>${student.number}</td>
                            <td>${student.name}</td>
                            <td>${student.gender}</td>
                            <td>${student.state}</td>
                            <td>
                                <%--    data-id, data-dormitory-id, data-toggle defined that when clicking "move-out" button, a modal window will be opened                       --%>
                                <%--    when clicking the button,  attach the student.id, student.dormitoryid to the button, will be got in L148-149--%>
                                <%-- dormitoryId will be attached to the modal window, but in the hidden input tag, then will be sent to back-end    --%>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger"
                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-toggle="modal"
                                            data-target="#delUserModal">
                                        <i class="fa fa-user-o">Move-out</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


                <!-- Modal window for student move-out pop-out window, realizing deleting function -->
                <%-- pop-out box when user clicks move-out button --%>
                <form method="post" action="/moveout/register" class="form-horizontal" style="margin-top: 0px" role="form" id="form_data" style="margin: 20px;">

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
                                                <input type="hidden" class="form-control" id="tab" name="tab" placeholder="" value="dor_admin">
                                                <input type="hidden" class="form-control" id="id" name="studentId" placeholder="">
                                                <input type="hidden" id="dormitoryId" name="dormitoryId">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Move-out reason</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" name="reason">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-danger">Move-out</button>
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
</div>


<script>
    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')  // get the property value of "id", L77
        var dormitoryId = button.data('dormitory-id')  // get the property value of "dormitory-id" L78
        var modal = $(this)

        modal.find('.modal-title').text('student move-out register')  // the text go to L103
        modal.find('#deleteLabel').text('move out the student with id:  ' + id )  // the text go to L109
        // when opening the modal window, put the id, dormitoryId data to the hidden tag, L111 - 112 then when clicking ok, send to the back-end
        modal.find('#id').val(id)
        modal.find('#dormitoryId').val(dormitoryId)
    })
</script>

</body>

</html>