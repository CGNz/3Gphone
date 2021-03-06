<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>模版工具</title>
	<link rel="stylesheet" type="text/css" href="${resourceUrl}/css/slide.css">
	<script src="${resourceUrl}/js/jquery.min.js"></script>
    <script src="${resourceUrl}/js/bootstrap.min.js"></script>
    <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })
    </script>
    <link href="${resourceUrl}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${resourceUrl}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${resourceUrl}/css/slide.css" />
    <link rel="stylesheet" type="text/css" href="${resourceUrl}/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${resourceUrl}/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${resourceUrl}/css/jquery.nouislider.css">
    <style type="text/css">
        .form-group{
            margin-bottom: 5px;
            font-size: 12px;
        }
        label {
            font-size: 12px;
        }
    </style>
</head>
<body>
	 <div id="wrap">
	 		<!-- 左侧菜单栏目块 -->
			<div class="leftMeun" id="leftMeun">
		        <div id="logoDiv">
		            <p id="logoP"><span>客服管理工具</span></p>
		        </div>
		        <div id="personInfor">
		            <p id="userName">客服：AA</p>
		        </div>
		        <div class="meun-item meun-item-active" href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="${resourceUrl}/images/icon_source.png">报单受理</div>
		        <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="${resourceUrl}/images/icon_chara_grey.png">任务单分配</div>
		        <div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="${resourceUrl}/images/icon_user_grey.png">维修人员列表</div>
		        <div class="meun-item" href="#scho" aria-controls="scho" role="tab" data-toggle="tab"><img src="${resourceUrl}/images/icon_change_grey.png">反馈管理</div>
		    </div>
	 
	 		<!-- 右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- 模块列表 -->
                <div class="tab-content">
                	 <!--报单受理模块 -->
                    <div role="tabpanel" class="tab-pane active" id="sour">

                        <!--头部筛选、搜索操作-->
                        <div class="check-div form-inline">
                            <div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
                                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSchool">添加新的报修单 </button>
                            </div>
                            <div class="col-lg-4 col-xs-4 col-md-4 col-sm-4 ">
                                <input type="text" class=" form-control input-sm " placeholder="输入报修单相关搜索">
                                <button class="btn btn-white btn-xs ">查 询 </button>
                            </div>

                            <div class="col-lg-5 col-xs-5 col-md-5 col-sm-5" style="text-align: right;float: right;">
                                <label for="paixu">筛选:&nbsp;</label>
                                <select class="form-control">
                                    <option>状态未处理</option>
                                    <option>状态已处理</option>
                                    <option>状态已转单</option>
                                </select>
                                <label for="paixu" style="padding-left:20px">排序:&nbsp;</label>
                                <select class="form-control">
                                    <option>报修单号</option>
                                    <option>下单时间从最早到最近</option>
                                    <option>下单时间从最近到更早</option>
                                </select>
                            </div>
                        </div>
                        <div class="data-div">
                            <!--报修单表头-->
                            <div class="row tableHeader">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                    报修单号
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    下单时间
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    用户账号ID
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    设备编号ID
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    报单状态
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    报单操作
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    <button class="btn btn-white btn-xs" data-toggle="modal">一键受理</button>
                                </div>
                            </div>

                            <!--报修单列表-->
                            <div class="tablebody">
                                    <div id="collapseSchool" class="collapse in" aria-expanded="true">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                                B0001
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                                2018/6/20
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                <a data-toggle="modal" data-target="#showHistory">CGNz</a>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                                SB006
                                            </div>
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                                未处理
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#showDetail">详情</button>
                                                <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#getHandle">受理</button>
                                                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#changeSource">自动受理</button>
                                            </div>
                                        </div>
                                        
                                    </div>
                            </div>
                        </div>

                        <!--页码块-->
                        <footer class="footer">
                            <ul class="pagination">
                                <li>
                                    <select>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select>
                                    页
                                </li>
                                <li class="gray">
                                    共20页
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-left">
                                    </i>
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-right">
                                    </i>
                                </li>
                            </ul>
                        </footer>
                        
                        <!--报单详情弹出窗口-->
                        <div class="modal fade" id="showDetail" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">报修单详情</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">报修单号：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">故障描述：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">用户姓名/联系方式：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">地区：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">备注：</label>
                                                    <div class="col-xs-6">
                                                        <textarea class="form-control input-sm duiqi"></textarea>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-toggle="modal" data-dismiss="modal" data-target="#getHandle">受理报修单</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--受理报单弹出窗口-->
                        <div class="modal fade" id="getHandle" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">生成任务单</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">维修内容：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">地区：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInput1" class="col-xs-3 control-label">选择维修人员：</label>
                                                    <div class="col-xs-8">
                                                        <label class="control-label" for="anniu">
                                                            <input type="radio" name="leixing" id="anniu">WX001</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label class="control-label" for="meun">
                                                            <input type="radio" name="leixing" id="meun"> WX002</label>

                                                        <!-- 优先显示符合地区和维修内容的维修人员，然后显示空闲的维修人员 -->
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">暂不分配</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确认任务单</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal-->

                        <!--用户历史弹出窗口-->
                        <div class="modal fade" id="showHistory" role="dialog" aria-labelledby="gridSystemModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="gridSystemModalLabel">用户维修历史</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <form class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="sLink" class="col-xs-3 control-label">维修内容：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sOrd" class="col-xs-3 control-label">地区：</label>
                                                        <div class="col-xs-8">
                                                            <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                        </div>
                                                    </div>
                        
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确定</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal-->

                        <!--受理报单弹出窗口-->
                        <div class="modal fade" id="getHandle" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">生成任务单</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">维修内容：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">地区：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInput1" class="col-xs-3 control-label">选择维修人员：</label>
                                                    <div class="col-xs-8">
                                                        <label class="control-label" for="anniu">
                                                            <input type="radio" name="leixing" id="anniu">WX001</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label class="control-label" for="meun">
                                                            <input type="radio" name="leixing" id="meun"> WX002</label>

                                                        <!-- 优先显示符合地区和维修内容的维修人员，然后显示空闲的维修人员 -->
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">暂不分配</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确认任务单</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal-->

                        <!--弹出删除资源警告窗口-->
                        <div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            确定要删除该资源？删除后不可恢复！
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        <button type="button" class="btn btn-xs btn-danger">保 存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>

					 <!--任务单分配模块 -->
                    <div role="tabpanel" class="tab-pane" id="char">
                         <!--头部筛选、搜索操作-->
                        <div class="check-div form-inline">
                            <div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
                                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSchool">添加新的任务单 </button>
                            </div>
                            <div class="col-lg-4 col-xs-4 col-md-4 col-sm-4 ">
                                <input type="text" class=" form-control input-sm " placeholder="输入任务单相关搜索">
                                <button class="btn btn-white btn-xs ">查 询 </button>
                            </div>

                            <div class="col-lg-5 col-xs-5 col-md-5 col-sm-5" style="text-align: right;float: right;">
                                <label for="paixu">筛选:&nbsp;</label>
                                <select class="form-control">
                                    <option>状态未分配</option>
                                    <option>状态已分配</option>
                                    <option>状态已完成</option>
                                </select>
                                <label for="paixu" style="padding-left:20px">排序:&nbsp;</label>
                                <select class="form-control">
                                    <option>任务单号</option>
                                    <option>下单时间从最早到最近</option>
                                    <option>下单时间从最近到更早</option>
                                </select>
                            </div>
                        </div>
                        <div class="data-div">
                            <!--任务单表头-->
                            <div class="row tableHeader">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                    任务单号
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    保修单号
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    生成时间
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    维修人员id
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    任务单状态
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    操作
                                </div>
                            </div>
                             <!--任务单列表项-->
                            <div class="tablebody">
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        T0001
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        B0001
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        2018/6/21
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        WX001
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                        未分配
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#showTDetail">详情</button>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#Reassign">分配</button>
                                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#changeChar">反馈</button>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        T0002
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        B0002
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        2018/6/25
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        WX002
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                        已分配
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#showTDetail">详情</button>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#Reassign">分配</button>
                                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#changeChar">反馈</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        T0003
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        B0003
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        2018/6/28
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        WX003
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                        已完成
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#showTDetail">详情</button>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#Reassign">分配</button>
                                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#changeChar">反馈</button>
                                   </div>
                                </div>
                            </div>
                        </div>

                        <!--页码块-->
                        <footer class="footer">
                            <ul class="pagination">
                                <li>
                                    <select>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select>
                                    页
                                </li>
                                <li class="gray">
                                    共20页
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-left">
                                    </i>
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-right">
                                    </i>
                                </li>
                            </ul>
                        </footer>

                        <!--任务单详情弹出窗口-->
                        <div class="modal fade" id="showTDetail" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">任务单详情</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">任务单号：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">报修单号：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">维修人员ID：</label>
                                                    <div class="col-xs-8">
                                                            <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">故障描述：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">地区：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">备注：</label>
                                                    <div class="col-xs-6">
                                                        <textarea class="form-control input-sm duiqi"></textarea>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">确定</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"  data-toggle="modal" data-target="#Reassign">重新分配维修人员</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--分配人员弹出窗口-->
                        <div class="modal fade" id="Reassign" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">分配维修人员</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">任务单号：</label>
                                                    <div class="col-xs-6 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">报修单号：</label>
                                                    <div class="col-xs-6 ">
                                                        <textarea class="form-control input-sm duiqi"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">生成时间：</label>
                                                    <div class="col-xs-6">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">地区：</label>
                                                    <div class="col-xs-6">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">选择维修人员：</label>
                                                    <div class="col-xs-6">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                        
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确认</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--弹出删除权限警告窗口-->
                        <div class="modal fade" id="deleteChar" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            确定要删除该权限？删除后不可恢复！
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        <button type="button" class="btn btn-xs btn-danger">保 存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>

                    <!--维修人员列表模块-->
                    <div role="tabpanel" class="tab-pane" id="user">
                        <div class="check-div form-inline">
                            <div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
                                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加新的维修人员 </button>
                            </div>
                            <div class="col-lg-4 col-xs-4 col-md-4 col-sm-4 ">
                                <input type="text" class=" form-control input-sm " placeholder="输入维修人员相关搜索">
                                <button class="btn btn-white btn-xs ">查 询 </button>
                            </div>
                            <!--头部筛选，搜索操作-->
                            <div class="col-lg-5 col-xs-5 col-md-5 col-sm-5" style="text-align: right;float: right;">
                                <label for="paixu">筛选:&nbsp;</label>
                                <select class="form-control">
                                    <option>状态工作中</option>
                                    <option>状态空闲</option>
                                    <option>状态请假</option>
                                </select>
                                <label for="paixu" style="padding-left:20px">排序:&nbsp;</label>
                                <select class="form-control">
                                    <option>负责区域</option>
                                    <option>维修人员id</option>
                                    <option>姓名</option>
                                </select>
                            </div>
                        </div>
                        <div class="data-div">
                            <!--列表表头-->
                            <div class="row tableHeader">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                    维修人员ID
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    姓名
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    负责区域
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    维修内容
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    当前状态
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    操作
                                </div>
                            </div>
                            <!--列表字段-->
                            <div class="tablebody">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                        WX001
                                    </div>
                                    <div class="col-xs-2">
                                        杨晓飞
                                    </div>
                                    <div class="col-xs-2">
                                        C10
                                    </div>
                                    <div class="col-xs-2">
                                        空调
                                    </div>
                                    <div class="col-xs-2">
                                        工作中
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#viewUser">查看详情</button>
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#editUser">编辑</button>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-2 ">
                                        WX002
                                    </div>
                                    <div class="col-xs-2">
                                        蔡BB
                                    </div>
                                    <div class="col-xs-2">
                                        C8
                                    </div>
                                    <div class="col-xs-2">
                                        冰箱
                                    </div>
                                    <div class="col-xs-2">
                                        请假
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#viewUser">查看详情</button>
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#editUser">编辑</button>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-2 ">
                                        WX003
                                    </div>
                                    <div class="col-xs-2">
                                        洞箫杨
                                    </div>
                                    <div class="col-xs-2">
                                        B8
                                    </div>
                                    <div class="col-xs-2">
                                        所有家电
                                    </div>
                                    <div class="col-xs-2">
                                        空闲
                                    </div>
                                    <div class="col-xs-2">
                                            <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#viewUser">查看详情</button>
                                            <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#editUser">编辑</button>
                                       </div>
                                </div>

                            </div>

                        </div>
                        <!--页码块-->
                        <footer class="footer">
                            <ul class="pagination">
                                <li>
                                    <select>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select>
                                    页
                                </li>
                                <li class="gray">
                                    共20页
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-left">
                                    </i>
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-right">
                                    </i>
                                </li>
                            </ul>
                        </footer>

                        <!--弹出添加维修人员窗口-->
                        <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">添加维修人员</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">姓名：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">联系方式：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">负责区域：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sKnot" class="col-xs-3 control-label">维修内容：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                                    </div>
                                                </div>
            
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">添加</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--弹出修改维修人员信息窗口-->
                        <div class="modal fade" id="editUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">修改信息</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">姓名：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">联系方式：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">负责区域：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sKnot" class="col-xs-3 control-label">维修内容：</label>
                                                    <div class="col-xs-8">
                                                        <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">保存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                        <!-- 弹出查看维修人员信息窗口 -->
                        <div class="modal fade" id="viewUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="gridSystemModalLabel">查看信息</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <form class="form-horizontal">
                                                    <div class="form-group ">
                                                        <label for="sName" class="col-xs-3 control-label">姓名：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sLink" class="col-xs-3 control-label">联系方式：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sOrd" class="col-xs-3 control-label">负责区域：</label>
                                                        <div class="col-xs-8">
                                                            <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sKnot" class="col-xs-3 control-label">维修内容：</label>
                                                        <div class="col-xs-8">
                                                            <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                                        </div>
                                                    </div> 
                                                    <div class="form-group">
                                                        <label for="sKnot" class="col-xs-3 control-label">维修记录：</label>
                                                        <div class="col-xs-8">
                                                            <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">确定</button>
                                            <button type="button" class="btn btn-xs btn-green" data-dismiss="modal" data-toggle="modal" data-target="#editUser">编辑信息</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->

                        <!--弹出删除用户警告窗口-->
                        <div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            确定要删除该用户？删除后不可恢复！
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        <button type="button" class="btn  btn-xs btn-danger">保 存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                    </div>

                    <!--用户反馈模块-->
                    <div role="tabpanel" class="tab-pane" id="scho">
                        <!--头部筛选、搜索操作-->
                        <div class="check-div form-inline">
                            <div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
                                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addFeedback">添加新的反馈 </button>
                            </div>
                            <div class="col-lg-4 col-xs-4 col-md-4 col-sm-4 ">
                                <input type="text" class=" form-control input-sm " placeholder="输入反馈单相关搜索">
                                <button class="btn btn-white btn-xs ">查 询 </button>
                            </div>

                            <div class="col-lg-5 col-xs-5 col-md-5 col-sm-5" style="text-align: right;float: right;">
                                <label for="paixu">筛选:&nbsp;</label>
                                <select class="form-control">
                                    <option>状态未处理</option>
                                    <option>状态已处理</option>
                                </select>
                                <label for="paixu" style="padding-left:20px">排序:&nbsp;</label>
                                <select class="form-control">
                                    <option>反馈单号</option>
                                    <option>下单时间从最早到最近</option>
                                    <option>下单时间从最近到更早</option>
                                </select>
                            </div>
                        </div>
                        <!-- 反馈列表表头 -->
                        <div class="data-div">
                            <div class="row tableHeader">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">
                                    反馈单号
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    创建时间
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    反馈用户
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    完工/维修单号
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    反馈状态
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    操作
                                </div>
                            </div>
                            <!-- 反馈列表项 -->
                            <div class="tablebody">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                        F001
                                    </div>
                                    <div class="col-xs-2">
                                        2018/6/24
                                    </div>
                                    <div class="col-xs-2">
                                        CGNz
                                    </div>
                                    <div class="col-xs-2">
                                        T001
                                    </div>
                                    <div class="col-xs-2">
                                        <a class="linkCcc">好评</a>
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#viewFeedback">查看详情</button>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#handleFeedback">处理</button>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-2 ">
                                        F002
                                    </div>
                                    <div class="col-xs-2">
                                        2018/6/29
                                    </div>
                                    <div class="col-xs-2">
                                        BB33
                                    </div>
                                    <div class="col-xs-2">
                                        T002
                                    </div>
                                    <div class="col-xs-2">
                                        <a class="linkCcc">差评</a>
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#viewFeedback">查看详情</button>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#handleFeedback">处理</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--页码块-->
                        <footer class="footer">
                            <ul class="pagination">
                                <li>
                                    <select>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                    </select>
                                    页
                                </li>
                                <li class="gray">
                                    共20页
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-left">
                                    </i>
                                </li>
                                <li>
                                    <i class="glyphicon glyphicon-menu-right">
                                    </i>
                                </li>
                            </ul>
                        </footer>

                        <!--弹出处理反馈单窗口-->
                        <div class="modal fade" id="handleFeedback" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">处理反馈</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">完工单号/任务单号：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">用户ID：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                  </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">联系方式：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">总体评价：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">反馈内容：</label>
                                                    <div class="col-xs-8 ">
                                                        <textarea class="form-control input-sm duiqi"></textarea>
                                                    </div>
                                                </div>
                                                
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">保存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--弹出处理反馈单窗口-->
                        <div class="modal fade" id="handleFeedback" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">处理反馈</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">完工单号/任务单号：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">用户ID：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                  </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">联系方式：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">总体评价：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">反馈内容：</label>
                                                    <div class="col-xs-8 ">
                                                        <textarea class="form-control input-sm duiqi"></textarea>
                                                    </div>
                                                </div>
                                                
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确定</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                         <!--弹出查看反馈单窗口-->
                         <div class="modal fade" id="viewFeedback" role="dialog" aria-labelledby="gridSystemModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="gridSystemModalLabel">查看反馈单</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <form class="form-horizontal">
                                                    <div class="form-group ">
                                                        <label for="sName" class="col-xs-3 control-label">完工单号/任务单号：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="sName" class="col-xs-3 control-label">用户ID：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                        </div>
                                                      </div>
                                                    <div class="form-group ">
                                                        <label for="sName" class="col-xs-3 control-label">联系方式：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="sName" class="col-xs-3 control-label">总体评价：</label>
                                                        <div class="col-xs-8 ">
                                                            <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="sLink" class="col-xs-3 control-label">反馈内容：</label>
                                                        <div class="col-xs-8 ">
                                                            <textarea class="form-control input-sm duiqi"></textarea>
                                                        </div>
                                                    </div>
                                                    
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消</button>
                                            <button type="button" class="btn btn-xs btn-green" data-dismiss="modal" data-toggle="modal" data-target="#handleFeedback">处理反馈</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->

                        <!--弹出添加反馈单窗口-->
                        <div class="modal fade" id="addFeedback" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">新建反馈单</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">用户ID：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">联系方式：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">反馈对象（完工单号/报修单号）：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">反馈评价：</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sOrd" class="col-xs-3 control-label">反馈内容：</label>
                                                    <div class="col-xs-8">
                                                        <textarea class="form-control input-sm duiqi"></textarea>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">保 存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--弹出删除用户警告窗口-->
                        <div class="modal fade" id="deleteSchool" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            确定要删除该地区？删除后不可恢复！
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        <button type="button" class="btn btn-xs btn-danger">保 存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                    </div>
             
                </div>                                          
            </div>
	 </div>
	

	<script type="text/javascript" src="${resourceUrl}/js/html5.js"></script>
	<script src="${resourceUrl}/js/jquery.nouislider.js"></script>
</body>
</html>

