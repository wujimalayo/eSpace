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
<title>eSpaceManager</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<script type="text/javascript" src="js/chooseTime.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
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
#dg{
	box-shadow: 1px 1px 5px #9d9d9d inset;
}
#g{
	box-shadow: 0px 5px 10px #4f4f4f;
}	
#chaxun{
	box-shadow: 0px -1px 5px #3c3c3c;
	}
</style>
</head>
<body onload="app_info()">
	<!-- Menu -->
	<nav class="menu" id="theMenu">
	<div class="menu-wrap">
		<h1 class="logo">
			<a href="#home">ESPACE管理</a>
		</h1>
		<i class="fa fa-times-circle menu-close"></i> <a href="#home"
			class="smoothscroll">返回顶部</a> <a href="#services"
			class="smoothscroll">调整课表</a> <a href="#portfolio"
			class="smoothscroll">预订管理</a> <a href="#about" class="smoothscroll">关于ESPACE</a>
		<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
			class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-dribbble"></i></a>
		<a href="#"><i class="fa fa-envelope"></i></a>
	</div>

	<!-- Menu button -->
	<div id="menuToggle">
		<i class="fa fa-bars" style="margin-top:13px;"></i>
	</div>
	</nav>

	<!-- ========== HEADER SECTION ========== -->
	<section id="home" name="home"></section>
	<div id="itemwrap">
		<div class="container">
			<br>
			<h1>eSpace管理</h1>
			<h2 style="font-size:35px;">调整课表|预订申请管理</h2>
			<div class="row">
				<br> <br> <br>
				<div class="col-lg-6 col-lg-offset-3"></div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /headerwrap -->


	<!-- ========== WHITE SECTION ========== -->
	<section id="services" name="services"></section>
	<div id="dg">
		<div class="container">
			<div class="row">
				<h3 style="font-size: 40px; margin-top: 0">&nbsp;&nbsp;&nbsp;&nbsp;调整课表</h3>
				<br>
				<br>
				<div class="col-lg-3" style="text-align:left;">
					<div class="row">
						<label style="margin-bottom:10px;font-weight:300;">选择周次：</label>
						<div>
							<select id=zhouci name="zhouci"
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
					<div class="row" style="padding-top: 20px;">
						<label style="margin-bottom:10px;font-weight:300;">选择星期：</label>
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
					<div class="row" style="padding-top: 20px;" id="lesson_check">
						<label style="margin-bottom:10px;font-weight:300;">选择节次：</label>
						<div>
							<select id="lesson" name="Lesson"
								class="selectpicker show-tick form-control">
								<option value="">请选择</option>
								<option value="1">第一节</option>
								<option value="2">第二节</option>
								<option value="3">第三节</option>
								<option value="4">第四节</option>
								<option value="5">第五节</option>
							</select>
						</div>
					</div>
					<div class="row" style="padding-top: 20px;">
						<label style="margin-bottom:10px;font-weight:300;">选择状态：</label>
						<div>
							<select id="status" name="status"
								class="selectpicker show-tick form-control">
								<option value="status">所有</option>
						        <option value="'空'">空</option>
						        <option value="'课'">课</option>
						        <option value="'订'">订</option>
							</select>
						</div>
					</div>
					<div class="row" style="padding: 50px 0 0 0;">
						<button class="btn btn-large btn-primary btn-block" type="button" onclick="m_chooseTime()" id="form_check" disabled>查询</botton>
					</div>
					<script type="text/javascript">
					    document.getElementById("lesson_check").addEventListener("click", function() {
					    var nameInput = document.getElementById('lesson').value;
					    if (nameInput == "") {
					    	document.getElementById('form_check').setAttribute("disabled", null);
					    } else {
					        document.getElementById('form_check').removeAttribute("disabled");
					    }
					});
					</script>
				</div>
				<div class="col-lg-9" style="height:400px;overflow:auto;">
					<table class="table table-hover  table-condensed">
						<thead>
							<th style="text-align: center;">教室名</th>
							<th style="text-align: center;">教学楼</th>
							<th style="text-align: center;">楼层</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">加课</th>
						</thead>
						<tbody id="manage_tab">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /w -->

	<!-- ========== SERVICES - GREY SECTION ========== -->
	<section id="portfolio" name="portfolio"></section>
	<div id="g" style="background: #ADADAD">
		<div class="container">
			<div class="row">
				<h3 style="font-size: 40px;">预订管理</h3>
				<br> <br>
				<div class="col-lg-1"></div>
				<div class="col-lg-10"  style="background:#999;">
					<table class="table table-hover  table-condensed">
						<thead>
							<th style="text-align: center;">申请星期</th>
							<th style="text-align: center;">节次</th>
							<th style="text-align: center;">学号/职工号</th>
							<th style="text-align: center;">申请教室</th>
							<th style="text-align: center;">申请原因</th>
							<th style="text-align: center;">申请时间</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">操作</th>
						</thead>
						<tbody id="app_tab">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /g -->

	<!-- ========== ABOUT - GREY SECTION ========== -->
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
								<img src="img/item-04.png"
									style="height: 430px; margin-left: 65px;" alt="">
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
	<button id="test2" class="btn btn-link md-trigger" data-modal="modal-2"></button>
	<div class="md-modal md-effect-1" id="modal-2">
		<div class="md-content">
			<h3>申请原因</h3>
			<div>
				<div id="app_reason">
				</div>
				<button class="btn btn-default md-close" style="margin-top:20px;">关闭</button>
			</div>
		</div>
	</div>
	<div class="md-overlay"></div>
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