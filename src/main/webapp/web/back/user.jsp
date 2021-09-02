<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <title>用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../layui/css/layui.css" rel="stylesheet"  media="all">
    <link href="../other/css/back.css" rel="stylesheet"  media="all">
</head>
<body style="background-color: white;">

<!-- 搜索 -->
<form class="layui-form" action="../buser/showUser.action" style="margin-top: 2%;">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="uid"  autocomplete="off" class="layui-input" value="${uid}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="uname"  autocomplete="off" class="layui-input" value="${uname}">
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
<c:if test="${empty users}">
    未找到
</c:if>
<c:if test="${not empty users}">
    <div class="layui-form" >
        <div style="margin-left: 20px;">
            <button type="button" class="layui-btn" id="addUser">添加</button>
            <button type="button" class="layui-btn" id="delUser">删除</button>
        </div>

        <table class="layui-table">
            <colgroup>
                <!-- <col width="30"> -->
                <!-- <col width="150">
                <col width="200">
                <col> -->
            </colgroup>
            <thead>
            <tr>
                <th><input type="checkbox" lay-skin="primary" class="allcb" lay-filter="check_all"/></th>
                <th>ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>昵称</th>
                <th>手机号</th>
                <th>账号启用</th>
                <th>注册时间</th>
                <th>头像</th>
                <th>性别</th>
                <th>生日</th>
                <th>城市</th>
                <th>职业</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>
                        <input type="checkbox" lay-skin="primary" lay-filter="authority" class="authority" name="cb" value="${user.id}">
                    </td>
                    <td><span>${user.userid}</span></td>
                    <td><span>${user.username}</span></td>
                    <td><span>${user.password}</span></td>
                    <td><span>${user.nickname}</span></td>
                    <td><span>${user.phone}</span></td>
                    <td>
                        <c:choose>
                            <c:when test="${user.userStatus==1}">
                                <input type="checkbox" name="close" lay-skin="switch" lay-filter="userStatus" lay-text="是|否" value="${user.userStatus}" checked>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="close" lay-skin="switch" lay-filter="userStatus" lay-text="是|否" value="${user.userStatus}" >
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <span><fmt:formatDate value="${user.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </td>
                    <td>
                        <input type="hidden" value="${user.icon}">
                        <img src="..${user.icon}"   style="width:40px;height: 40px" >
                    </td>
                    <td>
                        <input type="hidden" value="${user.gender}"
                        <c:choose>
                            <c:when test="${user.gender==1}">
                                <span>男</span>
                            </c:when>
                            <c:when test="${user.gender==2}">
                                <span>女</span>
                            </c:when>
                            <c:otherwise>
                                <span>保密</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <span><fmt:formatDate value="${user.birthday}" type="date" pattern="yyyy-MM-dd"/></span>
                    </td>
                    <td><span>${user.city}</span></td>
                    <td><span>${user.job}</span></td>
                    <td>
                        <button type="button" class="layui-btn layui-btn-xs btn-edit" >编辑</button>
                        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs btn-del">删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <c:if test="${pageBean.totalCount>6}">
            <!-- 分页 -->
            <div class="paginatoin-area text-center" >
                <ul class="pagination-box">
                    <c:choose>
                        <c:when test="${pageBean.currentPage==1}">
                            <li><a class="previoused"><i class="layui-icon layui-icon-left"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="previous" href="../buser/showUser.action?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}&uid=${uid}&uname=${uname}"><i class="layui-icon layui-icon-left"></i></a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                        <c:choose>
                            <c:when test="${pageBean.currentPage==i}">
                                <li class="active"><a href="../buser/showUser.action?currentPage=${i}&rows=${pageBean.rows}&uid=${uid}&uname=${uname}">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="../buser/showUser.action?currentPage=${i}&rows=${pageBean.rows}&uid=${uid}&uname=${uname}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pageBean.currentPage!=pageBean.totalPage}">
                            <li><a class="next" href="../buser/showUser.action?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&uid=${uid}&uname=${uname}"><i class="layui-icon layui-icon-right"></i></a></li>
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
            <form class="layui-form layui-form-pane" action="../buser/addUser">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">ID</label>
                        <div class="layui-input-inline">
                            <input type="text" name="userid" autocomplete="off" class="layui-input" id="add-userid" lay-verify="required|number">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" autocomplete="off" class="layui-input" id="add-name" lay-verify="required">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="password" autocomplete="off" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="nickname" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" autocomplete="off" class="layui-input" lay-verify="required|phone" id="add-phone">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="icon">
                            <img src="" id="add-icon"  style="width:60px;height: 60px;margin:0px 10px;display: none" >
                            <button type="button" class="layui-btn"  id="add-upload-img" style="margin-left: 10px">上传图片</button>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">生日</label>
                        <div class="layui-input-inline">
                            <input type="text" name="birthday" class="layui-input" id="add-birthday" placeholder="年-月-日" >
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="1" title="男" >
                        <input type="radio" name="sex" value="2" title="女">
                        <input type="radio" name="sex" value="0" title="保密" checked="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">城市</label>
                        <div class="layui-input-inline">
                            <input type="text" name="city" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">职业</label>
                        <div class="layui-input-inline">
                            <input type="text" name="job" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账户启用</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="close" lay-skin="switch" lay-text="是|否" id="add-default" checked>
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
            <form class="layui-form layui-form-pane" action="../buser/updUser" lay-filter="example">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">ID</label>
                        <div class="layui-input-inline">
                            <input type="text" name="userid" id="userid"   autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="password" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="nickname" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">头像</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="icon">
                            <img src="" id="upd-icon" style="width:60px;height: 60px;margin:0px 10px" >
                            <button type="button" class="layui-btn" id="upd-upload-img">上传图片</button>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="1" title="男" checked="">
                        <input type="radio" name="sex" value="2" title="女">
                        <input type="radio" name="sex" value="0" title="保密" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">生日</label>
                        <div class="layui-input-inline">
                            <input type="text" name="birthday" class="layui-input" id="upd-birthday" placeholder="年-月-日">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">城市</label>
                        <div class="layui-input-inline">
                            <input type="text" name="city"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">职业</label>
                        <div class="layui-input-inline">
                            <input type="text" name="job" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账户启用</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="close" lay-skin="switch" lay-text="是|否" id="upd-default" >
                    </div>
                </div>


                <div class="layui-form-item" style="margin-left: 150px;">
                    <div class="layui-input-block">
                        <button class="layui-btn "  lay-submit lay-filter="upd-submit" id="upd-confirm">确认</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<script src="../other/js/jquery-3.3.1.min.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>

