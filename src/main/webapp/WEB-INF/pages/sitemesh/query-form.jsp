<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<title>筛选结果的查询类表单</title>
</head>
<sidekey>seven-queryForm</sidekey>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			查询类表单 <small>实例</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">查询类表单</h3>

						<div class="box-tools">
<form id="queryForm" action="${ctx}/sitemesh?p=query-form" method="post" role="form">
	<div class="input-group input-group-sm" style="width: 150px;">
		<input type="text" name="realname" value="${param.realname}" class="form-control pull-right" placeholder="用户名">

		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
</form>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
<table class="table table-hover">
	<tr>
		<th>头像</th>
		<th>昵称</th>
		<th>简介</th>
	</tr>
	<c:forEach var="item" items="${list}">
		<tr>
			<td><img class="direct-chat-img" src="${item.headimg}" alt="${item.realname}"></td>
			<td>${item.realname}</td>
			<td>${item.brief}</td>
		</tr>
	</c:forEach>

</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>
