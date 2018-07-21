<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<title>不再令人痛苦的文件上传</title>
</head>
<sidekey>seven-headimg</sidekey>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			头像上传 <small>实例</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">天气很热，是个在家学习的好机会</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<form id="headimgForm" action="${ctx}/seven/saveHeadimg" enctype="multipart/form-data" method="post" role="form">
							<div class="box-body">
								<div class="form-group">
									<label>头像</label> <input name="headimg" type="file" accept="image/*">
								</div>
							</div>
							<!-- /.box-body -->

							<div class="box-footer">
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img id="headimg" class="profile-user-img img-responsive img-circle"
							src="${ctx}/resources/images/cmower160x160.jpg" alt="用户头像">

						<h3 class="profile-username text-center">沉默王二</h3>

						<p class="text-muted text-center">CSDN博客专家</p>

						<ul class="list-group list-group-unbordered">
							<li class="list-group-item">
								<b>博客等级</b> <a class="pull-right">Level 7</a>
							</li>
							<li class="list-group-item">
								<b>访问量</b> <a class="pull-right">129万+</a>
							</li>
							<li class="list-group-item">
								<b>排名</b> <a class="pull-right">1458</a>
							</li>
						</ul>

						<a href="#" class="btn btn-primary btn-block"> <b>为他点赞</b>
						</a>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>
