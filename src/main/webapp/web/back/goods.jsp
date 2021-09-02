<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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


<form class="layui-form" action="../bgoods/showGoods.action" style="margin-top: 2%;">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="gid" autocomplete="off" class="layui-input" value="${gid}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">商品名</label>
            <div class="layui-input-inline">
                <input type="text" name="gname" autocomplete="off" class="layui-input" value="${gname}">
            </div>
        </div>
        <div class="layui-inline">
            <button type="submit" class="layui-btn">
                <i class="layui-icon">&#xe615;</i>
            </button>
        </div>
    </div>

</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">  </fieldset>
<c:if test="${empty goodss}">
    <span>暂无</span>
</c:if>
<c:if test="${not empty goodss}">
    <div class="layui-form" >
        <div style="margin-left: 20px;">
            <button type="button" class="layui-btn" id="add-btn">添加</button>
            <button type="button" class="layui-btn" id="del-btn">删除</button>
        </div>
        <div id="scroll-y">
            <table class="layui-table table_fixed">
                <thead>
                <tr>
                    <th style="width: 60px;"><input type="checkbox" lay-skin="primary" class="allcb" lay-filter="check_all"/></th>
                    <th >商品名</th>
                    <th>ID</th>
                    <th>封面图</th>
                    <th>主图</th>
                    <th>副图</th>
                    <th>标题</th>
                    <th>评分</th>
                    <th>简述</th>
                    <th>价格</th>
                    <th>库存</th>
                    <th>库存预警值</th>
                    <th>规格</th>
                    <th>销量</th>
                    <th>单位</th>
                    <th>商品重量</th>
                    <th>商品描述</th>
                    <th>画册图片</th>
                    <th>促销价格</th>
                    <th>促销开始时间</th>
                    <th>促销结束时间</th>
                    <th>活动限购数量</th>
                    <th>上架状态</th>
                    <th>新品状态</th>
                    <th>推荐状态</th>
                    <th>促销状态</th>
                    <th>商品分类ID</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${goodss}" var="goods">
                    <form lay-filter="${goods.goodsId}" class="${goods.goodsId}">
                        <tr>
                            <td>
                                <input type="checkbox"  lay-skin="primary" lay-filter="authority" class="authority"name="cb" value="${goods.id}">
                            </td>
                            <td><span>${goods.goodsName}</span></td>
                            <td><span>${goods.goodsId}</span></td>
                            <td>
                                <div class="list">
                                    <div class="post">
                                        <img src="..${goods.icon} " class="img_pic">
                                    </div>
                                </div>

                            </td>
                            <td>
                                <div class="list">
                                    <div class="post">
                                        <c:set var="pic" value="${goods.pic}"/>
                                        <c:choose>
                                            <c:when test="${fn:contains(pic,',')}">
                                                <c:forTokens items="${goods.pic}" begin="1"  delims="," var="picc" >
                                                    <c:forTokens items="${goods.pic}" begin="0"  end="0" delims="," var="pic" >
                                                        <img src="..${pic}${picc} " class="img_pic">
                                                    </c:forTokens>
                                                </c:forTokens>

                                            </c:when>
                                            <c:otherwise>
                                                <img src="..${goods.pic}" class="img_pic">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                            </td>
                            <td>
                                <div class="list">
                                    <div class="post">
                                        <c:set var="subPic" value="${goods.subPic}"/>
                                        <c:choose>
                                            <c:when test="${fn:contains(subPic,',')}">
                                                <c:forTokens items="${goods.subPic}" begin="1"  delims="," var="picc" >
                                                    <c:forTokens items="${goods.subPic}" begin="0"  end="0" delims="," var="pic" >
                                                        <img src="..${pic}${picc} " class="img_pic">
                                                    </c:forTokens>
                                                </c:forTokens>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="..${goods.subPic}" class="img_pic">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </td>
                            <td class="partially_hidden">
                                <div class="no_wrap">
                                    <span>${goods.title}</span>
                                </div>

                            </td>
                            <td><span>${goods.grade}</span></td>
                            <td class="partially_hidden">
                                <div class="no_wrap">
                                    <span>${goods.simpleDesc}</span>
                                </div>
                            </td>
                            <td><span>${goods.price}</span></td>
                            <td><span>${goods.stock}</span></td>
                            <td><span>${goods.lowStock}</span></td>
                            <td><span>${goods.spec}</span></td>
                            <td><span>${goods.sale}</span></td>
                            <td><span>${goods.unit}</span></td>
                            <td><span>${goods.weight}</span></td>
                            <td class="partially_hidden">
                                <div class="no_wrap">
                                    <span>${goods.description}</span>
                                </div>
                            </td>
                            <td>
                                <div class="list">
                                    <div class="post">
                                        <c:set var="albumPics" value="${goods.albumPics}"/>
                                        <c:choose>
                                            <c:when test="${fn:contains(albumPics,',')}">
                                                <c:forTokens items="${goods.albumPics}" begin="1"  delims="," var="picc" >
                                                    <c:forTokens items="${goods.albumPics}" begin="0"  end="0" delims="," var="pic" >
                                                        <img src="..${pic}${picc} " class="img_pic">
                                                    </c:forTokens>
                                                </c:forTokens>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="..${goods.albumPics}" class="img_pic">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                            </td>
                            <td><span>${goods.promotionPrice}</span></td>
                            <td><span><fmt:formatDate value="${goods.promotionStartTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
                            <td><span><fmt:formatDate value="${goods.promotionEndTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
                            <td><span>${goods.promotionPerLimit}</span></td>
                            <td>
                                <c:choose>
                                    <c:when test="${goods.publishStatus==1}">
                                        <input type="checkbox" name="publishStatus" lay-skin="switch" lay-filter="publishStatus" lay-text="是|否" value="${goods.publishStatus}" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="publishStatus" lay-skin="switch" lay-filter="publishStatus" lay-text="是|否" value="${goods.publishStatus}">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${goods.newStatus==1}">
                                        <input type="checkbox" name="newStatus" lay-skin="switch" lay-filter="newStatus" lay-text="是|否" value="${goods.newStatus}" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="newStatus" lay-skin="switch" lay-filter="newStatus" lay-text="是|否" value="${goods.newStatus}">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${goods.recommandStatus==1}">
                                        <input type="checkbox" name="recommandStatus" lay-skin="switch" lay-filter="recommandStatus" lay-text="是|否" value="${goods.recommandStatus}" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="recommandStatus" lay-skin="switch" lay-filter="recommandStatus" lay-text="是|否" value="${goods.recommandStatus}">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${goods.discountStatus==1}">
                                        <input type="checkbox" name="discountStatus" lay-skin="switch" lay-filter="discountStatus" lay-text="是|否" value="${goods.discountStatus}" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="discountStatus" lay-skin="switch" lay-filter="discountStatus" lay-text="是|否" value="${goods.discountStatus}">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><span>${goods.categoryId}</span></td>
                            <td>
                                <span><fmt:formatDate value="${goods.updTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                            </td>
                            <td>
                                <button type="button" class="layui-btn layui-btn-xs btn-edit">编辑</button>
                                <button type="button" class="layui-btn layui-btn-danger layui-btn-xs btn-del">删除</button>
                            </td>
                        </tr>
                    </form>

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
                            <li><a class="previous" href="../bgoods/showGoods.action?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}&gid=${gid}&gname=${gname}"><i class="layui-icon layui-icon-left"></i></a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                        <c:choose>
                            <c:when test="${pageBean.currentPage==i}">
                                <li class="active"><a href="../bgoods/showGoods.action?currentPage=${i}&rows=${pageBean.rows}&gid=${gid}&gname=${gname}">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="../bgoods/showGoods.action?currentPage=${i}&rows=${pageBean.rows}&gid=${gid}&gname=${gname}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                            <li><a class="next" href="../bgoods/showGoods.action?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&gid=${gid}&gname=${gname}"><i class="layui-icon layui-icon-right"></i></a></li>
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
</c:if>

