<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <!--引入bootstrap-->
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap-theme.min.css" rel="stylesheet"  >
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.css" rel="stylesheet"  >
    <!--引入jquery-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
</head>
<body>
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
            <button class="btn btn-info">新增</button>
            <button class="btn btn-warning">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12" >
            <table class="table table-hover table-bordered">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list }" var="emp">
                    <tr>
                        <th>${emp.empId }</th>
                        <th>${emp.empName }</th>
                        <th>${emp.gender=="M"?"男":"女" }</th>
                        <th>${emp.email }</th>
                        <th>${emp.department.deptName }</th>
                        <th>
                            <button class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-warning btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            第${pageInfo.pageNum}页，共${pageInfo.pages}页，${pageInfo.total}条记录
        </div>
        <%--分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.pageNum!=pageInfo.navigateFirstPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="0" items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num==pageInfo.pageNum}">
                            <li class="active"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a> </li>
                        </c:if>
                        <c:if test="${page_Num!=pageInfo.pageNum}">
                            <li ><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a> </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.navigateLastPage!=pageInfo.pageNum}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>