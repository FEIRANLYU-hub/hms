<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>Management System</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />-->
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=basePath%>admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/xadmin.css">
<%--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript"src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js"></script>
  --%>  <script src="<%=basePath%>admin/lib/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="<%=basePath%>admin/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/cookie.js"></script>
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>


    <style type="text/css">
        .laytable-cell-checkbox, .laytable-cell-numbers, .laytable-cell-radio, .laytable-cell-space {
            padding: 5px;
            text-align: center;
        }
    </style>
</head>

<body class="">

<div class="x-body">

    <div class="demoTable">
         Room number：
        <div class="layui-inline">
            <input class="layui-input" name="number" id="number" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload">Search</button>
    </div>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">Delete in batches</button>
        </div>
    </script>

    <script type="text/html" id="dateTpl">
       {{#
        if(d.commentTime){}}
           {{layui.util.toDateString(new Date(d.commentTime).getTime(), "yyyy-MM-dd HH:mm:ss") }}
        {{#}
        else{}}
        {{#}}}
    </script>


    <table class="layui-table" lay-data="{url:'<%=basePath%>commentServlet',page:{ prev: 'previous page',next:'next page',first: 'first',last: 'last',layout: ['prev', 'page', 'next','first']},toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
        <thead>
        <tr>
            <th  class="checkbox" lay-data="{type:'checkbox'}">Older number</th>
            <th lay-data="{field:'number',  width: 100}">Room number</th>
            <th lay-data="{field:'username', width:120}">Name</th>
            <th lay-data="{field:'email', width:120}">Email</th>
           <th lay-data="{field:'commentTime',width:150,title:'Comment time',templet: '#dateTpl'}">Check-in time</th>
            <th lay-data="{field:'remark', width:120}">Content</th>
            <th lay-data="{title:'Operate', toolbar: '#barDemo',minWidth: 150}">Operate</th>
        </tr>
        </thead>
    </table>

</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">Delete</a>
</script>

<script>
    layui.use(['form', 'table'], function () {
        var form = layui.form,
            table = layui.table;
        var $ = layui.$, active = {
            reload: function(){
                var number = $('#number').val();
                //执行重载
                table.reload('test', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        content:number
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        /**
         * tool操作栏监听事件
         */
        table.on('tool(test)', function (obj) {
            var data=obj.data;
            debugger
           if (obj.event === 'delete') {  // 监听删除操作
                layer.confirm('Are you sure you want to delete ?', function (index) {
                    //调用删除功能
                    deleteInfoByIds(data.id,index);
                    layer.close(index);
                });
            }
        });



        /**
         * 获取选中记录的id信息
         */
        function getCheackId(data){
            var arr=new Array();
            for(var i=0;i<data.length;i++){
                arr.push(data[i].id);
            }
            //拼接id
            return arr.join(",");
        };


        /**
         * 提交删除功能
         */
        function deleteInfoByIds(ids ,index){
            //向后台发送请求
            $.ajax({
                url: "<%=basePath%>commentServlet?flag=delete",
                type: "POST",
                data: {ids: ids},
                success: function (result) {
                    if (result.code == 0) {//如果成功
                        layer.msg('Updated successfully', {
                            icon: 6,
                            time: 500
                        }, function () {
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        });
                    } else {
                        layer.msg("Update failed");
                    }
                }
            })
        };

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='getCheckData'){
                var data = checkStatus.data;
                if(data.length==0){//如果没有选中信息
                    layer.msg("Select the information that you want to delete");
                }else{
                    //获取记录信息的id集合
                    var ids=getCheackId(data);
                    layer.confirm('Are you sure you want to delete ?', function (index) {
                        //调用删除功能
                        deleteInfoByIds(ids,index);
                        layer.close(index);
                    });
                }
            }
        });
    });
</script>

</body>

</html>