<!--添加用户-->
<script>
    $('#add-btn-danger').on('click',function(){

        var name=$('#add-name').val();
        var province=$('#add-province').val();
        var city=$('#add-city').val();
        var county=$('#add-county').val();
        var addres=$('#add-address').val();
        var phone=$('#add-phone').val();
        var is_default=$('#add-default').is(':checked');
        var Default;
        //alert(is_default);
        if(is_default==true){
            Default =1;
        }else{
            Default =0;
        }
        if (name=='' ||province=='' ||province=='' ||city=='' ||county=='' ||addres==''||phone==''){
            GrowlNotification.notify({
                title: '信息未填完整',
                type: 'error',
                position: 'top-center',
                closeTimeout: 2000
            });
        }else{
            var a=new Array();
            a.push(name,phone,province,city,county,addres,Default);
            var address=a.toString();
            $.ajax({
                type:"POST",
                url:"../address/addAddress",
                data:"address="+address,
                success: function(obj){
                    if(obj.state==0){
                        alert("添加失败");
                    }else{ //登录成功
                        GrowlNotification.notify({
                            title: '添加成功',
                            type: 'success',
                            position: 'top-center',
                            closeTimeout: 1000
                        });
                        setTimeout( 'window.location.href="../order/showOrderConfirmation.action"',200);
                    }
                },
                //请求失败
                error:function()
                {
                    //错误处理
                    alert("系统异常");
                }
            });
        }


    });
</script>
<!--修改用户-->
<script>
    $('.btn-edit').on('click',function(){
        // alert("11");

        // layer.msg('222');
        var userid=$(this).parent().parent().find('td').eq(1).find('span').text();
        var username=$(this).parent().parent().find('td').eq(2).find('span').text();
        var password=$(this).parent().parent().find('td').eq(3).find('span').text();
        var nickname=$(this).parent().parent().find('td').eq(4).find('span').text();
        var phone=$(this).parent().parent().find('td').eq(5).find('span').text();
        var userStatus=$(this).parent().parent().find('td').eq(6).find('input').val();
        var createTime=$(this).parent().parent().find('td').eq(7).find('span').text();
        var icon=$(this).parent().parent().find('td').eq(8).find('input').val();
        var gender=$(this).parent().parent().find('td').eq(9).find('input').val();
        var birthday=$(this).parent().parent().find('td').eq(10).find('span').text();
        var city=$(this).parent().parent().find('td').eq(11).find('span').text();
        var job=$(this).parent().parent().find('td').eq(12).find('span').text();
        var state=false;
        if (userStatus==1){
            state=true;
        }
        $('.updatemodal').find('input').eq(0).val(userid);
        $('.updatemodal').find('input').eq(1).val(username);
        $('.updatemodal').find('input').eq(2).val(password);
        $('.updatemodal').find('input').eq(3).val(nickname);
        $('.updatemodal').find('input').eq(4).val(phone);
        $('.updatemodal').find('input').eq(5).val(icon);
        $("#upd-icon").attr('src','..'+icon);
        //layer.msg('2:'+icon+'  c:'+city+'   j:'+job);
        layui.use(['form'], function(){
            var form = layui.form
                ,laydate = layui.laydate;
            //表单赋值
            form.val('example', {
                "close": state
                ,"sex":gender
            });
            laydate.render({
                elem: '#upd-birthday'
                ,value: birthday
            });
            laydate.render({
                elem: '#upd-createTime'
                ,value:  createTime
            });

        });
        $('.updatemodal').find('input').eq(12).val(city);
        $('.updatemodal').find('input').eq(13).val(job);

    });

