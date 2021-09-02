
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../layui/css/layui.css" rel="stylesheet"   media="all">
    <link href="../other/css/back.css" rel="stylesheet"   media="all">
    <link href="../jqueryPlug/jqueryTpck/css/swiper.min.css" rel="stylesheet" type="text/css" />
    <link href="../jqueryPlug/jqueryTpck/css/app.css" type="text/css" rel="stylesheet" >

</head>
<style>
    /* 添加修改框添加右侧滑动条 */
    .div_Logistics{
        height: 540px;
        overflow-x:hidden;
        overflow-y: scroll ;
    }

</style>
<body style="background-color: white;">


<%--<form class="layui-form" action="" style="margin-top: 2%;">--%>

<%--    <div class="layui-form-item">--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">ID</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">商品名</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-inline">--%>
<%--            <button type="button" class="layui-btn">--%>
<%--                <i class="layui-icon">&#xe615;</i>--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</form>--%>
<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">  </fieldset>--%>

<div class="layui-form" style="padding: 0px 50px;margin-top: 50px">
    <div id="scroll-y">
        <table class="layui-table table_fixed">
            <thead>
            <tr>
                <th>ID</th>
                <th>商品名</th>
                <th>封面图</th>
                <th>单位</th>
                <th>价格</th>
                <th>促销价</th>
                <th>库存</th>
                <th>库存预警值</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${goodss}" var="goods">
                <c:if test="${goods.lowStock>goods.stock}">
                    <form lay-filter="${goods.goodsId}" class="${goods.goodsId}">
                        <tr>
                            <td><span>${goods.goodsId}</span></td>
                            <td><span>${goods.goodsName}</span></td>
                            <td>
                                <img src="..${goods.icon} " class="img_pic">
                            </td>
                            <td><span>${goods.unit}</span></td>
                            <td><span>${goods.price}</span></td>
                            <td>
                                <c:choose>
                                    <c:when test="${goods.promotionPrice!=0 && goods.discountStatus==1}">
                                        <span>${goods.promotionPrice}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span>无</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><span>${goods.stock}</span></td>
                            <td><span>${goods.lowStock}</span></td>
                        </tr>
                    </form>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${pageBean.totalCount>6}">
        <!-- 分页 -->
        <div class="paginatoin-area text-center" >
            <ul class="pagination-box">
                <c:choose>
                    <c:when test="${pageBean.currentPage==1}">
                        <li><a class="previoused"><i class="layui-icon layui-icon-left"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a class="previous" href="../bgoods/showInventory.action?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}"><i class="layui-icon layui-icon-left"></i></a></li>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                    <c:choose>
                        <c:when test="${pageBean.currentPage==i}">
                            <li class="active"><a href="../bgoods/showInventory.action?currentPage=${i}&rows=${pageBean.rows}">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="../bgoods/showInventory.action?currentPage=${i}&rows=${pageBean.rows}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                        <li><a class="next" href="../bgoods/showInventory.action?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}"><i class="layui-icon layui-icon-right"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a class="nexted"><i class="layui-icon layui-icon-right"></i></a></li>
                    </c:otherwise>
                </c:choose>
                <div class="div_pagination">&nbsp;&nbsp;
                    共&nbsp;<span>${pageBean.totalCount}</span>&nbsp;条记录,
                    共&nbsp;<span>${pageBean.totalPage}</span>&nbsp;页
                </div>
            </ul>
        </div>

    </c:if>

</div>


<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/back.js"></script>

<script src="../layui/layui.js" charset="utf-8"></script>


</body>
</html>