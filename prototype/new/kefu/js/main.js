$(document).ready(function(){
    var rplistdata
    var tklistdata
    var mtlistdata

    var tmp
    var staticurl = "http://192.168.1.100:8080"

    //报修单列表获取
    $(rplist).ready(function(){
        $.ajax({
            url : staticurl+"/ServiceTool/repair_report/get",
            dataType : "json",
            type : "get",
            cache : true,
            async : false,
            success : function(data){
                rplistdata = data;
                var str=""
                for (var i in data){
                   
                    var tmp="";
                    var a ='<div class="row"><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">'
                                  
                    var b ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">'          
                                  
                    var c ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a data-toggle="modal" data-target="#showHistory">'            
                                  
                    var d ='</a></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'        
                                  
                    var e ='</div><div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">'          
                                   
                    var f ='</div><div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><button id="cc" class="btn btn-success btn-xs" data-id="'+data[i].id+'" data-toggle="modal" data-target="#showDetail" >详情</button><button class="btn btn-info btn-xs" data-toggle="modal" data-target="#getHandle">受理</button><button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#changeSource">自动受理</button></div></div> '           

                    tmp = a+data[i].id+b+data[i].report_time+c+data[i].wtb_id+d+data[i].equipment_id+e+data[i].status+f;
                    $(listdetail).append(tmp)

                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("报修单"+XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
                
            }
        })
    })

    //报修单详情显示
    $(showDetail).on('show.bs.modal',function(event){
        // alert($(event.relatedTarget).data('id'))
        var detail = rplistdata.filter(function (e) { return e.id == $(event.relatedTarget).data('id'); });
        //alert(detail[0].wtb_id);
        var list = $(this);
        list.find('#danhao').val(detail[0].id);
        list.find('#yonghu').val(detail[0].wtb_id);
        list.find('#miaoshu').val(detail[0].description);
        list.find('#dizhi').val(detail[0].address);
        list.find('#beizhu').val(detail[0].note);
    })

    //任务单列表获取
    $(tklist).ready(function(){
        $.ajax({
            url : staticurl+"/ServiceTool/task/getTask",
            dataType : "json",
            type : "get",
            cache : true,
            async : false,
            success : function(data){
                tklistdata = data
                var str=""
                for (var i in data){
                    var tmp="";

                    var a ='<div class="row"><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">'
                                  
                    var b ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 "><a data-toggle="modal" data-id="'+data[i].repairId+'" data-target="#showDetail1">'          
                                  
                    var c ='</a></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'            
                                  
                    var d ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a data-toggle="modal" data-id="'+data[i].maintainerId+'" data-target="#viewUser1">'        
                                  
                    var e ='</a></div><div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">'          
                                   
                    var f ='</div><div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><button class="btn btn-success btn-xs" data-toggle="modal" data-id="'+ data[i].id +'" data-target="#showTDetail">详情</button><button class="btn btn-info btn-xs" data-toggle="modal" data-target="#Reassign">分配</button><button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#changeChar">反馈</button></div></div>'            

                    tmp = a+data[i].id+b+data[i].repairId+c+data[i].start_time+d+data[i].maintainerId+e+data[i].status+f;
                    $(tklist).append(tmp)

                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("任务单"+XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
                
            }
        })
    })

    //任务单详情显示
    $(showTDetail).on('show.bs.modal',function(event){
        // alert($(event.relatedTarget).data('id'))
        var detail = tklistdata.filter(function (e) { return e.id == $(event.relatedTarget).data('id'); });
        //alert(detail[0].wtb_id);
        var list = $(this);
        list.find('#danhao').val(detail[0].id);
        list.find('#baoxiu').val(detail[0].repairId);
        list.find('#shijian').val(detail[0].start_time);
        list.find('#weixiu').val(detail[0].maintainerId);
        list.find('#beizhu').val(detail[0].note);
    })

    //任务单中显示报修单详情
    $(showDetail1).on('show.bs.modal',function(event){
        // alert($(event.relatedTarget).data('id'))
        var detail = rplistdata.filter(function (e) { return e.id == $(event.relatedTarget).data('id'); });
        //alert(detail[0].wtb_id);
        var list = $(this);
        list.find('#danhao').val(detail[0].id);
        list.find('#yonghu').val(detail[0].wtb_id);
        list.find('#miaoshu').val(detail[0].description);
        list.find('#dizhi').val(detail[0].address);
        list.find('#beizhu').val(detail[0].note);
    })

    //任务单中显示维修人员详情
    $(viewUser1).on('show.bs.modal',function(event){
        // alert($(event.relatedTarget).data('id'))
        var detail = mtlistdata.filter(function (e) { return e.id == $(event.relatedTarget).data('id'); });
        //alert(detail[0].wtb_id);
        var list = $(this);
        list.find('#bianhao').val(detail[0].id);
        list.find('#xingming').val(detail[0].wtb_id);
        list.find('#quyu').val(detail[0].accendant_area);
        list.find('#lianx').val(detail[0].contact_information);
        
        getWork(detail[0].id);
        // alert(tmp);
        list.find('#neir').val(tmp);
    })


    //维修人员列表详情
    $(mtlist).ready(function(){
        $.ajax({
            url : staticurl+"/ServiceTool/maintainer/getMaintainers",
            dataType : "json",
            type : "get",
            cache : true,
            async : false,
            success : function(data){
                mtlistdata = data
                var str=""
                for (var i in data){
                    var tmp="";

                    var a ='<div class="row"><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">'
                                  
                    var b ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">'          
                                  
                    var c ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'                  
                                  
                    var e ='</div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'          
                                   
                    var f ='</div><div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><button class="btn btn-info btn-xs" data-toggle="modal" data-id="'+data[i].id +'" data-target="#viewUser">查看详情</button></div></div>'            

                    tmp = a+data[i].id+b+data[i].wtb_id+c+data[i].accendant_area+e+data[i].contact_information+f;
                    $(mtlist).append(tmp)

                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("维修人员"+XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
                
            }
        })
    })

    //维修人员详情
    $(viewUser).on('show.bs.modal',function(event){
        // alert($(event.relatedTarget).data('id'))
        var detail = mtlistdata.filter(function (e) { return e.id == $(event.relatedTarget).data('id'); });
        //alert(detail[0].wtb_id);
        var list = $(this);
        list.find('#bianhao').val(detail[0].id);
        list.find('#xingming').val(detail[0].wtb_id);
        list.find('#quyu').val(detail[0].accendant_area);
        list.find('#lianx').val(detail[0].contact_information);
        

        getWork(detail[0].id);
        // alert(tmp);
        list.find('#neir').val(tmp);
    })
    
    //获取维修人员的维修内容
    function getWork(id){
        $.ajax({
            url: staticurl+ "/ServiceTool/maintainer/getCatagory?maintainerId="+id,
            dataType : "json",
            type : "get",
            cache : false,
            async : false,
            success : function(data){
                tmp = data
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("维修人员"+XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
                
            }
        })
    }

})

