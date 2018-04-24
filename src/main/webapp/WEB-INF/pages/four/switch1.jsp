<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>switch的基本应用</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-switch/3.3.4/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2 class="demo-title">案例</h2>
		<div class="demo-list clearfix">
			<div class="row">
				<input class="switch" type="checkbox">
				<input class="switch" type="checkbox" checked>
				<input class="switch" type="radio" name="Switch">
				<input class="switch" type="radio" name="Switch" checked>
			</div>
			<div class="blank10"></div>
			<div class="row">
				<!-- null，即默认情况 -->
				<input class="switch" type="checkbox">
				<!-- mini -->
				<input class="switch" type="checkbox" data-size="mini">
				<!-- mini -->
				<input class="switch" type="checkbox" data-size="small">
				<!-- mini -->
				<input class="switch" type="checkbox" data-size="normal">
				<!-- mini -->
				<input class="switch" type="checkbox" data-size="large">
			</div>
			<div class="blank10"></div>
			<div class="row">
				<input class="switch" type="checkbox" data-on-color="primary" checked>
				<input class="switch" type="checkbox" data-on-color="info" checked>
				<input class="switch" type="checkbox" data-on-color="success" checked>
				<input class="switch" type="checkbox" data-on-color="warning" checked>
				<input class="switch" type="checkbox" data-on-color="danger" checked>
			</div>
			<div class="blank10"></div>
			<div class="row">
				<input class="switch" type="checkbox" data-off-color="primary">
				<input class="switch" type="checkbox" data-off-color="info">
				<input class="switch" type="checkbox" data-off-color="success">
				<input class="switch" type="checkbox" data-off-color="warning">
				<input class="switch" type="checkbox" data-off-color="danger">
			</div>

			<div class="blank10"></div>
			<div class="row">
				<input class="switch" type="checkbox" checked>
				<input class="switch" type="checkbox" data-on-text="开" checked>
				<input class="switch" type="checkbox" data-on-text="<i class='glyphicon glyphicon-ok'></i>" checked>
				<input class="switch" type="checkbox">
				<input class="switch" type="checkbox" data-off-text="关">
				<input class="switch" type="checkbox" data-off-text="<i class='glyphicon glyphicon-remove'></i>">
			</div>
			<div class="blank10"></div>
			<div class="row">
				<input class="switch" type="checkbox" name="state">
			</div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-switch/3.3.4/js/bootstrap-switch.js"></script>

	<script>
		$(function() {
			$('input.switch').bootstrapSwitch().on('switchChange.bootstrapSwitch', function(event, state) {
				console.log(state); // true | false
			});
			$('input[name="state"]').bootstrapSwitch('state', true, true);
			$('input[name="state"]').bootstrapSwitch('size', 'mini');
			console.log($('input[name="state"]').bootstrapSwitch('onText'));
		});
	</script>
</body>
</html>
