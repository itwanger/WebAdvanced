<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap图标</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-trash"></span>
				删除
			</button>
			有空格
			<br>
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-trash"></span>
				删除
			</button>
			无空格
			<br>

			<span class="glyphicons glyphicons-user-add"></span>
		</div>

		<div class="bs-example">
			<a class="btn btn-danger" href="#">
				<i class="fa fa-bath"></i>
				洗澡
			</a>
			<br>

			<i class="fa fa-bath fa-lg"></i>
			洗澡
			<i class="fa fa-bath fa-2x"></i>
			洗澡
		</div>

		<div class="bs-example">
			<div class="list-group">
				<a class="list-group-item" href="#">
					<i class="fa fa-home fa-fw"></i>
					&nbsp; 主页
				</a>
				<a class="list-group-item" href="#">
					<i class="fa fa-book fa-fw"></i>
					&nbsp; 帮助文档
				</a>
				<a class="list-group-item" href="#">
					<i class="fa fa-cog fa-fw"></i>
					&nbsp; 设置
				</a>
			</div>
		</div>

		<div class="bs-example">
			<ul class="fa-ul">
				<li><i class="fa-li fa fa-check-square"></i>黄金时代</li>
				<li><i class="fa-li fa fa-check-square"></i>青铜时代</li>
				<li><i class="fa-li fa fa-square"></i>白银时代</li>
			</ul>
		</div>

		<div class="bs-example">
			<i class="fa fa-spinner fa-2x fa-spin"></i>
			<i class="fa fa-circle-o-notch fa-2x fa-spin"></i>
			<i class="fa fa-refresh fa-2x fa-spin"></i>
			<i class="fa fa-cog fa-2x fa-spin"></i>
			<i class="fa fa-spinner fa-2x fa-pulse"></i>
		</div>

		<div class="bs-example">
			<i class="fa fa-shield"></i>
			正常
			<br>
			<i class="fa fa-shield fa-rotate-90"></i>
			旋转90度
			<br>
			<i class="fa fa-shield fa-rotate-180"></i>
			选装180度
			<br>
			<i class="fa fa-shield fa-rotate-270"></i>
			旋转270度
			<br>
			<i class="fa fa-shield fa-flip-horizontal"></i>
			水平翻转
			<br>
			<i class="fa fa-shield fa-flip-vertical"></i>
			垂直翻转
		</div>

		<div class="bs-example">
			<i class="iconfont icon-set"></i>
			设置
			<i class="iconfont icon-cart"></i>
			购物车
			<i class="iconfont icon-all"></i>
			全部
			<i class="iconfont icon-qian"></i>
			财富
		</div>

		<div class="bs-example">
			<span class="text-danger">
				<i class="iconfont icon-set"></i>
				设置
			</span>
			<span class="text-warning">
				<i class="iconfont icon-set fa-2x"></i>
				设置
			</span>
			<span class="text-success">
				<i class="iconfont icon-set fa-2x fa-spin"></i>
				设置
			</span>
		</div>

		<div class="bs-example">
<div class="btn-group">
	<a class="btn btn-default" href="#">
		<i class="fa fa-align-left"></i>
	</a>
	<a class="btn btn-default" href="#">
		<i class="fa fa-align-center"></i>
	</a>
	<a class="btn btn-default" href="#">
		<i class="fa fa-align-right"></i>
	</a>
	<a class="btn btn-default" href="#">
		<i class="fa fa-align-justify"></i>
	</a>
</div>
<div class="input-group">
	<span class="input-group-addon">
		<i class="fa fa-envelope-o fa-fw"></i>
	</span>
	<input class="form-control" type="text" placeholder="邮箱">
</div>
		</div>

		<div class="bs-example">
			
		</div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
