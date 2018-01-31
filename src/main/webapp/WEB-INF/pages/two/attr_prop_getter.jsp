<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过attr()和prop()获取HTML属性值</title>
</head>
<body>
	<br>
	<br>
	<input id="c1" type="checkbox" checked="checked" />
	<label for="c1">checked="checked"</label>
	<br>
	<input id="c2" type="checkbox" checked="true" />
	<label for="c2">checked="true"</label>
	<br>
	<input id="c3" type="checkbox" checked="" />
	<label for="c3">checked=""</label>
	<br>
	<input id="c4" type="checkbox" checked />
	<label for="c4">checked</label>
	<br>
	<input id="c5" type="checkbox" checked="false" />
	<label for="c5">checked="false"</label>
	<br>
	<input id="c6" type="checkbox" />
	<label for="c6">尚未设置checked</label>

	<%@ include file="/resources/common/jslib.jsp"%>
<script type="text/javascript">
	$(function() {
		var attrs = [], props = [];

		$("input").each(function(i, n) {
			var attr = {}, prop = {}, $this = $(this);

			attr.id = $this.attr("id");
			attr.name = $this.attr("name");
			attr.cmower = $this.attr("cmower");
			attr.type = $this.attr("type");
			attr.checked = $this.attr("checked");
			attrs[i] = attr;

			prop.id = $this.prop("id");
			prop.name = $this.prop("name");
			prop.cmower = $this.prop("cmower");
			prop.type = $this.prop("type");
			prop.checked = $this.prop("checked");
			props[i] = prop;
		});
		console.log("attr()方法获取属性结果");
		console.table(attrs);
		console.log("prop()方法获取属性结果");
		console.table(props);
	});
</script>
</body>
</html>
