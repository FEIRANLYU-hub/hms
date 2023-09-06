<%@page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome page</title>
    <meta name="renderer" content="webkit">
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/xadmin.css">
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=basePath%>admin/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .laytable-cell-checkbox, .laytable-cell-numbers, .laytable-cell-radio, .laytable-cell-space {
            padding: 5px;
            text-align: center;
        }
    </style>
</head>

<body class="">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">Home page</a>
        <a>
          <cite></cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="update">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
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
        <xblock>
            <button class="layui-btn layui-btn-danger" lay-event="getCheckData">Delete in batches</button>
            <button class="layui-btn" onclick="x_admin_show('Update room information','<%=basePath%>/admin/room/add.jsp',600,600)"><i class="layui-icon"></i>Add</button>
        </xblock>
        </div>
    </script>
    <table class="layui-table" lay-data="{url:'<%=basePath%>roomServlet',page:{ prev: 'previous page',next:'next page',first: 'first',last: 'last',layout: ['prev', 'page', 'next','first']},toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
        <thead>
        <tr>
            <th lay-data="{type:'checkbox'}">ID</th>
            <th lay-data="{field:'id', width:120, sort: true}">ID</th>
            <th lay-data="{field:'number', width:200}">Room number</th>
            <th lay-data="{field:'type_name',  width: 150}">Room type</th>
            <th lay-data="{field:'price', width:100, sort: true}">Price</th>
            <th lay-data="{field:'area',  width: 150}">Area</th>
            <th lay-data="{field:'create_time',templet: '#dateTpl',width: 150}">creation time</th>
            <th lay-data="{field:'create_author', width: 150}">Created by</th>
            <th lay-data="{fixed: 'right', width:220, align:'center', toolbar: '#barDemo'}">Operate</th>
        </tr>
        </thead>
    </table>

</div>

<script type="text/html" id="dateTpl">
   {{ layui.util.toDateString(d.createTime,"yyyy-MM-dd")}}
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">Edit</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">Delete</a>
</script>

<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="sex" value="{{d.id}}" lay-skin="switch" lay-text="woman|man" lay-filter="sexDemo" {{ d.id == 10003 ? 'checked' : '' }}>
</script>
<script>
    layui.use(['form', 'table'], function () {
        var form = layui.form,
            table = layui.table;

        var $ = layui.$, active = {
            reload: function(){
                var number = $('#number').val();
                debugger
                //执行重载
                table.reload('test', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                       content: number
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        /**
         * 根据数据获取选择记录的id集合
         */
        function getCheakIds(data){
            var arr=new Array();
            for(var i=0;i<data.length;i++){
                arr.push(data[i].id);
            }
            return arr.join(",");
        }

        /**
         * 根据id删除记录信息
         */
        function deleteByIds(ids,index){
            $.ajax({
                url:"<%=basePath%>roomServlet?flag=delete",
                type:"post",
                data: {ids:ids},
                success:function(result){
                    if(result.code==0){
                        layer.alert("Deleted successfully", {icon: 6},function () {
                            parent.window.location.reload();

                        });
                    }else{
                        layer.msg("Sorry, delete failed")
                    }
                }
            })
        }

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            debugger
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('Are you sure you want to delete it', function(index){
                    //这里调用删除功能即可
                    deleteByIds(data.id,index);
                    // layer.close(index);
                });
            } else if(obj.event === 'edit'){
                var index = layer.open({
                    title: 'Update room',
                    type: 2,
                    shade: 0.2,
                    shadeClose: true,
                    area: ['60%', '80%'],
                    content: '<%=basePath%>roomServlet?flag=queryId&id='+data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            }
        });
        //头部监听事件
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='getCheckData'){
                var data = checkStatus.data;
                /**
                 * 如果没有选择提示选择，如果选择获取选中id集合
                 */
                debugger
                if(data.length==0){
                    layer.msg("Please select the record information you want to delete...")
                }else{
                    //获取id集合，进行删除工作
                    var ids=getCheakIds(data);
                    layer.confirm('Are you sure you want to delete it ?',function(index){
                       //执行删除工作
                        deleteByIds(ids,index);
                    })
                }

                // layer.alert(JSON.stringify(data));
            }

        });

    });
</script>

</body>

</html>