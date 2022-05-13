<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <!--引入bootstrap-->
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap-theme.min.css"
          rel="stylesheet">
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.css" rel="stylesheet">
    <!--引入jquery-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">employee edit</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control"
                                   id="email_update_input" placeholder="powehi@powehi.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input"
                                       value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input"
                                       value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="emp_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">update</button>
            </div>
        </div>
    </div>
</div>

<%--员工添加的模态框--%>
<!-- Modal -->
<div id="empAddModel" class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body" id="empAndModal">
                <form class="form-horizontal" id="emp_save_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control"
                                   id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control"
                                   id="email_add_input" placeholder="powehi@powehi.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="W">
                                male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="M">
                                female
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-10">
                            <%--部门提交id--%>
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">submit</button>
            </div>
        </div>
    </div>
</div>
<!--搭建显示界面-->
<div class="Container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12 col-md-offset-1">
            <h1>SSM-CRUD BY XX</h1>
        </div>
    </div>
    <%--button--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-info" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-warning" id="emp_delete_modal_btn">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>operate</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
</body>
</html>


<script type="text/javascript">
  var totalRecord, currentPage;
  ;
  $(function () {
    to_page(1);
  });

  function build_emps_table(result) {
    //清空表格
    $("#emps_table tbody").empty();
    var emps = result.extend.pageInfo.list;
    $.each(emps, function (index, item) {
      var checkTd = $("<td><input type='checkbox' class='check_item'/></td>");
      var empIdTd = $("<td></td>").append(item.empId);
      var empNameTd = $("<td></td>").append(item.empName);
      var genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
      var emailTd = $("<td></td>").append(item.email);
      var deptNameTd = $("<td></td>").append(item.department.deptName);
      /**
       <button class="">
       <span class="" aria-hidden="true"></span>
       编辑
       </button>
       */
      var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
      .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
      //为编辑按钮添加一个自定义的属性，来表示当前员工id
      editBtn.attr("eid", item.empId);
      var delBtn = $("<button></button>").addClass("btn btn-warning btn-sm delete_btn")
      .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
      //为删除按钮添加一个自定义的属性来表示当前删除的员工id
      delBtn.attr("eid", item.empId);
      var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
      $("<tr></tr>").append(checkTd)
      .append(empIdTd)
      .append(empNameTd)
      .append(genderTd)
      .append(emailTd)
      .append(deptNameTd)
      .append(btnTd)
      .appendTo("#emps_table tbody");
    });
  }

  //解析显示分页信息
  function build_page_info(result) {
    $("#page_info_area").empty();
    $("#page_info_area").append(
        "第" + result.extend.pageInfo.pageNum + "页，共" + result.extend.pageInfo.pages + "页，"
        + result.extend.pageInfo.total + "条记录");
    totalRecord = result.extend.pageInfo.pages;
    currentPage = result.extend.pageInfo.pageNum;
  }

  //解析显示分页条
  function build_page_nav(result) {
    $("#page_nav_area").empty();
    var ul = $("<ul></ul>").addClass("pagination");
    var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
    var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
    if (!result.extend.pageInfo.hasPreviousPage) {
      firstPageLi.addClass("disabled")
      prePageLi.addClass("disabled")
    } else {
      firstPageLi.click(function () {
        to_page(1);
      });
      prePageLi.click(function () {
        to_page(result.extend.pageInfo.pageNum - 1);
      });
    }
    var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
    var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
    ul.append(firstPageLi).append(prePageLi);
    if (!result.extend.pageInfo.hasNextPage) {
      nextPageLi.addClass("disabled");
      lastPageLi.addClass("disabled");
    } else {
      nextPageLi.click(function () {
        to_page(result.extend.pageInfo.pageNum + 1);
      });
      lastPageLi.click(function () {
        to_page(result.extend.pageInfo.pages);
      });
    }
    $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
      var numLi = $("<li></li>").append($("<a></a>").append(item));
      if (result.extend.pageInfo.pageNum == item) {
        numLi.addClass("active");
      }
      numLi.click(function () {
        to_page(item);
      });
      ul.append(numLi);
    })
    ul.append(nextPageLi).append(lastPageLi);
    var navEle = $("<nav></nav>").append(ul);
    navEle.appendTo("#page_nav_area")
  }

  //发送请求
  function to_page(pn) {
    $.ajax({
      url: "${APP_PATH}/emps",
      data: "pn=" + pn,
      type: "get",
      success: function (result) {
        //解析并显示员工数据
        build_emps_table(result);
        //解析并显示分页信息
        build_page_info(result);
        build_page_nav(result)
      }
    });
  }

  //清除form表单
  function resetForm(ele) {
    $(ele)[0].reset();
    $(ele).removeClass("has-error has-success");
    $(ele).find(".help-block").text("");
  }

  //模态框的单击事件
  $("#emp_add_modal_btn").click(function () {
    resetForm("#empAndModal form");
    //发送ajax请求查取部门信息
    getDepts($("#dept_add_select"));
    //弹出模态框
    $("#empAddModel").modal({
      backdrop: 'static'
    })
  });

  //获取部门信息
  function getDepts(ele) {
    $(ele).empty();
    $.ajax({
      url: "${APP_PATH}/depts",
      type: "GET",
      success: function (result) {
        $.each(result.extend.depts, function (i, item) {
          var options = $("<option></option>").append(item.deptName).attr("value", item.deptId)
          options.appendTo(ele)
        })
      }
    })
  }

  //校验用户名是否重复
  $("#empName_add_input").change(function () {
    $.ajax({
      url: "${APP_PATH}/checkName?ename=" + $("#empName_add_input").val(),
      type: "GET",
      success: function (result) {
        var code = result.code;
        if (code === 200) {
          show_validate_msg($("#empName_add_input"), "error", result.extend.va_msg);
          $("#emp_save_btn").attr("ajax-va", "error");
        } else if (code === 100) {
          var reqresult = result.extend.result;
          if (reqresult === 200) {
            show_validate_msg($("#empName_add_input"), "error", "用户名已经存在");
            $("#emp_save_btn").attr("ajax-va", "error");
          } else {
            show_validate_msg($("#empName_add_input"), "success", "用户名可用");
            $("#emp_save_btn").attr("ajax-va", "success");
          }
        }

      }
    })
  })

  //保存员工信息按钮的监听事件
  $("#emp_save_btn").click(function () {
    //判断用户名是否合法，邮箱是否合法
    if (!checkRight()) {
      return false;
    }
    //判断button的属性是否可以保存（用户名校验通过）
    if ($(this).attr("ajax-va") === "error") {
      return false;
    }
    $.ajax({
      url: "${APP_PATH}/emp",
      type: "POST",
      data: $("#empAddModel form").serialize(),
      success: function (result) {
        if (result.code == 100) {
          //1.关闭模态框
          $("#empAddModel").modal('hide')
          //2.跳转最后一页显示数据
          //发送ajax请求去最后一个页码
          to_page(totalRecord);
        } else {
          if (undefined != result.extend.errorFields.emails) {
            show_validate_msg($("#email_add_input"), "error", result.extend.errorFields.emails);
          } else if (undefined != result.extend.errorFields.empName) {
            show_validate_msg($("#empName_add_input"), "error", result.extend.errorFields.empName);
          }
        }
      }
    })
  })

  //判断用户名是否重复
  function checkRight() {
    //1.拿到字段，邮箱使用正则
    var empName = $("#empName_add_input").val();
    var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
    if (!regName.test(empName)) {
      show_validate_msg($("#empName_add_input"), "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合")
      return false;
    } else {
      show_validate_msg($("#empName_add_input"), "success", "")
    }

    //2.校验邮箱
    var email = $("#email_add_input").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (!regEmail.test(email)) {
      show_validate_msg($("#email_add_input"), "error", "邮箱格式不正确")
      return false;
    } else {
      show_validate_msg($("#email_add_input"), "success", "")
    }
    return true;
  }

  /**
   * 检验信息方法抽取
   * @param ele
   * @param status
   * @param msg
   */
  function show_validate_msg(ele, status, msg) {
    $(ele).parent().removeClass("has-success has-error");
    $(ele).next("span").text("");
    if ("success" == status) {
      $(ele).parent().addClass("has-success")
      $(ele).next("span").text(msg)
    } else if ("error" == status) {
      $(ele).parent().addClass("has-error")
      $(ele).next("span").text(msg)
    }
  }

  //为所有的修改按钮添加单机事件
  //1、我们是按钮创建之前就绑定了click，所以绑定不上。
  //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
  //jquery新版没有live，使用on进行替代
  $(document).on("click", ".edit_btn", function () {
    getDepts($("#emp_update_select"));
    //弹出模态框
    $("#empUpdateModal").modal({
      backdrop: 'static'
    });
    var eid = $(this).attr("eid");
    getEmployee(eid);
  });

  //获取员工信息
  function getEmployee(id) {
    $.ajax({
      url: "${APP_PATH}/emp/" + id,
      method: "GET",
      success: function (result) {
        var empData = result.extend.emp;
        $("#empName_update_static").text(empData.empName);
        $("#email_update_input").val(empData.email);
        $("#empUpdateModal input[name=gender]").val([empData.gender]);
        $("#empUpdateModal select").val([empData.dId]);
        $("#emp_update_btn").attr("eid", empData.empId);
      }
    })
  }

  //更新员工表单的提交按钮
  $("#emp_update_btn").click(function () {
    //验证邮箱是否合法
    //1、校验邮箱信息
    var email = $("#email_update_input").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (!regEmail.test(email)) {
      show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
      return false;
    } else {
      show_validate_msg("#email_update_input", "success", "");
    }

    //2、发送ajax请求保存更新的员工数据
    $.ajax({
      url: "${APP_PATH}/emp/" + $(this).attr("eid"),
      type: "PUT",
      data: $("#empUpdateModal form").serialize(),
      success: function (result) {
        //alert(result.msg);
        //1、关闭对话框
        $("#empUpdateModal").modal("hide");
        //2、回到本页面
        to_page(currentPage);
      }
    });
  })

  //删除按钮添加事件监听器
  $(document).on("click", ".delete_btn", function () {
    var eid = $(this).attr("eid");
    var name = $(this).parents("tr").find("td:eq(2)").text();
    if (confirm("是否删除ID为:【" + eid + "】姓名为:" + name + "的员工吗?")) {
      $.ajax({
        url: "${APP_PATH}/emp/" + eid,
        method: "delete",
        success: function (result) {
          if (result.code == 100) {
            alert("删除成功！");
          } else {
            alert("删除失败！");
          }
          to_page(currentPage);
        }
      })
    }
  });

  //完成全选/全不选功能
  $("#check_all").click(function () {
    //attr获取checked是undefined;
    //我们这些dom原生的属性；attr获取自定义属性的值；
    //prop修改和读取dom原生属性的值
    $(".check_item").prop("checked", $(this).prop("checked"));
  });

  //check_item
  $(document).on("click", ".check_item", function () {
    //判断当前选择中的元素是否5个
    var flag = $(".check_item:checked").length == $(".check_item").length;
    $("#check_all").prop("checked", flag);
  });

  //总删除按钮的单击事件
  $("#emp_delete_modal_btn").click(function () {
    var empName="";
    var sendId = "";
    $.each($(".check_item:checked"),function () {
     empName+=$(this).parents("tr").find("td:eq(2)").text()+",";
     sendId+=$(this).parents("tr").find("td:eq(1)").text()+"-";
    });
    empName = empName.substring(0,empName.length-1);
    sendId = sendId.substring(0,sendId.length-1);
    if (confirm("确认删除【" + empName + "】吗？")) {
      $.ajax({
        url:"${APP_PATH}/emp/"+sendId,
        method:"POST",
        data:"_method=DELETE",
        success:function (result) {
          if (result.code == 100) {
            alert("删除成功！");
          } else {
            alert("删除失败！");
          }
          to_page(currentPage);
        }
      })
    }
  });
</script>
