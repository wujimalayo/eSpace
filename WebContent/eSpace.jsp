<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="impl.*"%>
<%@ page import="Class.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eSpace</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<script type="text/javascript" src="js/chooseTime.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<!-- Favicons -->
<link href="img/logo_s.png" rel="icon">
<link href="img/logo_s.png" rel="apple-touch-icon">
<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">
<!-- modal -->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<link rel="stylesheet" href="css/bootstrap-select.css">
<style>
 .container h4{
	padding:7px 0 0 0;
}
#chaxun{
	/* width:1515px; */
	background:#8e8e8e;
	padding: 5px 20px 20px 20px;
	color: #333;
	box-shadow: 0px -1px 5px #3c3c3c;
	}
#f{
	box-shadow: 0px 5px 10px #1a1a1a inset;
}
#dg{
	box-shadow: 0px 5px 10px #4f4f4f;
}
#g{
	box-shadow: 1px 1px 5px #9d9d9d inset;
}
/* #headerwrap{
	box-shadow: 0px 5px 10px #4f4f4f;
} */
</style>
</head>
<body>
	<!-- 导航栏 -->
	<nav class="menu" id="theMenu">
	<div class="menu-wrap">
		<h1 class="logo"><a href="#home">ESPACE</a></h1>
		<i class="fa fa-times-circle menu-close"></i>
		<a href="#home" class="smoothscroll">主页</a>
		<a href="#recommend" class="smoothscroll" id="auto_href">最佳空教室推荐</a>
		<a href="#select" class="smoothscroll" onclick="chart_up()">查教室</a>
		<script type="text/javascript">
			var e=document.getElementById('auto_href');
			window.setTimeout("e.click()",3000);
			window.setTimeout("charts_best()",4000);
		</script>
		<a href="#selectbytime" class="smoothscroll">按时间查询</a>
		<a href="#contact" class="smoothscroll">预订空教室申请</a>
		<a href="#about" class="smoothscroll">关于ESPACE</a>
		<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a>
		<a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
	</div>

	<!-- Menu button -->
	<div id="menuToggle">
		<i class="fa fa-bars" style="margin-top:13px;"></i>
	</div>
	</nav>
	<section id="home" name="home"></section>
	<!-- 主页 -->
	<div id="headerwrap">
		<div class="container">
			<br>
			<div class="row">
				<br> <br> <br>
				<div class="col-lg-6 col-lg-offset-3"></div>
			</div>
		</div>
	</div>
	<section id="recommend" name="home"></section>
	<!-- 推荐 -->
	<div id="dg" style="padding-top: 30px;">
		<div class="container">
		<h3>eSpace为您推荐当前最佳教室</h3>
		<div id="best" style="width:1000px;height:500px;padding:0 0 0 150px;"></div>
		<script type="text/javascript">
		function charts_best(){
			// 基于准备好的dom，初始化echarts图表
            var myChart = echarts.init(document.getElementById('best'));
            var dataStyle = {
            	    normal: {
            	        label: {show:false},
            	        labelLine: {show:false}
            	    }
            	};
            var placeHolderStyle = {
            	    normal : {
            	        color: 'rgba(0,0,0,0)',
            	        label: {show:false},
            	        labelLine: {show:false}
            	    },
            	    emphasis : {
            	        color: 'rgba(0,0,0,0)'
            	    }
            	};
            var best = {
            	    title: {
            	        text: '致远楼-20308',
            	        subtext: '状态：空闲\n教室容量：95',
            	        x: 'center',
            	        y: 220,
            	        itemGap: 18,
            	        textStyle : {
            	            color : 'rgba(0,0,0,0.8)',
            	            fontFamily : '微软雅黑',
            	            fontSize : 25,
            	            fontWeight : 'bolder'
            	        },
            			subtextStyle :{
            				fontSize :14,
            				fontFamily : '微软雅黑',
            				color:'#6C6C6C'
            			}
            	    },
            	    tooltip : {
            	        show: true,
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x: 450,
            	        y : 75,
            	        itemGap:15,
            	        data:['教室日空闲比：80%','教室周空闲比：71%','该楼层教室空闲率：63%']
            	    },
            	    toolbox: {
            	        show : false,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    series : [
            	        {
            	            name:'教室日空闲比',
            	            type:'pie',
            	            clockWise:false,
            	            radius : [149, 180],
            	            itemStyle : dataStyle,
            	            data:[
            	                {
            	                    value:4,
            	                    name:'教室日空闲比：80%'
            	                },
            	                {
            	                    value:1,
            	                    name:'invisible',
            	                    itemStyle : placeHolderStyle
            	                }
            	            ]
            	        },
            	        {
            	            name:'教室周空闲比',
            	            type:'pie',
            	            clockWise:false,
            	            radius : [119, 150],
            	            itemStyle : dataStyle,
            	            data:[
            	                {
            	                    value:25, 
            	                    name:'教室周空闲比：71%'
            	                },
            	                {
            	                    value:10,
            	                    name:'invisible',
            	                    itemStyle : placeHolderStyle
            	                }
            	            ]
            	        },
            	        {
            	            name:'该楼层教室空闲率',
            	            type:'pie',
            	            clockWise:false,
            	            radius : [90, 120],
            	            itemStyle : dataStyle,
            	            data:[
            	                {
            	                    value:5, 
            	                    name:'该楼层教室空闲率：63%'
            	                },
            	                {
            	                    value:3,
            	                    name:'invisible',
            	                    itemStyle : placeHolderStyle
            	                }
            	            ]
            	        }
            	    ]
            	};
            myChart.setOption(best);
		}
		</script>
		</div>
	</div>
	<!-- 查询 -->
	<section id="select" name="select"></section>
	<div id="g">
		<div id="zyl" style="width:470px;height:300px;position:absolute;left:85px;top:1471.4px;"></div>
		<script type="text/javascript">
		function chart_up(){
			setTimeout("charts_zyl()",1000);
		    setTimeout("charts_mdl()",1200);
		    setTimeout("charts_csl()",1400);
		    setTimeout("charts_xxl()",1600);
		    setTimeout("charts_zyl()",2000);
		}
		function charts_zyl(){
            // 基于准备好的dom，初始化echarts图表
            var myChart = echarts.init(document.getElementById('zyl'));
            var zyl = {
                  //代码主要部分
                  tooltip: {
                          trigger: 'item',
                          formatter: "{a} <br/>{b} : {c} ({d}%)"
                  },
                  legend: {
                      orient: 'vertical',
                      x: 'left',
                      y: 'center',
                      data:['空教室','已被预订','正在上课']
                  },
                  series:[{
                      name: '致远楼',
                      type: 'pie',
                      radius: ['42%','57%'],
                      avoidLabelOverlap: false,
                      label: {
                          normal: {
                              show: false,//是否显示小字
                              position: 'inside'
                          },
                          emphasis: {
                              show: false,//鼠标经过是否显示大字
                              textStyle: {
                                  fontSize: '30',
                                  fontWeight: 'bold'
                              }
                          }
                      },
                      labelLine: {
                          normal: {
                              show: false
                          }
                      },
                      data:[
                          { value: 18, name: '空教室' },
                          { value: 8, name: '已被预订' },
                          { value: 33, name: '正在上课' }
                      ]
                  }],
                  color:['#67ce3d','#FF8916','#bebebe']
        　　　};
             // 为echarts对象加载数据 
             myChart.setOption(zyl);
		}
		</script>
		<div id="mdl" style="width:470px;height:300px;position:absolute;left:379px;top:1471.4px;"></div>
		<script type="text/javascript">
		function charts_mdl(){
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById('mdl'));
                  var zyl = {
                        //代码主要部分
                        tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        series:[{
                            name: '明德楼',
                            type: 'pie',
                            radius: ['42%','57%'],
                            avoidLabelOverlap: true,
                            label: {
                                normal: {
                                    show: false,//是否显示小字
                                    position: 'inside'
                                },
                                emphasis: {
                                    show: false,//鼠标经过是否显示大字
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: true
                                }
                            },
                            data:[
                                { value: 35, name: '空教室' },
                                { value: 3, name: '已被预订' },
                                { value: 8, name: '正在上课' }
                            ]
                        }],
                        color:['#67ce3d','#FF8916','#bebebe']
              　　　};
                   // 为echarts对象加载数据 
                   myChart.setOption(zyl);
		}
		</script>
		<div id="csl" style="width:470px;height:300px;position:absolute;left:671px;top:1471.4px;"></div>
		<script type="text/javascript">
		function charts_csl(){
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById('csl'));
                  var zyl = {
                        //代码主要部分
                        title: {
                               text: '',
                               subtext: '',
                               x: 'center'
                        },
                        tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        series:[{
                            name: '崇实楼',
                            type: 'pie',
                            radius: ['42%','57%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,//是否显示小字
                                    position: 'inside'
                                },
                                emphasis: {
                                    show: false,//鼠标经过是否显示大字
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: true
                                }
                            },
                            data:[
                                { value: 45, name: '空教室' },
                                { value: 3, name: '已被预订' },
                                { value: 15, name: '正在上课' }
                            ]
                        }],
                        color:['#67ce3d','#FF8916','#bebebe']
              　　　};
                   // 为echarts对象加载数据 
                   myChart.setOption(zyl);
		}
		</script>
		<div id="xxl" style="width:470px;height:300px;position:absolute;right:86px;top:1471.4px;"></div>
		<script type="text/javascript">
		function charts_xxl(){
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById('xxl'));
                  var zyl = {
                        //代码主要部分
                        tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        series:[{
                            name: '信息楼',
                            type: 'pie',
                            radius: ['42%','57%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,//是否显示小字
                                    position: 'inside'
                                },
                                emphasis: {
                                    show: false,//鼠标经过是否显示大字
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: true
                                }
                            },
                            data:[
                                { value: 5, name: '空教室' },
                                { value: 2, name: '已被预订' },
                                { value: 3, name: '正在上课' }
                            ]
                        }],
                        color:['#67ce3d','#FF8916','#bebebe']
              　　　};
                   // 为echarts对象加载数据 
                   myChart.setOption(zyl);
		}
		</script>
		
		<div class="container">
			<div class="row">
				<h3>教学楼</h3>
				<br>
				<div class="col-lg-3">
					<img src="img/s1.png">
					<br><br>
					<h4>致远楼</h4>
					<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" style="margin-left: 60px;">
						<li><a href="javascript:void(0)" onclick="indexOnload(1)">1楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(2)">2楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(3)">3楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(4)">4楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(5)">5楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(6)">6楼</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<img src="img/s2.png"><br><br>
					<h4>明德楼</h4>
					<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" style="margin-left: 60px;">
						<li><a href="javascript:void(0)" onclick="mdlOnload(1)">1楼</a></li>
						<li><a href="javascript:void(0)" onclick="mdlOnload(2)">2楼</a></li>
						<li><a href="javascript:void(0)" onclick="mdlOnload(3)">3楼</a></li>
						<li><a href="javascript:void(0)" onclick="mdlOnload(4)">4楼</a></li>
						<li><a href="javascript:void(0)" onclick="mdlOnload(5)">5楼</a></li>
						<li><a href="javascript:void(0)" onclick="mdlOnload(6)">6楼</a></li>
						<li><a href="javascript:void(0)" onclick="mdlOnload(7)">7楼</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<img src="img/s3.png"><br><br>
					<h4>崇实楼</h4>
					<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" style="margin-left: 60px;">
						<li><a href="javascript:void(0)" onclick="indexOnload(1)">1楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(2)">2楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(3)">3楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(4)">4楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(5)">5楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(6)">6楼</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<img src="img/s4.png"><br><br>
					<h4>信息楼</h4>
					<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" style="margin-left: 60px;">
						<li><a href="javascript:void(0)" onclick="indexOnload(1)">1楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(2)">2楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(3)">3楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(4)">4楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(5)">5楼</a></li>
						<li><a href="javascript:void(0)" onclick="indexOnload(6)">6楼</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /查询 -->
	<section id="selectbytime" name="selectbytime"></section>
	<div id="dg" style="padding-top: 30px;">
		<div class="row">
			<h3>教室状态</h3>
			<div class="col-lg-2"></div>
			<button id="test1" class="btn btn-link md-trigger" data-modal="modal-1"></button>
			<div class="col-lg-8" style="padding: 20px 0 0 30px;">
				<div id="floorDisplay" style="height: 300px; overflow: auto;">
					<table class="table table-hover table-condensed">
						<thead id="thead">
						</thead>
						<tbody id="select_tab">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 查询筛选框 -->
	<div id="chaxun">
		<div class="container">
			<h3 style="color: #fff; text-align: center;">按时间状态筛选</h3><br>
			<div class="col-lg-2"></div>
			<div class="col-lg-2">
				<label>周次：</label>
				<div>
					<select id="zhouci" name="select"
						class="selectpicker show-tick form-control">
						<option value="">请选择(1-18周)</option>
						<option value="1">第1周</option>
						<option value="2">第2周</option>
						<option value="3">第3周</option>
						<option value="4">第4周</option>
						<option value="5">第5周</option>
						<option value="6">第6周</option>
						<option value="7">第7周</option>
						<option value="8">第8周</option>
						<option value="9">第9周</option>
						<option value="10">第10周</option>
						<option value="11">第11周</option>
						<option value="12">第12周</option>
						<option value="13">第13周</option>
						<option value="14">第14周</option>
						<option value="15">第15周</option>
						<option value="16">第16周</option>
						<option value="17">第17周</option>
						<option value="18">第18周</option>
					</select>
				</div>
			</div>
			<div class="col-lg-2">
				<label>星期：</label>
				<div>
					<select id="week" name="select"
						class="selectpicker show-tick form-control">
						<option value="">请选择</option>
						<option value="1">周一</option>
						<option value="2">周二</option>
						<option value="3">周三</option>
						<option value="4">周四</option>
						<option value="5">周五</option>
						<option value="6">周六</option>
						<option value="7">周日</option>
					</select>
				</div>
			</div>
			
			<div class="col-lg-2">
				<label>节次：</label>
				<div>
					<select id="lesson" name="select"
						class="selectpicker show-tick form-control">
						<option value="">请选择</option>
						<option value="1">第一节</option>
						<option value="2">第二节</option>
						<option value="3">第三节</option>
						<option value="4">第四节</option>
						<option value="5">第五节(晚上)</option>
					</select>
				</div>
			</div>
			<div class="col-lg-2">
				<label>状态：</label>
				<div>
					<select id="status" name="select"
						class="selectpicker show-tick form-control">
						<option value="status">所有</option>
						<option value="'空'">空</option>
						<option value="'课'">课</option>
						<option value="'订'">订</option>
					</select>
				</div>
			</div>
			<div class="col-lg-2">
				<button type="submit" class="btn btn-primary btn-large"
					onclick="chooseTime()" style="margin: 26px 0px 0px 52px;">查询</button>
			</div>
			<!-- /查询筛选框 -->
		</div>
		<br><br>
	</div>
	<section id="contact" name="contact"></section>
	<div id="f" style="padding-top: 70px;">
		<div class="container">
			<div class="row">
				<h1 style="color:#fff">
					<b>预 订 空 教 室</b>
				</h1>
				<div class="col-lg-4">
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h3 style="margin:10px;">
						APPLY FORM<br><br><br>
					</h3>

					<form class="contact-form php-mail-form" role="form"
						action="contactform/contactform.php" method="POST">
						<div class="col-sm-6 col-md-6 col-lg-6"
							style="padding-left: 0px; margin-bottom: 15px;">
							<label>申请星期：</label>
							<div>
								<select id="a_week" name="week"
									class="selectpicker show-tick form-control">
									<option value="">请选择</option>
									<option value="1">周一</option>
									<option value="2">周二</option>
									<option value="3">周三</option>
									<option value="4">周四</option>
									<option value="5">周五</option>
									<option value="6">周六</option>
									<option value="7">周日</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 col-lg-6"
							style="padding-right: 0px; margin-bottom: 15px;">
							<label>申请节次：</label>
							<div>
								<select id="a_lesson" name="lesson"
									class="selectpicker show-tick form-control">
									<option value="">请选择</option>
									<option value="1">第一节</option>
									<option value="2">第二节</option>
									<option value="3">第三节</option>
									<option value="4">第四节</option>
									<option value="5">第五节(晚上)</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>请输入你的学工号或教职工号：</label> <input id="a_id" type="text"
								class="form-control" placeholder="在此输入">
						</div>
						<div class="form-group">
							<label>申请的教室：</label> <input id="a_clsroom" type="text"
								class="form-control" placeholder="格式（楼名-教室名）如：致远楼-20201">
						</div>
						<div class="form-group">
							<label>申请原因：</label>
							<textarea id="get_reason" class="form-control"
								placeholder="请尽量说明大概人数以及具体活动..." rows="5"></textarea>
						</div>
						<div class="row">
							<h3 style="font-size: 13px;margin-top:0px;padding-left:20px;">*为提高申请成功率，请提前确认所选时段该教室状态信息。</h3>
						</div>
						<div class="loading"></div>
						<div class="sent-message">提交成功!</div>
						<div class="form-send" style="margin-top:20px;" id="submit_check">
							<button type="submit" class="btn btn-large" onclick="apply()">确认提交</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<section id="about" name="about"></section>
	<div id="g">
		<div class="container">
			<div class="row">
				<h3>ABOUT ESPACE</h3>
				<br> <br>
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<p>eSpace空教室管理系统是面向校园师生的一款web应用，通过最简洁的界面与操作便能实现校园空教室的查询与管理。前端采用Bootstrap响应式布局，使得用户在手机、平板以及端页上都能得到100%的使用体验。</p>
					<br> <br>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div id="carousel-example-generic" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="img/item-01.png" alt="">
							</div>
							<div class="item">
								<img src="img/item-04.png" alt=""
									style="height: 430px; margin-left: 65px;">
							</div>
							<div class="item">
								<img src="img/item-03.png" alt=""
									style="height: 430px; margin-left: 160px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /g -->
	<div id="copyrights">
		<div class="container">
			<p>
				&copy; Copyrights <strong>eSpace</strong>. All Rights Reserved
			</p>
			<div class="credits">
				Created with Ncist
			</div>
		</div>
	</div>
	<div class="md-modal md-effect-1" id="modal-1">
		<div class="md-content" style="padding:10px 30px 40px 30px;">
		<h4 id="detail_cls" style="padding-top:20px;padding-bottom:10px;"></h4>
		<button class="btn md-close" type="button" style="position:relative;bottom:55px;left:270px;">
			<span aria-hidden="true">&times;</span>
		</button>
		<table
			class="table table-striped table-bordered table-hover table-condensed">
			<style type="text/css">
			    th{
			        text-align:center;
			    }tr{
			        text-align:center;
			    }
			</style>
			<thead>
				<th>节次</th>
				<th>周一</th>
				<th>周二</th>
				<th>周三</th>
				<th>周四</th>
				<th>周五</th>
				<th>周六</th>
				<th>周日</th>
			</thead>
			<tbody id="tab_detail">
			</tbody>
		</table>
		</div>
	</div>
	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="lib/php-mail-form/validate.js"></script>
	<script src="lib/chart/chart.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<div class="md-overlay"></div>
	<script src="js/classie.js"></script>
	<script src="js/modalEffects.js"></script>
</body>
</html>