</script>
<!-- 批量删除-->
<script type="text/javascript">
    $('#delUser').click(function(){
        var cbs=$("input[name=cb]");
        var a = new Array();
        //alert("2");
        //遍历
        cbs.each(function() {
            if ($(this).is(':checked')){
                a.push($(this).val());
            }
        });
        // alert("a"+a.length);
        if (a.length==0){
            //alert("1");
           layer.msg('未选中');
        }else{
            var ids=a.toString();

            layer.confirm('确定是否删除', {
                btn: ['确定','取消'] //按钮
            }, function(){
                // layer.msg("is:"+ids)
                $.ajax({
                    type:"POST",
                    url:"../buser/delUser",
                    data:"ids="+ids,
                    success: function(obj){
                        if(obj.code==0){
                            layer.msg("删除成功");
                            setTimeout( 'window.location.href="../buser/showUser.action"',200);
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

    })
</script>
<script>

    $('.btn-edit').on('click',function(){
        $('.updatemodal').show();
    });
    $('.btn-del').on('click',function(){
        var id=$(this).parent().siblings().eq(0).children().val();

        layer.confirm('确定是否删除', {
            btn: ['确定','取消'] //按钮
        }, function(){
              // layer.msg("id:"+id);
            $.ajax({
                type:"POST",
                url:"../buser/delUser",
                data:"ids="+id,
                success: function(obj){
                    if(obj.code==0){
                        layer.msg("删除成功");
                        setTimeout( 'window.location.href="../buser/showUser.action"',200);
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
    $('#addUser').on('click',function(){
        $('.addmodal').show();
    });

    $('#add-btn-x').on('click',function(){
        $('.addmodal').hide();
    });
    $('#upd-btn-x').on('click',function(){
        $('.updatemodal').hide();
    });


</script>
<script>
    layui.use(['form', 'layedit', 'laydate','upload','laypage'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload
            ,laypage = layui.laypage
            ,$=layui.jquery;

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
        var userid=$('add-userid').val();
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#add-upload-img'
            ,url: '../buser/updIcon' //改成您自己的上传接口
            ,data:{
                userid: function(){
                    return $('#add-userid').val();;
                }
            }
            ,before: function(obj){

                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#add-icon').show();
                        $('#add-icon').attr('src', result); //图片链接（base64）
                    });


            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }else{
                    $('#add-icon').show();
                    $('#add-icon').attr('src', '..'+res.icon);
                    $('.addmodal').find('input[name=icon]').val(res.icon);
                    return layer.msg('上传成功');
                }
                //上传成功
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
            elem: '#upd-upload-img'
            ,url: '../buser/updIcon' //改成您自己的上传接口
            ,data:{
                userid: function(){
                    return $('#userid').val();;
                }
            }
            ,before: function(obj){

                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#upd-icon').attr('src', result); //图片链接（base64）
                });

            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }else{
                    $('#upd-icon').attr('src', '..'+res.icon);
                    $('.updatemodal').find('input').eq(5).val(res.icon);
                    return layer.msg('上传成功');
                }
                //上传成功
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
        //日期
        laydate.render({
            elem: '#add-birthday'
        });
        laydate.render({
            elem: '#add-createTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#upd-birthday'
        });
        laydate.render({
            elem: '#upd-createTime'
            ,type: 'datetime'
        });
        //创建一个编辑器
        // var editIndex = layedit.build('LAY_demo_editor');



        //监听指定开关
        form.on('switch(userStatus)', function(data){
            var id=$(this).parent().parent().find('input[name=cb]').val();
            var userStatus = this.checked;
            if (userStatus===true){
                userStatus=1;
            }else{
                userStatus=0;
            }
            $.ajax({
                type:"POST",
                url:"../buser/updUserStatus",
                data:"id="+id+"&userStatus="+userStatus,
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
            var userid=data.field.userid;
            var username=data.field.username;
            var phone=data.field.phone;
            var boole=false;
            // layer.msg("userid:"+userid);
            $.ajax({
                type:"GET",
                url:"../user/checkUser",
                async: false,//加这个ajax就可以修改全局变量了
                data:"userid="+userid+"&username="+username+"&phone="+phone,
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
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            //layer.msg("bo:"+boole);
            return boole;
        });
        form.on('submit(upd-submit)', function(data){
            var userid=data.field.userid;
            var username=data.field.username;
            var phone=data.field.phone;
            var boole=false;
            // layer.msg("userid:"+userid);
            $.ajax({
                type:"GET",
                url:"../user/checkUser",
                async: false,//加这个ajax就可以修改全局变量了
                data:"userid="+userid+"&username="+username+"&phone="+phone+"&upd="+boole,
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
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            //layer.msg("bo:"+boole);
            return boole;
        });
        //表单赋值

        //表单取值
        // layui.$('#LAY-component-form-getval').on('click', function(){
        //     var data = form.val('example');
        //     alert(JSON.stringify(data));
        // });

    });
</script>
</body>
</html>
