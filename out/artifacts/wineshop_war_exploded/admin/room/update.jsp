<%@page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String basePath2=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update page</title>
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
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <input type="hidden" id="img" name="img" >
        <input type="hidden" name="id" value="${info.id}">
        <input type="hidden" name="typeIds" id="typeIds" value="${info.room_id}">
        <div class="layui-form-item">
            <label for="number" class="layui-form-label">
                <span class="x-red">*</span>Room number
            </label>
            <div class="layui-input-inline">
                <input type="text" id="number" name="number" required=""
                       autocomplete="off" class="layui-input" value="${info.number}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>Name suggested unique
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Room type</label>
            <div class="layui-input-inline">
                <select name="roomId" id="typeId" lay-verify="required" lay-search="">
                    <option value="">Please select</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="area" class="layui-form-label">
                <span class="x-red">*</span>Area
            </label>
            <div class="layui-input-inline">
                <input type="text" id="area" name="area" required=""
                       autocomplete="off" class="layui-input" value="${info.area}">
            </div>
        </div>
        <!--上传图片开始-->
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>Room picture
            </label>
            <div class="layui-input-inline">
                <div class="layui-upload-drag" id="test10">
                    <i class="layui-icon"></i>
                    <p>Click Upload, or drag the file here</p>
                    <div class="layui-hide" id="uploadDemoView">
                        <hr>
                        <img src="<%=basePath2%>/${info.img}" alt="Render after successful upload" style="max-width: 196px">
                    </div>
                </div>
            </div>
        </div>
        <!--上传图片结束-->
        <div class="layui-form-item">
            <label for="price" class="layui-form-label">
                <span class="x-red">*</span>Price
            </label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price" required=""
                       autocomplete="off" class="layui-input" value="${info.price}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="counts" class="layui-form-label">
                <span class="x-red">*</span>Number of guests
            </label>
            <div class="layui-input-inline">
                <input type="text" id="counts" name="counts" required=""
                       autocomplete="off" class="layui-input" value="${info.counts}">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">State</label>
            <div class="layui-input-block">
                <input type="checkbox"  name="status" lay-skin="switch" lay-filter="switchTest" lay-text="Available|Not available" <c:if test="${info.status==1}">checked </c:if>>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_pass" class="layui-form-label">
                <span class="x-red">*</span>Remark
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_pass" name="remark" required=""
                       autocomplete="off" class="layui-input" value="${info.remark}">
            </div>

        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                Edit room
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['upload','form','layer'], function(){
        $ = layui.jquery;
        var upload = layui.upload;
        var form = layui.form
            ,layer = layui.layer;

        //通过ajax请求向后端获取类型名称数据并渲染到指定select位置
        $.get("<%=basePath%>typeInfoServlet?flag=queryTypeList",{},function (data) {
            var list=data;
            var select=document.getElementById("typeId");
            var value=document.getElementById("typeIds").value;
            if(list!=null ){
                for(var c in list){
                    var option=document.createElement("option");
                    option.setAttribute("value",list[c].id);
                    option.innerText=list[c].typeName;
                    select.appendChild(option);
                    if(list[c].id==value){
                        option.setAttribute("selected","selected");
                    }
                }
            }
            form.render("select");
        },"json")


        //拖拽上传
        upload.render({
            elem: '#test10'
            ,url: '<%=basePath%>roomServlet?flag=upload' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            ,done: function(res){
                debugger
                layer.msg('Updated successfully');
                layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "<%=basePath2%>/images/"+res.msg);
                //给隐藏域赋值
                $("#img").val("images/"+res.msg);
                console.log(res)
            }
        });

        //显示图片信息
        layui.$('#uploadDemoView').removeClass('layui-hide')
        // layui.$("#uploadDemoView").removeClass('layui-hide');

        // 指定开关事件
        // form.on('switch(switchTest)', function(data){
        //     layer.msg('开关 checked：'+ (this.checked ? 'true' : 'false'), {
        //         offset: '6px'
        //     });
        //     console.log(data)
        //     layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是 ON|OFF', data.othis)
        // });

        //监听提交
        form.on('submit(update)', function(data){
            /*
               1、获取输入框的值信息
               2、通过ajax请求向后端发送请求
               3、根据响应反馈信息提示，并刷新主页
             */
            var data=data.field;
            console.log(data)
            if(data.status=='on'){
                data.status=1;
            }else{
                data.status=0;
            }
           // debugger
            $.ajax({
                url:"<%=basePath%>roomServlet?flag=update",
                type:"post",
                data:data,
                success:function(result){
                    if(result.code==0){
                        layer.alert("Updated successfully", {icon: 6},function () {
                            //关闭当前frame
                            x_admin_close();
                            // 可以对父窗口进行刷新
                            x_admin_father_reload();
                        });
                    }else{
                        layer.msg("Sorry, update failed...")
                    }
                }
            })

            return false;
        });


    });
</script>

</body>

</html>