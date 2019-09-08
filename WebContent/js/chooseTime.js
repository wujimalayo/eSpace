var week_no="5";
	/*var week = new Date().getDay();
	switch (week) {
	case 0:
		week_no = "7";
		break;
	case 1:
		week_no = "1";
		break;
	case 2:
		week_no = "2";
		break;
	case 3:
		week_no = "3";
		break;
	case 4:
		week_no = "4";
		break;
	case 5:
		week_no = "5";
		break;
	case 6:
		week_no = "6";
		break;
	}*/
//var url="http://localhost:8080/eSpace";
var url="http://39.97.228.248:8080/eSpace";
//普通用户查询
function chooseTime(){
	var week=document.getElementById("week").value;
	var lesson=document.getElementById("lesson").value;
	var status=document.getElementById("status").value;
	if (week == "") {
		alert("请选择周次！");
		//获得焦点事件
		document.getElementById("week").focus();
		/*$("email").focus();jquery写法*/
		return;
	}else if (lesson == "") {
		alert("请选择节次！");
		//获得焦点事件
		document.getElementById("lesson").focus();
		return;
	} 
	ajax("get",url+"/time",
			"week="+week+"&lesson="+lesson+"&week_no="+week_no+"&status="+status,
		function(result){
		var content=JSON.parse(result);
		var thead="<th style=\"text-align: center;\">教室名</th><th style=\"text-align: center;\">教学楼</th><th style=\"text-align: center;\">楼层</th><th style=\"text-align: center;\">状态</th>";
		var status="";
		document.getElementById("thead").innerHTML=thead;
		if(content.resultCode=="1"){
			//获取Json数组数据
			var data = content.data;
			console.log(data);
			var str="";
			for(var i=0;i<data.length;i++){
//				if(data[i].status=="空")
//					status="success";
//				else if(data[i].status=="课")
//					status="danger";
//				else
//					status="warning";
				str+="<tr><td>"+data[i].clsname+"</td><td>"+data[i].building+"</td><td>"
				+data[i].floor+"</td><td>"+data[i].status+"</td></tr>";
			}/*$("#tab_detail").append(str);标签末追加方法*/
			document.getElementById("select_tab").innerHTML=str;//直接覆盖式插入方法
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}
//管理人员查询
function m_chooseTime(){
	var week=document.getElementById("week").value;
	var lesson=document.getElementById("lesson").value;
	var status=document.getElementById("status").value;
	if (week == "") {
		alert("请选择周次！");
		//获得焦点事件
		document.getElementById("week").focus();
		/*$("email").focus();jquery写法*/
		return;
	}else if (lesson == "") {
		alert("请选择节次！");
		//获得焦点事件
		document.getElementById("lesson").focus();
		return;
	}
	ajax("get",url+"/time",
			"week="+week+"&lesson="+lesson+"&week_no="+week_no+"&status="+status,
		function(result){
		var content=JSON.parse(result);
		var week=content.week;
		var lesson=content.lesson;
		if(content.resultCode=="1"){
			//获取Json数组数据
			var data = content.data;
			console.log(data);
			var str="";
			for(var i=0;i<data.length;i++){
				if(data[i].status=="空"){
					str+="<tr><td>"+data[i].clsname+"</td><td>"+data[i].building+"</td><td>"
					+data[i].floor+"</td><td>"+data[i].status+
					"</td><td><button type=\"button\" class=\"btn btn-link\" style=\"padding-top:0\" onclick=\"addRoom("+week+","+lesson+","+data[i].clsname+")\">加课</button></td></tr>";
				}else{
					str+="<tr><td>"+data[i].clsname+"</td><td>"+data[i].building+"</td><td>"
					+data[i].floor+"</td><td>"+data[i].status+
					"</td><td><button disabled=\"disabled\" type=\"button\" class=\"btn btn-link\" style=\"padding-top:0\" onclick=\"addRoom("+week+","+lesson+","+data[i].clsname+")\">加课</button></td></tr>";
				}
			}/*$("#tab_detail").append(str);标签末追加方法*/
			document.getElementById("manage_tab").innerHTML=str;//直接覆盖式插入方法
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}



//
function addRoom(week,lesson,clsname){
	var cfm=confirm("请确认加课信息:第十周，星期"+week+"，第"+lesson+"节，教室："+clsname+"?");
	if(cfm==true){
		ajax("get",url+"/book",
				"week=" +week +"&lesson=" +lesson +  "&clsname=" + clsname +"&week_no="
				+ week_no,
				function(result){
			var content=JSON.parse(result);
			if(content.resultCode=="1"){
				alert("加课成功!");
			}else{
				alert("加课失败!");
			}
		},function(){});
	}
}

//
function apply() {
	var week = document.getElementById("a_week").value;
	var lesson = document.getElementById("a_lesson").value;
	var id = document.getElementById("a_id").value;
	var clsname = document.getElementById("a_clsroom").value;
	var reason = document.getElementById("get_reason").value;
	if (week == "") {
		alert("请选择周次！");
		//获得焦点事件
		document.getElementById("week").focus();
		/*$("email").focus();jquery写法*/
		return;
	}else if (lesson == "") {
		alert("请选择节次！");
		//获得焦点事件
		document.getElementById("lesson").focus();
		return;
	}else if(id==""){
		alert("请输入学工号/教职工号！");
	}else if(clsname==""){
		alert("请输入教室名（号）！");
	}else if(reason==""){
		alert("请输入申请原因！");
	}
	ajax("get",url+"/apply",
			"week=" +week +"&lesson=" +lesson +"&id="+id+
			"&clsname="+clsname+"&reason="+reason,
			function(result){
		var content=JSON.parse(result);
	},function(){});
	/*document.getElementById("submit_check").innerHTML="";*/
}

//
function RoomDetail(clsname){
	$("#test1").click();
	ajax("get",url+"/detail",
			"clsname="+clsname,function(result){
		var content=JSON.parse(result);
		var detail_cls=content.clsname;
		document.getElementById("detail_cls").innerHTML=detail_cls+"本周占用情况";
		if(content.resultCode=="1"){
			//获取Json数组数据
			var data = content.data;
			var bold="";
			var bgcolor="#67ce3d";
			console.log(data);
			var str="";
			for(var i=0;i<data.length;i++){
				if(i==1&&data[1].Fri=='课')
				{
					bgcolor="#bebebe";
					bold="bgcolor="+bgcolor+" style=\"border:solid "+bgcolor+" 5px;font-weight:bold;color:#fff;\"";}
				else if(i==1&&data[1].Fri=='空')
				{
					bgcolor="#67ce3d";
					bold="bgcolor="+bgcolor+" style=\"border:solid "+bgcolor+" 5px;font-weight:bold;color:#fff;\"";}
				else
					bold="";
				str+="<tr><td>"+data[i].Lesson_no+"</td><td>"+data[i].Mon+"</td><td>"
				+data[i].Tues+"</td><td>"+data[i].Wed+"</td><td>"+data[i].Thur+"</td><td "+bold+">"
				+data[i].Fri+"</td><td>"+data[i].Sat+"</td><td>"+data[i].Sun+"</td></tr>";
			}/*$("#tab_detail").append(str);标签末追加方法*/
			document.getElementById("tab_detail").innerHTML=str;//直接覆盖式插入方法
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}
//查看申请信息列表
function app_info(){
	ajax("get",url+"/app_info",null,function(result){
		var content=JSON.parse(result);
		if(content.resultCode=="1"){
			//获取Json数组数据
			var data = content.data;
			console.log(data);
			var str="";
			for(var i=0;i<data.length;i++){
				if(data[i].remark=="未答复"){
					str+="<tr><td>"+data[i].week+"</td><td style=\"width:50px;\">"+data[i].lesson+"</td><td>"
					+data[i].id+"</td><td>"+data[i].clsroom+"</td><td><button "+"onclick='reason_check(\""+data[i].app_date+"\")' type=\"button\" class=\"btn btn-link\" data-toggle=\"modal-2\" style=\"padding-top:0\">查看</button></td><td>"
					+data[i].app_date+"</td><td>"+data[i].remark+"</td><td>"+"<button class=\"btn btn-link\" style=\"padding-top:0\" onclick=\"agree("+data[i].no+")\">批准</button>|<button class=\"btn btn-link\" style=\"padding-top:0\" onclick=\"dissagree("+data[i].no+")\">不批准</button>"+"</td></tr>";
				}else{
					str+="<tr><td>"+data[i].week+"</td><td style=\"width:50px;\">"+data[i].lesson+"</td><td>"
					+data[i].id+"</td><td>"+data[i].clsroom+"</td><td><button "+"onclick='reason_check(\""+data[i].app_date+"\")' type=\"button\" class=\"btn btn-link\" data-toggle=\"modal-2\" style=\"padding-top:0\">查看</button></td><td>"
					+data[i].app_date+"</td><td>"+data[i].remark+"</td><td>"+"<button disabled=\"disabled\" class=\"btn btn-link\" style=\"padding-top:0\" onclick=\"agree("+data[i].no+")\">批准</button>|<button disabled=\"disabled\" class=\"btn btn-link\" style=\"padding-top:0\" onclick=\"dissagree("+data[i].no+")\">不批准</button>"+"</td></tr>";
				}
			}document.getElementById("app_tab").innerHTML=str;
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}
//批准
function agree(no){
	ajax("get",url+"/agree","no="+no+"&key=1",
			function(result){
		var content=JSON.parse(result);
		if(content.resultCode=="1"){
			alert("成功!");
			window.location.reload(); 
		}else{
			alert("失败!");
		}
	},function(){});
}
//不批准
function dissagree(no){
	ajax("get",url+"/agree","no="+no+"&key=0",
			function(result){
		var content=JSON.parse(result);
		if(content.resultCode=="1"){
			alert("成功!");
			window.location.reload(); 
		}else{
			alert("失败!");
		}
	},function(){});
}
//查看申请原因
function reason_check(app_date){
	$("#test2").click();
	ajax("get",url+"/app_reason","app_date="+app_date,function(result){
		var content=JSON.parse(result);
		if(content.resultCode=="1"){
			var reason=content.app_reason;
			console.log(reason);
			document.getElementById("app_reason").innerHTML=reason;
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}
//普通用户首页
function indexOnload(floor) {
	ajax("get",url+"/index",
			"week_no="+week_no+"&floor_no="+floor,
		function(result){
		var content=JSON.parse(result);
		if(content.resultCode=="1"){
			//获取Json数组数据
			var data = content.data;
			console.log(data);
			var thead="<th style=\"text-align: center;\">教室名</th><th style=\"text-align: center;\">楼层</th><th style=\"text-align: center;\">状态</th><th style=\"text-align: center;\">本周课表详情</th>";
			document.getElementById("thead").innerHTML=thead;
			var str="";
			for(var i=0;i<data.length;i++){
					str+="<tr><td>"+data[i].clsname+"</td><td>"
					+data[i].floor+"</td><td>"+data[i].status+
					"</td><td><button class=\"btn btn-link md-trigger\" data-modal=\"modal-1\" style=\"padding-top:0\" onclick=\"RoomDetail('"+data[i].clsname+"')\">查看</button></td></tr>";
//																																			+data[i].clsname+")\">查看</button></td></tr>";
			}/*$("#tab_detail").append(str);标签末追加方法*/
			document.getElementById("select_tab").innerHTML=str;//直接覆盖式插入方法
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}
function mdlOnload(floor) {
	ajax("get",url+"/mdl",
			"week_no="+week_no+"&floor_no="+floor,
		function(result){
		var content=JSON.parse(result);
		if(content.resultCode=="1"){
			//获取Json数组数据
			var data = content.data;
			console.log(data);
			var thead="<th style=\"text-align: center;\">教室名</th><th style=\"text-align: center;\">楼层</th><th style=\"text-align: center;\">状态</th><th style=\"text-align: center;\">本周课表详情</th>";
			document.getElementById("thead").innerHTML=thead;
			var str="";
			for(var i=0;i<data.length;i++){
					str+="<tr><td>"+data[i].clsname+"</td><td>"
					+data[i].floor+"</td><td>"+data[i].status+
					"</td><td><button class=\"btn btn-link md-trigger\" data-modal=\"modal-1\" style=\"padding-top:0\" onclick=\"RoomDetail('"+data[i].clsname+"')\">查看</button></td></tr>";
			}/*$("#tab_detail").append(str);标签末追加方法*/
			document.getElementById("select_tab").innerHTML=str;//直接覆盖式插入方法
		}else{
			alert("获取信息失败！");
		}
	},function(){});
}