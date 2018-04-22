<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>icheck line皮肤的基本应用</title>
<link href="${ctx}/resources/components/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/iCheck/1.0.2/skins/all.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2 class="demo-title">案例</h2>
		<div class="demo-list clearfix">
			<ul class="list">
				<li>
					<input tabindex="17" type="checkbox" id="line-checkbox-1"> <label for="line-checkbox-1">Checkbox 1</label>
				</li>
				<li>
					<input tabindex="18" type="checkbox" id="line-checkbox-2" checked> <label for="line-checkbox-2">Checkbox
						2</label>
				</li>
				<li>
					<input type="checkbox" id="line-checkbox-disabled" disabled> <label for="line-checkbox-disabled">Disabled</label>
				</li>
				<li>
					<input type="checkbox" id="line-checkbox-disabled-checked" checked disabled> <label
						for="line-checkbox-disabled-checked">Disabled &amp; checked</label>
				</li>
			</ul>
			<ul class="list">
				<li>
					<input tabindex="19" type="radio" id="line-radio-1" name="line-radio"> <label for="line-radio-1">Radio
						button 1</label>
				</li>
				<li>
					<input tabindex="20" type="radio" id="line-radio-2" name="line-radio" checked> <label for="line-radio-2">Radio
						button 2</label>
				</li>
				<li>
					<input type="radio" id="line-radio-disabled" disabled> <label for="line-radio-disabled">Disabled</label>
				</li>
				<li>
					<input type="radio" id="line-radio-disabled-checked" checked disabled> <label
						for="line-radio-disabled-checked">Disabled &amp; checked</label>
				</li>
			</ul>
		</div>
	</div>
	<script src="${ctx}/resources/components/jquery/jquery-3.3.1.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="https://cdn.bootcss.com/iCheck/1.0.2/icheck.js"></script>

<script>
	$(function() {
		// 使用Line皮肤时，需要通过`.each()`方法对input元素进行遍历，取出单独的复选框或者单选按钮
		$('input').each(function() {
			// 取出input元素后的label元素，并取出其文本，
			// 如<input type="checkbox"> <label>Checkbox 1</label>
			var self = $(this), label = self.next(), label_text = label.text();
			// 移除label元素
			label.remove();

			// 对input进行iCheck初始化
			self.iCheck({
				checkboxClass : 'icheckbox_line-blue',
				radioClass : 'iradio_line-blue',
				// '<div class="icheck_line-icon"></div>'为Line皮肤呈现出来时的x号或者√号
				insert : '<div class="icheck_line-icon"></div>' + label_text
			});
		});
	});
</script>
</body>
</html>
