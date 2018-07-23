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
								<input class="file" name="input-b2" type="file" 
									data-language="zh" 
									data-required="true" data-msg-file-required="请至少选择一个文件"
									data-min-file-size="1000"
									>
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
	</section>
	<!-- /.content -->
</body>
</html>