<!-- 添加 -->
<div class="addmodal" >
    <div class="layui-card " id="add-modal-dialog" >
        <div class="layui-card-header" style="background-color: #eee;">添加<button  class="layui-icon btn_x" id="add-btn-x" >&#x1007;</button> </div>
        <div class="layui-card-body div_Logistics">
            <form class="layui-form layui-form-pane" action="../bgoods/insertGoods" lay-filter="add-example">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">ID</label>
                        <div class="layui-input-inline">
                            <input type="text" name="goodsId" autocomplete="off" class="layui-input" id="add-userid" lay-verify="required|number|len">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">商品名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="goodsName"  autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-inline">
                            <input type="text" name="title"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">封面图</label>
                        <div class="layui-input-inline">
                            <div class="add-icon">
                                <input type="hidden" name="icon">
                                <div class="img-wrapper" style="display: none">
                                    <img src="" class="img_pic">
                                    <i class="layui-icon img-close">&#x1007;</i>
                                </div>
                                <button type="button" class="layui-btn" id="add-icon-img" style="margin-left:10px">上传图片</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">主图</label>
                    <div class="layui-input-block" style="margin-right: 20px;">
                        <div class="add-pic">
                            <input type="hidden" name="pic">
                            <button type="button" class="layui-btn" id="add-pic-img" style="margin:0px 10px">上传图片</button>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">副图</label>
                    <div class="layui-input-block">
                        <div class="add-subPic">
                            <input type="hidden" name="subPic">
                            <button type="button" class="layui-btn" id="add-subPic-img" style="margin-left:10px">上传图片</button>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">简述</label>
                    <div class="layui-input-block">
                        <input type="text" name="simpleDesc"  autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="price"  autocomplete="off" class="layui-input" lay-verify="required|number">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">规格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="spec"  autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">库存</label>
                        <div class="layui-input-inline">
                            <input type="text" name="stock"  autocomplete="off" class="layui-input" lay-verify="required|number">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">库存预警值</label>
                        <div class="layui-input-inline">
                            <input type="text" name="lowStock"  autocomplete="off" class="layui-input" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">单位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="unit"  autocomplete="off" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">商品重量</label>
                        <div class="layui-input-inline">
                            <input type="text" name="weight"  autocomplete="off" class="layui-input" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">商品分类id</label>
                        <div class="layui-input-inline">
                            <input type="text" name="categoryId"  autocomplete="off" class="layui-input" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">画册图片</label>
                    <div class="layui-input-block">
                        <div class="add-albumPics">
                            <input type="hidden" name="albumPics">
                            <button type="button" class="layui-btn" id="add-albumPics-img" style="margin-left:10px">上传图片</button>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">商品描述</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" name="description" class="layui-textarea"></textarea>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">上架状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="publishStatus" lay-skin="switch" lay-text="是|否" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">新品状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="newStatus" lay-skin="switch" lay-text="是|否" >
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">推荐状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="recommandStatus" lay-skin="switch" lay-text="是|否" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">促销状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="discountStatus" lay-skin="switch" lay-text="是|否"  class="cb_discount" lay-filter="cb_discount" lay-skin="switch" >
                        </div>
                    </div>
                </div>
                <div class="hidden_promotion">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">促销价格</label>
                            <div class="layui-input-inline">
                                <input type="text" name="promotionPrice"  autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">限购数量</label>
                            <div class="layui-input-inline">
                                <input type="text" name="promotionPerLimit"  autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">促销时间</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="promotionTime" id="add-promotion-time" placeholder=" - ">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-left: 150px;">
                    <div class="layui-input-block">
                        <button class="layui-btn "  lay-submit lay-filter="add-submit">确认</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<!-- 修改 -->
