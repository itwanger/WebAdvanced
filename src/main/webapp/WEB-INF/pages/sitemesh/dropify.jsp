<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<title>基于H5的图片拖拽和预览插件</title>
</head>
<sidekey>seven-dropify</sidekey>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Dropify上传 <small>实例</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-body">
						<div class="form-group">
							<label>默认配置</label>
							<input class="dropify" id="dropifyImg" name="dropifyImg" type="file" data-allowed-file-extensions="png jpg"
								data-max-file-size="1M" data-default-file="${ctx}/resources/images/cmower160x160.jpg" data-show-remove="false"
								data-url="${ctx}/seven/saveDropifyImg" />
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6"></div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>
