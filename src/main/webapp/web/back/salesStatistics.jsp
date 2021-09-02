
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>销售统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <link href="../other/css/back.css" rel="stylesheet"   media="all">

</head>
<body style="background-color: white;">


<form class="layui-form" action="../back/showSalesStatistics.action" lay-filter="dayy"style="margin-top: 2%;">

<%--    <div class="layui-form">--%>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">日期</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test10" placeholder=" - " name="days">
                </div>
            </div>
            <div class="layui-inline">
                <button type="submit" class="layui-btn">确定</button>
            </div>
        </div>
<%--    </div>--%>

    </div>

</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">  </fieldset>
<input id="day1" value="${day1}" type="hidden">
<input id="day2" value="${day2}" type="hidden">
<div class="layui-form" style="padding: 0px 50px;">
    <c:if test="${empty goodsList}">
        暂无
    </c:if>
    <c:if test="${not empty goodsList}">

        <table class="layui-table" >
            <thead>
            <tr>
                <th>id</th>
                <th>商品名</th>
                <th>封面图</th>
                <th>规格</th>
                <th>销量</th>
                <th>单价（元）</th>
                <th>销售总金额（元）</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${goodsList}" var="goods">
                <tr>
                    <td>${goods.goodsId}</td>
                    <td>${goods.goodsName}</td>
                    <td><img src="..${goods.icon}" class="img_pic"></td>
                    <td>${goods.spec}</td>
                    <td>${goods.sale}</td>
                    <td>${goods.price}</td>
                    <td>${goods.sale*goods.price}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <!-- 分页 -->
        <c:if test="${pageBean.totalCount>6}">
            <!-- 分页 -->
            <div class="paginatoin-area text-center" >
                <ul class="pagination-box">
                    <c:choose>
                        <c:when test="${pageBean.currentPage==1}">
                            <li><a class="previoused"><i class="layui-icon layui-icon-left"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="previous" href="../back/showSalesStatistics.action?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}"><i class="layui-icon layui-icon-left"></i></a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                        <c:choose>
                            <c:when test="${pageBean.currentPage==i}">
                                <li class="active"><a href="../back/showSalesStatistics.action?currentPage=${i}&rows=${pageBean.rows}&days=${days}">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="../back/showSalesStatistics.action?currentPage=${i}&rows=${pageBean.rows}&days=${days}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                            <li><a class="next" href="../back/showSalesStatistics.action?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&days=${days}"><i class="layui-icon layui-icon-right"></i></a></li>
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
    </c:if>

</div>

<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代到本地，上述 JS 路径需要改成你本地的 -->

<script>
    layui.use(['form', 'layedit', 'laydate','upload','laypage'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload
            ,$=layui.$
            ,laypage = layui.laypage;

        var day1=$('#day1').val();
        var day2=$('#day2').val();
        laydate.render({
            elem: '#test10'
            ,type: 'date'
            ,range: true
        });
        if(day1!=null && day1!=''){
            form.val('dayy', {
                // ,"promotionTime": '2020-01-01 13:34:45'+' - '+'2020-03-03 10:30:40'
                "days": day1+' - '+day2
            });
        }





        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function(){
            form.val('example', {
                "username": "贤心" // "name": "value"
                ,"password": "123456"
                ,"interest": 1
                ,"like[write]": true //复选框选中状态
                ,"close": true //开关状态
                ,"sex": "女"
                ,"desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</body>
</html>