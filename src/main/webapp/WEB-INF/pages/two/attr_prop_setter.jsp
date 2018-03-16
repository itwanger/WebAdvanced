<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过attr()和prop()设置HTML属性值</title>
</head>
<body>
	<input id="c1" type="checkbox" />
	<label for="c1">attr选中</label>
	<br>
	<input id="c2" type="checkbox" name="checkbox" cmower="沉默王二" checked="checked" />
	<label for="c2">attr取消</label>
	<br>
	<input id="c3" type="checkbox" />
	<label for="c3">prop选中</label>
	<br>
	<input id="c4" type="checkbox" name="checkbox" cmower="沉默王二" checked="checked" />
	<label for="c4">prop取消</label>
	<br>

	<%@ include file="/resources/common/jslib.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#c1").attr({
			name : "checkbox",
			cmower : "沉默王二",
			checked : true,
		}).next().html($("#c1").attr("name") + "," + $("#c1").attr("cmower") + "," + $("#c1").attr("checked"));
		$("#c2").attr({
			name : "",
			cmower : "",
			checked : false,
		}).next().html($("#c2").attr("name") + "," + $("#c2").attr("cmower") + "," + $("#c2").attr("checked"));
		$("#c3").prop({
			name : "checkbox",
			cmower : "沉默王二",
			checked : true,
		}).next().html($("#c3").prop("name") + "," + $("#c3").prop("cmower") + "," + $("#c3").prop("checked"));
		$("#c4").prop({
			name : "",
			cmower : "",
			checked : false,
		}).next().html($("#c4").prop("name") + "," + $("#c4").prop("cmower") + "," + $("#c4").prop("checked"));
	});
</script>
</body>
</html>