<div class="updatemodal" >
    <div class="layui-card " id="upd-modal-dialog" >
        <div class="layui-card-header" style="background-color: #eee;">修改<button  class="layui-icon btn_x" id="upd-btn-x" >&#x1007;</button> </div>
        <div class="layui-card-body div_Logistics" >
            <form class="layui-form layui-form-pane" action="../bgoods/updGoods" lay-filter="upd-example">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">ID</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="hGoodsId">
                            <input type="text" name="goodsId"  autocomplete="off" class="layui-input" id="upd-userid">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">商品名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="goodsName"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-inline">
                            <input type="text" name="title"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">封面图</label>
                        <div class="layui-input-inline">
                            <div class="upd-icon">
                                <input type="hidden" name="icon">
                                <button type="button" class="layui-btn" id="upd-icon-img" style="margin-left:10px">上传图片</button>
                            </div>
<%--                            <img src="..{{d.icon}}"  class="img_icon" style="margin-left: 20px;margin-right: 10px;" >--%>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">主图</label>
                    <div class="layui-input-block" style="margin-right: 20px;">
                        <div class="upd-pic">
                            <input type="hidden" name="pic">
                            <button type="button" class="layui-btn" id="upd-pic-img" style="margin-left:10px">上传图片</button>
                        </div>

                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">副图</label>
                    <div class="layui-input-block">
                        <div class="upd-subPic">
                            <button type="button" class="layui-btn" id="upd-subPic-img" style="margin-left:10px">上传图片</button>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">简述</label>
                    <div class="layui-input-block">
                        <input type="text" name="simpleDesc"  autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="price"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">规格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="spec"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">库存</label>
                        <div class="layui-input-inline">
                            <input type="text" name="stock"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">库存预警值</label>
                        <div class="layui-input-inline">
                            <input type="text" name="lowStock"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">单位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="unit"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">商品重量</label>
                        <div class="layui-input-inline">
                            <input type="text" name="weight"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">商品分类id</label>
                        <div class="layui-input-inline">
                            <input type="text" name="categoryId"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">画册图片</label>
                    <div class="layui-input-block">
                        <div class="upd-albumPics">
                            <button type="button" class="layui-btn" id="upd-albumPics-img" style="margin-left:10px">上传图片</button>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">商品描述</label>
                    <div class="layui-input-block">
                        <textarea  name="description" class="layui-textarea"></textarea>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">上架状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="publishStatus" lay-skin="switch" lay-text="是|否" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">新品状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="newStatus" lay-skin="switch" lay-text="是|否" >
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">推荐状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="recommandStatus" lay-skin="switch" lay-text="是|否" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">促销状态</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="discountStatus" lay-skin="switch" lay-text="是|否"  class="cb_discount" lay-filter="cb_discount" lay-skin="switch" >
                        </div>
                    </div>
                </div>
                <div class="hidden_promotion">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">促销价格</label>
                            <div class="layui-input-inline">
                                <input type="text" name="promotionPrice"  autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">限购数量</label>
                            <div class="layui-input-inline">
                                <input type="text" name="promotionPerLimit"  autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">促销时间</label>
                        <div class="layui-input-block">
                            <input type="text" name="promotionTime" class="layui-input" id="upd-promotion-time" placeholder=" - " >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-left: 150px;">
                    <div class="layui-input-block">
                        <button class="layui-btn "  lay-submit lay-filter="upd-submit">确认</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<div class="big_img">
    <div class="swiper-container2">
        <div class="swiper-wrapper"> </div>
    </div>
