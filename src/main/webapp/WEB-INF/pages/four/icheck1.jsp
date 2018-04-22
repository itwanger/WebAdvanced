<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>icheck1的基本应用</title>
<link href="${ctx}/resources/components/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/iCheck/1.0.2/skins/all.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2 class="demo-title">案例</h2>
		<div class="demo-list clearfix">
			<ul>
				<li>
					<input tabindex="1" type="checkbox" id="input-1"> <label for="input-1">Checkbox, <span>#input-1</span></label>
				</li>
				<li>
					<input tabindex="2" type="checkbox" id="input-2" checked> <label for="input-2">Checkbox, <span>#input-2</span></label>
				</li>
			</ul>
			<ul>
				<li>
					<input tabindex="3" type="radio" id="input-3" name="iCheck"> <label for="input-3">Radio button, <span>#input-3</span>
					</label>
				</li>
				<li>
					<input tabindex="4" type="radio" id="input-4" name="iCheck" checked> <label for="input-4">Radio
						button, <span>#input-4</span>
					</label>
				</li>
			</ul>
		</div>
	</div>
	<script src="${ctx}/resources/components/jquery/jquery-3.3.1.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="https://cdn.bootcss.com/iCheck/1.0.2/icheck.js"></script>

	<script>
		$(function() {
			$('input').on('ifCreated', function(event) {
				console.log(event.type + ' callback');
			}).iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%'
			}).on('ifChecked', function(event) {
				console.log(event.type + ' callback');
			});
		});
	</script>
</body>
</html>
