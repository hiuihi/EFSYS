
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="background-color: white;">

<style>
    /*.layui-hide-cell-1-icon{*/
    /*    height: 100%;*/
    /*    max-width: 100%;*/
    /*}*/
    .layui-table-cell {
        height: auto;
        line-height: 28px;
    }
</style>
<form class="layui-form" action="" style="margin-top: 2%;">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-inline">
                <input type="tel" name="url" lay-verify="url" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn">
                <i class="layui-icon">&#xe615;</i>
            </button>
        </div>
    </div>

</form>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">  </fieldset>


<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">保存</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table','util'], function(){
        var table = layui.table;
        var util = layui.util;
        var form = layui.form;
        var $=layui.jquery;
        table.render({
            elem: '#test'
            ,url:'../back/selAllUser'
            ,method: 'post'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            // ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
            //     title: '提示'
            //     ,layEvent: 'LAYTABLE_TIPS'
            //     ,icon: 'layui-icon-tips'
            // }]
            ,page: {
                layout: [ 'prev', 'page', 'next', 'count','limit', 'refresh', 'skip']//自定义布局顺序
                ,limit:5	//初始  每页几条数据
                ,limits:[5,10,15]	//可以选择的 每页几条数据
                ,groups:10 	//最多几个跳页按钮
                ,first: false //不显示首页
                ,last: false //不显示尾页
            }
            ,title: '用户数据表'
            ,cols: [[
                {fixed: 'id',type: 'checkbox', width:50,style:'height:60px;'}
                ,{field:'userid', title:'ID', width:120, unresize: true, sort: true}
                ,{field:'username', title:'用户名', width:90, edit: 'text'}
                ,{field:'password', title:'密码', width:100, edit: 'text'}
                ,{field:'nickname', title:'昵称', width:70, edit: 'text'}
                ,{field:'phone', title:'手机号码', width:120, edit: 'text'}
                ,{field:'userStatus', title:'帐号启用', width:110, sort: true,templet:'#userStatus' }
                ,{field:'createTime', title:'注册时间', width:80, edit: 'text',templet: function (d) {
                        if (d.createTime!=null && d.createTime!=''){
                            return util.toDateString(d.createTime, "yyyy-MM-dd")
                        }else{
                            return '';
                        }
                    }}
                ,{field:'icon', title:'头像', width:80,style:'height:60px;', templet: '#icon'}
                ,{field:'gender', title:'性别', width:80,templet:function(d){
                    if (d.gender==0){
                        return '';
                    }else{
                        return '<input type="checkbox" name="sex" id="sex" value="{{d.gender}}" lay-skin="switch" lay-text="男|女|0" lay-filter="gender" {{ d.gender == 1 ? \'checked\' : \'\' }}>';
                    }
                    } }
                ,{field:'birthday', title:'生日', width:100,templet: function (d) {
                    // if (){
                    //
                    // }else{
                    //
                    // }
                        return util.toDateString(d.birthday, "yyyy-MM-dd")
                    }
                }
                ,{field:'city', title:'城市', width:80}
                ,{field:'job', title:'职业', width:80}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:120}
            ]]

        });
//表格图片显示
        function setPic(data) {
            if (data.icon != null && data.icon!='') {
               return ' <img src="..{{data.icon}}" style="width:40px;height: 40px">';
                // return '<div class="photoKuan"><img src="/Areas/SB_shebei/img/photoload.gif" /><img class="tableImg" src="GetImage?id=' + data.studentID + '" οnclick="showImg(this,' + data.studentID + ')" οnlοad="show(this)" οnerrοr="photoerroe(this)" /></div>';
            } else {
                // return '<a style="cursor: pointer;" onclick="TableUpload(' + data.studentID + ')">上传</a>';
                return '1';
            }
        }

        //监听帐号启用
        form.on('switch(userStatus)', function(obj){
            if (obj.elem.checked){
                obj.update({
                    userStatus: 1,
                    city:1
                });
                this.value=1;
            }else{
                this.value=0;
            }

            layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
            // layer.alert(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);

        });
        //监听性别
        form.on('switch(gender)', function(obj){
            layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
            // layer.alert(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    // var a=data.username;
                    // layer.msg(a);
                    // $.ajax({
                    //     type:"POST",
                    //     url:"../back/updUser",
                    //     data:{data:JSON.stringify(data)},//json数据格式
                    //     async:true,
                    //     // data:"da="+data,
                    //     dateType:'json',
                    //     success: function(obj){
                    //         if(obj.code==0){
                    //             alert("修改失败");
                    //         }else{
                    //            // layer.msg(obj.msg);
                    //         }
                    //     },
                    //     //请求失败
                    //     error:function()
                    //     {
                    //         //错误处理
                    //         alert("系统异常");
                    //     }
                    // });
                   layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                // var aa=$('input[name=status]').eq(2).val();

                var aaa=data.userid;
                var aa=$('#'+aaa).val();
                // var aa=data.userid;
                //layer.msg("aa:"+aa);
                data.userStatus=aa;
                // obj.update({
                //
                //     userStatus: aa,
                //     city:1
                // });
               ///table.render();

                //layer.alert(JSON.stringify(data));
                $.ajax({
                    type:"POST",
                    url:"../back/updUser",
                    data:{data:JSON.stringify(data)},//json数据格式
                    async:true,
                    // data:"da="+data,
                    dateType:'json',
                    success: function(obj){
                        if(obj.code==0){
                            alert("修改失败");
                        }else{
                             layer.msg(obj.msg);
                        }
                    },
                    //请求失败
                    error:function()
                    {
                        //错误处理
                        alert("系统异常");
                    }
                });

                // layer.prompt({
                //     formType: 2
                //     ,value: data.email
                // }, function(value, index){
                //     obj.update({
                //         email: value
                //     });
                //     layer.close(index);
                // });
            }
        });

    });

</script>
<script type="text/html" id="userStatus">
    <!-- 账号启用状态 -->
    <form lay-filter="aaa">
        <input type="checkbox" name="status" id="{{d.userid}}" value="{{d.userStatus}}" lay-skin="switch" lay-text="是|否" lay-filter="userStatus" {{ d.userStatus == '1' ? 'checked' : '' }}>
    </form>
 </script>
<script type="text/html" id="gender">
    <!-- 性别 -->
    <input type="checkbox" name="sex" id="sex" value="{{d.gender}}" lay-skin="switch" lay-text="男|女|0" lay-filter="gender" {{ d.gender == 1 ? 'checked' : '' }}>
</script>
<%--<script type="text/html" id="gender">--%>
<%--    <!-- 性别 -->--%>
<%--    <select name="quiz1">--%>
<%--        <option value=""{{ d.gender == 0 ? 'selected' : '' }}>保密</option>--%>
<%--        <option value="" {{ d.gender == 1 ? 'selected' : '' }}>男</option>--%>
<%--        <option value="" {{ d.gender == 2 ? 'selected' : '' }}>女</option>--%>
<%--    </select>--%>
<%--</script>--%>
<%--<script type="text/html" id="gender">--%>
<%--    <!-- 性别 -->--%>
<%--    <input type="radio" name="sex" value="男" title="男" lay-skin="switch"checked>--%>
<%--    <input type="radio" name="sex" value="女" title="女" lay-skin="switch">--%>
<%--    <input type="radio" name="sex" value="禁" title="保密" lay-skin="switch">--%>
<%--</script>--%>

<script type="text/html" id="icon">

   <img src="..{{d.icon}}" lay-filter="gender" lay-skin="switch" style="width:40px;height: 40px" {{ d.icon != null && d.icon!='' ? d.icon : '' }}>
</script>
</body>
</html>