</div>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../other/js/back.js"></script>

<script src="../layui/layui.js" charset="utf-8"></script>

<script src="../jqueryPlug/jqueryTpck/js/swiper.min.js" type="text/javascript" ></script>
<script src="../jqueryPlug/jqueryTpck/js/bigImg.js" type="text/javascript" ></script>
<script>
    // 删除图片
    $(document).on('click','.img-wrapper .img-close',function(){
        // layer.msg('sdas');
        // $('.img-wrapper').hide();
        $(this).parent().remove();
    });
</script>
<script>
    $(function(){
        //折扣开关开显示内容，开关关不显示内容
        var cb_discount=$('.cb_discount').val();
        if(cb_discount==1){
            $('.hidden_promotion').show();
        }else{
            $('.hidden_promotion').hide();
        }
    })
    Date.prototype.format = function(fmt)
    {
        var o = {
            "M+" : this.getMonth()+1, //月份
            "d+" : this.getDate(), //日
            "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
            "H+" : this.getHours(), //小时
            "m+" : this.getMinutes(), //分
            "s+" : this.getSeconds(), //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S" : this.getMilliseconds() //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }
    //编辑按钮
    $('.btn-edit').on('click',function(){
        var goodsId=$(this).parent().parent().find('td').eq(2).children().text();
        $.ajax({
            type:"POST",
            url:"../bgoods/selectGoods",
            data:"gid="+goodsId,
            success: function(obj){
                if(obj.state===1){
                    var sTime=obj.data.promotionStartTime;
                    var eTime=obj.data.promotionEndTime;
                    var start=new Date(obj.data.promotionStartTime);
                    var end=new Date(obj.data.promotionEndTime);
                    var startTime="";
                    var endTime="";
                    if ((sTime!=null && eTime!=null) &&(sTime!="" && eTime!="") ){
                        startTime=start.format("yyyy-MM-dd hh:mm:ss");
                        endTime=end.format("yyyy-MM-dd hh:mm:ss");
                    }
                    layui.use(['form'], function(){
                        var form = layui.form
                            ,layer = layui.layer
                            ,$=layui.jquery;
                        form.val('upd-example', {
                            "goodsId": obj.data.goodsId// "name""value"
                            ,"hGoodsId": obj.data.goodsId// "name""value"
                            ,"goodsName": obj.data.goodsName
                            ,"title": obj.data.title
                            ,"icon": obj.data.icon
                            ,"simpleDesc": obj.data.simpleDesc
                            ,"price": obj.data.price
                            ,"spec": obj.data.spec
                            ,"stock": obj.data.stock
                            ,"lowStock": obj.data.lowStock
                            ,"unit": obj.data.unit
                            ,"weight": obj.data.weight
                            ,"categoryId": obj.data.categoryId
                            ,"description": obj.data.description
                            ,"publishStatus": obj.data.publishStatus==1?true:false
                            ,"newStatus": obj.data.newStatus==1?true:false
                            ,"recommandStatus": obj.data.recommandStatus==1?true:false
                            ,"discountStatus": obj.data.discountStatus==1?true:false
                            ,"promotionPrice": obj.data.promotionPrice
                            ,"promotionPerLimit": obj.data.promotionPerLimit
                            // ,"promotionTime": '2020-01-01 13:34:45'+' - '+'2020-03-03 10:30:40'
                            ,"promotionTime": startTime+' - '+endTime
                        });

                        //alert(JSON.stringify(data));
                    });
                    $('.upd-icon').find('.img-wrapper').remove();
                    if (obj.data.icon.length>0){
                        $('.upd-icon').append(
                            '<div class="img-wrapper">'+
                            '<img src="'+'..'+ obj.data.icon +'" class="img_pic">'+
                            '<i class="layui-icon img-close">&#x1007;</i>'+
                            '</div>'
                        );
                    }
                    $('.updatemodal').find('.hidden_promotion').hide();
                    //折扣开关为开，显示折扣内容
                    if ($('.updatemodal').find('.cb_discount').is(':checked')){
                        $('.updatemodal').find('.hidden_promotion').show();
                    }
                    //图片动态赋值
                    imgExport(obj.data.pic,'.upd-pic');
                    imgExport(obj.data.subPic,'.upd-subPic');
                    imgExport(obj.data.albumPics,'.upd-albumPics');

                }else{
                    layer.msg("失败");
                }
            },
            //请求失败
            error:function()
            {
                //错误处理
                alert("系统异常");
            }
        });

        $('.updatemodal').show();
    });
    //图片动态赋值
    function imgExport(data,path){
        $(path).find('.img-wrapper').remove();
        var arr=new Array();
        arr=data.split(',');
        for(var i=1;i<arr.length;i++) {
            var src=arr[0]+arr[i];
            // layer.msg("src:"+src)
            $(path).append(
                '<div class="img-wrapper">'+
                '<img src="'+'..'+ src +'" class="img_pic">'+
                '<i class="layui-icon img-close">&#x1007;</i>'+
                '</div>'
            );
        }

    }
</script>
<!-- 删除+批量删除-->
<script type="text/javascript">
    //删除
    $('.btn-del').on('click',function(){
        var id=$(this).parent().siblings().eq(0).children().val();
        // layer.msg("id:"+id);
        layer.confirm('确定是否删除', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                type:"POST",
                url:"../bgoods/delGoods",
                data:"ids="+id,
                success: function(obj){
                    if(obj.code==0){
                        layer.msg("删除成功");
                        setTimeout( 'window.location.href="../bgoods/showGoods.action"',200);
                    }else{
                        layer.msg("删除失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        });

    });
    $('#del-btn').on('click',function(){
        var cbs=$("input[name=cb]");
        var len = new Array();
        //alert("2");
        //遍历
        cbs.each(function() {
            if ($(this).is(':checked')){
                len.push($(this).val());
            }
        });
        if(len.length==0){
            layer.msg('未选中');
        }else{
            layer.confirm('确定是否删除', {
                btn: ['确定','取消'] //按钮
            }, function(){
                var ids=len.toString();
                // layer.msg('ids:'+ids);
                $.ajax({
                    type:"POST",
                    url:"../bgoods/delGoods",
                    data:"ids="+ids,
                    success: function(obj){
                        if(obj.code==0){
                            layer.msg("删除成功");
                            setTimeout( 'window.location.href="../bgoods/showGoods.action"',200);
                        }else{
                            layer.msg("删除失败");
                        }
                    },
                    //请求失败
                    error:function()
                    {
                        //错误处理
                        alert("系统异常");
                    }
                });
            });
        }

    });

</script>
<script>
    layui.use(['form', 'layedit', 'laydate','upload','laypage','rate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload
            ,laypage = layui.laypage
            ,rate = layui.rate
            ,$=layui.jquery;
        //只读评分
        rate.render({
            elem: '#start'
            ,value: 4
            ,readonly: true
        });
        //日期范围
        laydate.render({
            elem: '#upd-promotion-time'
            ,type: 'datetime'
            ,range: true
        });
        laydate.render({
            elem: '#add-promotion-time'
            ,type: 'datetime'
            ,range: true
            ,
        });

        // 实现 全选 反选
        form.on('checkbox(check_all)',function(data){
            $('.layui-table').find("td").find("input[name=cb]").prop("checked",this.checked);
            form.render('checkbox');
        });
        /**
         * 以下代码实现:
         * 1 当子项全部选中时,全选被选中
         * 2 当子项未全部选中时,全选不选中
         */
        form.on('checkbox(authority)',function(data){
            var item = $(".authority");
            var sum=0;
            for(var i=0;i<item.length;i++){
                if(item[i].checked == false){
                    $(".allcb").prop("checked", false);
                    form.render('checkbox');
                }
                else{
                    sum++;
                }
            }
            if(sum==item.length){
                $(".allcb").prop("checked", true);
                form.render('checkbox');
            }
        });

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#add-icon-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,data: {
                goodsId: function () {
                    return $('#add-userid').val();
                },
                folder:"icon"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#add-icon').attr('src', result); //图片链接（base64）
                // });
            }
            ,done: function(res){
                //如果上传失败
                // if(res.code > 0){
                //     return layer.msg('上传失败');
                // }
                //上传成功
                if ($('.add-icon img').length==0){
                    $('.add-icon').append(
                        '<div class="img-wrapper">'+
                        '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                        '<i class="layui-icon img-close">&#x1007;</i>'+
                        '</div>'
                    );
                }else{
                    $('.add-icon').find('.img-wrapper').show();
                    $('.add-icon img').attr('src', '..'+res.icon);
                }
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        var uploadInst = upload.render({
            elem: '#upd-icon-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,data: {
                goodsId: function () {
                    return $('#upd-userid').val();
                },
                folder:"icon"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#upd-icon').attr('src', result); //图片链接（base64）
                // });
            }
            ,done: function(res){
                //如果上传失败
                // if(res.code > 0){
                //     return layer.msg('上传失败');
                // }
                //上传成功
                if ($('.upd-icon img').length==0){
                    $('.upd-icon').append(
                        '<div class="img-wrapper">'+
                        '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                        '<i class="layui-icon img-close">&#x1007;</i>'+
                        '</div>'

                    );
                }else{
                    $('.upd-icon img').attr('src', '..'+res.icon);
                }

            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //多图片上传
        //主图
        upload.render({
            elem: '#upd-pic-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,multiple: true
            ,data: {
                goodsId: function () {
                    return $('#upd-userid').val();
                },
                folder:"pic"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                // });
            }
            ,done: function(res){
                //上传完毕
                $('.upd-pic').append(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });

        upload.render({
            elem: '#add-pic-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,multiple: true
            ,data: {
                goodsId: function () {
                    return $('#add-userid').val();
                },
                folder:"pic"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('.add-pic').append('<div class="img-wrapper">'+'<img src="'+ result +'" alt="'+ file.name +'" class="img_pic">'+'<i class="layui-icon img-close">&#x1007;</i>' +
                //         '</div>')
                // });
            }
            ,done: function(res){
                //上传完毕
                $('.add-pic').append(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });
        //副图
        upload.render({
            elem: '#add-subPic-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,multiple: true
            ,data: {
                goodsId: function () {
                    return $('#add-userid').val();
                },
                folder:"subPic"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                // });
            }
            ,done: function(res){
                //上传完毕
                $('.add-subPic').append(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });
        upload.render({
            elem: '#upd-subPic-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,multiple: true
            ,data: {
                goodsId: function () {
                    return $('#upd-userid').val();
                },
                folder:"subPic"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                // });
            }
            ,done: function(res){
                //上传完毕
                $('.upd-subPic').append(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });

        //画册图片
        upload.render({
            elem: '#add-albumPics-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,multiple: true
            ,data: {
                goodsId: function () {
                    return $('#add-userid').val();
                },
                folder:"albumPics"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                // });
            }
            ,done: function(res){
                //上传完毕
                $('.add-albumPics').append(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });
        upload.render({
            elem: '#upd-albumPics-img'
            ,url: '../bgoods/updIcon' //改成您自己的上传接口
            ,multiple: true
            ,data: {
                goodsId: function () {
                    return $('#upd-userid').val();
                },
                folder:"albumPics"
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                // obj.preview(function(index, file, result){
                //     $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                // });
            }
            ,done: function(res){
                //上传完毕
                $('.upd-albumPics').append(
                    '<div class="img-wrapper">'+
                    '<img src="'+'..'+ res.icon +'" class="img_pic">'+
                    '<i class="layui-icon img-close">&#x1007;</i>'+
                    '</div>'
                );
            }
        });

        //日期
        laydate.render({
            elem: '#add-createTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#upd-createTime'
            ,type: 'datetime'
        });

        //监听指定开关
        form.on('switch(cb_discount)', function(data){
            if(this.checked){
                this.value=1;
                $('.hidden_promotion').show(400);
                // layer.msg("v:"+this.value);
            }else{
                this.value=0;
                $('.hidden_promotion').hide(400);
                // layer.msg("v:"+this.value);
            }
            // layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
            // offset: '6px'
            // });
            // layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });
        //监听指定开关
        form.on('switch(publishStatus)', function(data){
            var id=$(this).parent().parent().find('input[name=cb]').val();
            var status = this.checked;
            if (status===true){
                status=1;
            }else{
                status=0;
            }
            $.ajax({
                type:"POST",
                url:"../bgoods/updStatus",
                data:"id="+id+"&status="+status+"&st="+"P",
                success: function(obj){
                    if(obj.code==0){
                        layer.msg("修改成功");
                        //setTimeout( 'window.location.href="../back/showUser.action"',200);
                    }else{
                        layer.msg("删除失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        });

        form.on('switch(newStatus)', function(data){
            var id=$(this).parent().parent().find('input[name=cb]').val();
            var status = this.checked;
            if (status===true){
                status=1;
            }else{
                status=0;
            }
            $.ajax({
                type:"POST",
                url:"../bgoods/updStatus",
                data:"id="+id+"&status="+status+"&st="+"N",
                success: function(obj){
                    if(obj.code==0){
                        layer.msg("修改成功");
                        //setTimeout( 'window.location.href="../back/showUser.action"',200);
                    }else{
                        layer.msg("删除失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        });
        form.on('switch(recommandStatus)', function(data){
            var id=$(this).parent().parent().find('input[name=cb]').val();
            var status = this.checked;
            if (status===true){
                status=1;
            }else{
                status=0;
            }
            $.ajax({
                type:"POST",
                url:"../bgoods/updStatus",
                data:"id="+id+"&status="+status+"&st="+"R",
                success: function(obj){
                    if(obj.code==0){
                        layer.msg("修改成功");
                        //setTimeout( 'window.location.href="../back/showUser.action"',200);
                    }else{
                        layer.msg("删除失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        });
        form.on('switch(discountStatus)', function(data){
            var id=$(this).parent().parent().find('input[name=cb]').val();
            var status = this.checked;
            if (status===true){
                status=1;
            }else{
                status=0;
            }
            $.ajax({
                type:"POST",
                url:"../bgoods/updStatus",
                data:"id="+id+"&status="+status+"&st="+"D",
                success: function(obj){
                    if(obj.code==0){
                        layer.msg("修改成功");
                        //setTimeout( 'window.location.href="../back/showUser.action"',200);
                    }else{
                        layer.msg("删除失败");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        });
        //监听提交
        form.on('submit(add-submit)', function(data){
            var icon=picturePath('.add-icon img');
            var pic= picturePath('.add-pic img');
            var subPic= picturePath('.add-subPic img');
            var albumPics= picturePath('.add-albumPics img');
            $('.add-icon').find('input[name=icon]').val(icon);
            $('.add-pic').find('input[name=pic]').val(pic);
            $('.add-subPic').find('input[name=subPic]').val(subPic);
            $('.add-albumPics').find('input[name=albumPics]').val(albumPics);
            // layer.alert("icon:"+icon+"  :pi:"+pic+"  :subPic:"+subPic+"      :albumPics:"+albumPics);
            var goodsId=data.field.goodsId;
            var boole=false;
            $.ajax({
                type:"GET",
                url:"../bgoods/checkGoodsId",
                async: false,//加这个ajax就可以修改全局变量了
                data:"goodsId="+goodsId,
                //状态：请求成功
                success:function(obj)// msg:响应信息
                {
                    //alert(obj.message);
                    if(obj.message ==="yes"){
                        boole=true;
                        // layer.msg('成功');
                    }else if(obj.message === 'no'){
                        layer.msg(obj.data);
                    }else {
                        layer.msg("系统异常");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
            return boole;
        });

        //监听提交
        form.on('submit(upd-submit)', function(data){
            var icon=picturePath('.upd-icon img');
            var pic= picturePath('.upd-pic img');
            var subPic= picturePath('.upd-subPic img');
            var albumPics= picturePath('.upd-albumPics img');
            $('.upd-icon').find('input[name=icon]').val(icon);
            $('.upd-pic').find('input[name=pic]').val(pic);
            $('.upd-subPic').find('input[name=subPic]').val(subPic);
            $('.upd-albumPics').find('input[name=albumPics]').val(albumPics);
            // layer.alert("icon:"+icon+"  :pi:"+pic+"  :subPic:"+subPic+"      :albumPics:"+albumPics);
            var goodsId=data.field.hGoodsId;
            var newGoodsId=data.field.goodsId;
            var boole=false;
            $.ajax({
                type:"GET",
                url:"../bgoods/checkGoodsId",
                async: false,//加这个ajax就可以修改全局变量了
                data:"goodsId="+newGoodsId+"&oldGoodsId="+goodsId,
                //状态：请求成功
                success:function(obj)// msg:响应信息
                {
                    //alert(obj.message);
                    if(obj.message ==="yes"){
                        boole=true;
                        // layer.msg('成功');
                    }else if(obj.message === 'no'){
                        layer.msg(obj.data);
                    }else {
                        layer.msg("系统异常");
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
            return boole;
        });

        //获取div中img的src  输入('.add-pic img')
        function picturePath(imgPath){
            var folder="";
            var pic="";
            if ($(imgPath).length!=0){
                $(imgPath).each(function(){
                    var img=$(this).attr("src");
                    //截取文件夹名
                    folder=img.substring(img.indexOf('/'),img.lastIndexOf('/')+1);
                    //截取图片文件名
                    var document=img.substring(img.lastIndexOf('/')+1);
                    pic+=","+document;
                });
                pic=pic.slice(1,pic.length);
                if (folder!=""){
                    if ($(imgPath).length>1){
                        pic=folder+","+pic;
                    }else{
                        pic=folder+pic;
                    }
                }
            }
            return pic;
        };



        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });
        //自定义验证规则
        form.verify({
            len: function(value){
                if(value> 2147483647 || value<-2147483648){
                    return '格式不正确';
                }
            }
            // ,pass: [
            //     /^[\S]{6,12}$/
            //     ,'密码必须6到12位，且不能出现空格'
            // ]
            // ,content: function(value){
            //     layedit.sync(editIndex);
            // }
        });
    });
</script>

</body>
</html>
