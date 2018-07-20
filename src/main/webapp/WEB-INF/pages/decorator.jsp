<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title><sitemesh:write property='title' /></title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<a href="#" class="logo"> <span class="logo-mini"> Web </span> <span class="logo-lg"> WebAdvanced </span>
			</a>
			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle
						navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown messages-menu"></li>
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="hidden-xs">沉默王二</span>
							</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header">
									<img class="img-circle" src="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4">
									<p>
										Web全栈开发进阶之路 <small>努力</small>
									</p>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">修改密码</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat">退出</a>
									</div>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" data-toggle="control-sidebar"> <i class="fa fa-gears"></i>
							</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="main-sidebar">
			<section class="sidebar">
				<div class="user-panel">
					<div class="pull-left image">
						<img src="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>沉默王二</p>
						<a href="#"> <i class="fa fa-circle text-success"></i> 在线
						</a>
					</div>
				</div>
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control" placeholder="搜索"> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn" class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<ul class="sidebar-menu" data-widget="tree" data-sidekey="<sitemesh:write property='sidekey' />">
					<li class="header">内容导航</li>
					<li class="treeview dashboard">
						<a href="#"> <i class="fa fa-dashboard"></i> <span>首页</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="https://github.com/qinggee"> <i class="fa fa-circle-o"></i> GitHub 主页
								</a>
							</li>
							<li>
								<a href="http://blog.csdn.net/qing_gee"> <i class="fa fa-circle-o"></i> CSDN 主页
								</a>
							</li>
						</ul>
					</li>
					<li class="one">
						<a href="${ctx}/one"> <i class="fa fa-bookmark"></i> <span>第一章</span>
						</a>
					</li>
					<li class="treeview two">
						<a href="#"> <i class="fa fa-book"></i> <span>第二章</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${ctx}/two"> <i class="fa fa-circle-o"></i> 2.2 编写第一行jQuery代码
								</a>
							</li>
							<li>
								<a href="${ctx}/two/domOperation"> <i class="fa fa-circle-o"></i> 2.4 jQuery中的DOM操作
								</a>
							</li>
							<li>
								<a href="${ctx}/two/ajaxNprogress"> <i class="fa fa-circle-o"></i> 2.6 jQuery中的Ajax
								</a>
							</li>
						</ul>
					</li>
					<li class="treeview three">
						<a href="#"> <i class="fa fa-book"></i> <span>第三章</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${ctx}/three"> <i class="fa fa-circle-o"></i> 3.2 Bootstrap粘页脚
								</a>
							</li>
							<li>
								<a href="${ctx}/three/headroomAnimated"> <i class="fa fa-circle-o"></i> 3.6 Bootstrap的导航条
								</a>
							</li>
						</ul>
					</li>
					<li class="treeview four">
						<a href="#"> <i class="fa fa-book"></i> <span>第四章</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${ctx}/four/lazyload2"> <i class="fa fa-circle-o"></i> 4.2 Lazy Load
								</a>
							</li>
							<li>
								<a href="${ctx}/four/icheck3"> <i class="fa fa-circle-o"></i> 4.3 iCheck
								</a>
							</li>
							<li>
								<a href="${ctx}/four/switch2"> <i class="fa fa-circle-o"></i> 4.4 Switch
								</a>
							</li>
							<li>
								<a href="${ctx}/four/datetimepicker2"> <i class="fa fa-circle-o"></i> 4.5 Datetime Picker
								</a>
							</li>
							<li>
								<a href="${ctx}/four?p=daterangepicker2"> <i class="fa fa-circle-o"></i> 4.6 DateRange Picker
								</a>
							</li>
							<li>
								<a href="${ctx}/four?p=tagsinput2"> <i class="fa fa-circle-o"></i> 4.7 Tags Input
								</a>
							</li>
							<li>
								<a href="${ctx}/four?p=star-rating2"> <i class="fa fa-circle-o"></i> 4.8 Star Rating
								</a>
							</li>
							<li>
								<a href="${ctx}/four?p=layer1"> <i class="fa fa-circle-o"></i> 4.9 Layer
								</a>
							</li>
							<li>
								<a href="${ctx}/four?p=magnificPopup2"> <i class="fa fa-circle-o"></i> 4.10 Magnific Popup
								</a>
							</li>
						</ul>
					</li>
					<li class="five">
						<a href="${ctx}/user/test"> <i class="fa fa-bookmark"></i> <span>第五章</span>
						</a>
					</li>
					<li class="treeview six">
						<a href="#"> <i class="fa fa-book"></i> <span>第六章</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li class="sitemesh">
								<a href="${ctx}"> <i class="fa fa-circle-o"></i> SiteMesh
								</a>
							</li>
							<li class="chartjs">
								<a href="${ctx}/sitemesh?p=chartjs"> <i class="fa fa-circle-o"></i> Chart.js
								</a>
							</li>
							<li class="select2">
								<a href="${ctx}/sitemesh?p=select2"> <i class="fa fa-circle-o"></i> Select2
								</a>
							</li>
							<li class="btreeview">
								<a href="${ctx}/sitemesh?p=bootstrap-treeview"> <i class="fa fa-circle-o"></i> Bootstrap-Treeview
								</a>
							</li>
						</ul>
					</li>
					<li class="treeview seven">
						<a href="#"> <i class="fa fa-book"></i> <span>第七章</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${ctx}/seven/login"> <i class="fa fa-circle-o"></i> BootstrapValidator
								</a>
							</li>
							<li>
								<a href="${ctx}/seven?p=validform"> <i class="fa fa-circle-o"></i> Validform
								</a>
							</li>
							<li>
								<a href="${ctx}/seven/login"> <i class="fa fa-circle-o"></i> 验证码
								</a>
							</li>
							<li>
								<a href="${ctx}/seven?p=geetest"> <i class="fa fa-circle-o"></i> Geetest
								</a>
							</li>
							<li class="headimg">
								<a href="${ctx}/sitemesh?p=headimg"> <i class="fa fa-circle-o"></i> 上传头像
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="../calendar.html"> <i class="fa fa-calendar"></i> <span>Calendar</span> <span
							class="pull-right-container"> <small class="label pull-right bg-red">3</small> <small
								class="label pull-right bg-blue">17</small>
						</span>
						</a>
					</li>
					<li>
						<a href="../mailbox/mailbox.html"> <i class="fa fa-envelope"></i> <span>Mailbox</span> <span
							class="pull-right-container"> <small class="label pull-right bg-yellow">12</small> <small
								class="label pull-right bg-green">16</small> <small class="label pull-right bg-red">5</small>
						</span>
						</a>
					</li>
					<li class="treeview">
						<a href="#"> <i class="fa fa-folder"></i> <span>Examples</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="../examples/invoice.html"> <i class="fa fa-circle-o"></i> Invoice
								</a>
							</li>
							<li>
								<a href="../examples/profile.html"> <i class="fa fa-circle-o"></i> Profile
								</a>
							</li>
							<li>
								<a href="../examples/login.html"> <i class="fa fa-circle-o"></i> Login
								</a>
							</li>
							<li>
								<a href="../examples/register.html"> <i class="fa fa-circle-o"></i> Register
								</a>
							</li>
							<li>
								<a href="../examples/lockscreen.html"> <i class="fa fa-circle-o"></i> Lockscreen
								</a>
							</li>
							<li>
								<a href="../examples/404.html"> <i class="fa fa-circle-o"></i> 404 Error
								</a>
							</li>
							<li>
								<a href="../examples/500.html"> <i class="fa fa-circle-o"></i> 500 Error
								</a>
							</li>
							<li>
								<a href="../examples/blank.html"> <i class="fa fa-circle-o"></i> Blank Page
								</a>
							</li>
							<li>
								<a href="../examples/pace.html"> <i class="fa fa-circle-o"></i> Pace Page
								</a>
							</li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#"> <i class="fa fa-share"></i> <span>Multilevel</span> <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="#"> <i class="fa fa-circle-o"></i> Level One
								</a>
							</li>
							<li class="treeview">
								<a href="#"> <i class="fa fa-circle-o"></i> Level One <span class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span>
								</a>
								<ul class="treeview-menu">
									<li>
										<a href="#"> <i class="fa fa-circle-o"></i> Level Two
										</a>
									</li>
									<li class="treeview">
										<a href="#"> <i class="fa fa-circle-o"></i> Level Two <span class="pull-right-container"> <i
												class="fa fa-angle-left pull-right"></i>
										</span>
										</a>
										<ul class="treeview-menu">
											<li>
												<a href="#"> <i class="fa fa-circle-o"></i> Level Three
												</a>
											</li>
											<li>
												<a href="#"> <i class="fa fa-circle-o"></i> Level Three
												</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<a href="#"> <i class="fa fa-circle-o"></i> Level One
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="https://adminlte.io/docs"> <i class="fa fa-book"></i> <span>Documentation</span>
						</a>
					</li>
					<li class="header">LABELS</li>
					<li>
						<a href="#"> <i class="fa fa-circle-o text-red"></i> <span>Important</span>
						</a>
					</li>
					<li>
						<a href="#"> <i class="fa fa-circle-o text-yellow"></i> <span>Warning</span>
						</a>
					</li>
					<li>
						<a href="#"> <i class="fa fa-circle-o text-aqua"></i> <span>Information</span>
						</a>
					</li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<div class="content-wrapper">
			<sitemesh:write property='body' />
		</div>

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			Copyright &copy; 2017-2019 马伟青（<strong><a href="https://github.com/qinggee/WebAdvanced">下载源码</a></strong>）. All
			rights reserved.
		</footer>
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li>
					<a href="#control-sidebar-home-tab" data-toggle="tab"> <i class="fa fa-home"></i>
					</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">近期活动</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:void(0)"> <i class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">女儿的生日</h4>

									<p>就快要3岁了！</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)"> <i class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">小王老师出了新书</h4>

									<p>这真是一件值得庆祝的事情</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)"> <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">小二哥发现了bug</h4>

									<p>但他就是不愿说！</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)"> <i class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">本书卖了3000册</h4>

									<p>用了不到一个月的时间</p>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">书稿进度</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									开源的Web前端利器 <span class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									HTML扩展 <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success" style="width: 95%"></div>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Form表单的应用 <span class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning" style="width: 50%"></div>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									优秀插件应用 <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary" style="width: 68%"></div>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<div class="control-sidebar-bg"></div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>