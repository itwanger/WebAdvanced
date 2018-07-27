<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<title>增强版的HTML5文件输入框</title>
</head>
<sidekey>seven-fileinput</sidekey>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Bootstrap FileInput <small>实例</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">表单上传（单选）</h3>
					</div>
					<div class="box-body">
						<form id="bfForm" action="${ctx}/seven/saveFile" enctype="multipart/form-data" method="post" role="form">
							<div class="form-group">
								<input class="file" name="input-b2" type="file" data-language="zh" data-show-upload="false">
								<!-- 									data-required="true" data-msg-file-required="请至少选择一个文件" -->
								<!-- 									data-min-file-size="1000" -->
							</div>
							<div class="box-footer text-center">
								<button type="submit" class="btn btn-lg btn-success">
									<i class="fa fa-upload"></i> 上传
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Ajax上传（单选）</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<input id="input-b1" name="input-b1" type="file">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">表单上传（多选）</h3>
					</div>
					<div class="box-body">
						<form id="bfmForm" action="${ctx}/seven/saveFile" enctype="multipart/form-data" method="post" role="form">
							<div class="form-group">
								<input class="file" name="input-form-multiple[]" type="file" multiple data-language="zh">
							</div>
							<div class="box-footer text-center">
								<button type="submit" class="btn btn-lg btn-success">
									<i class="fa fa-upload"></i> 上传
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Ajax上传（多选）</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<input id="input-ajax-multiple" name="input-ajax-multiple[]" type="file" multiple>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">不显示文件预览</h3>
					</div>
					<div class="box-body">
						<input id="input-b2" name="input-b2" type="file" class="file" data-language="zh" data-show-preview="false">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">预览初始化</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<input id="input-pd" name="input-pd[]" type="file" multiple>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">RTL</h3>
					</div>
					<div class="box-body">
						<input id="input-b8" name="input-b8[]" multiple type="file" class="file" data-language="zh" data-rtl="true"
							data-drop-zone-enabled="false">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">预览内容的占位符</h3>
					</div>
					<div class="box-body">
						<div class="kv-avatar text-center">
							<div class="file-loading">
								<input id="avatar-1" name="avatar-1" type="file" required>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">文件被拖放（或通过浏览按钮选择文件）后自动上传至服务器端</h3>
					</div>
					<div class="box-body">
						<input id="bf7841" name="bf7841[]" type="file" multiple>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">删除文件前提醒用户进行确认</h3>
					</div>
					<div class="box-body">
						<div class="kv-avatar text-center">
							<div class="file-loading">
								<input id="bf7842" name="bf7842[]" type="file" multiple>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">基于Form表单上传文件前使用BootstrapValidator进行校验</h3>
					</div>
					<div class="box-body">
						<form id="bf7843Form" action="${ctx}/seven/saveFile" enctype="multipart/form-data" method="post" role="form">
							<div class="form-group">
								<label >用户名</label>
								<input type="text" class="form-control" name="username" placeholder="输入用户名">
							</div>
							<div class="form-group">
								<label>头像</label>
								<input id="bf7843" name="headimg" type="file" multiple accept="image/*">
							</div>
							<div class="box-footer text-center">
								<button type="submit" class="btn btn-lg btn-success">
									<i class="fa fa-upload"></i> 上传
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">切换主题</h3>
					</div>
					<div class="box-body">
								<input id="bf7845" name="bf7845[]" type="file" multiple>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">多文件上传 </h3>
					</div>
					<div class="box-body">
						<input id="bf7846" name="bf7846[]" type="file" multiple webkitdirectory>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">拖放文件夹 </h3>
					</div>
					<div class="box-body">
							<div class="file-loading">
								<input id="bf7847" name="bf7847[]" type="file" multiple>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>
