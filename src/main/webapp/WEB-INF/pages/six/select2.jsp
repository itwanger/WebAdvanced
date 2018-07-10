<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Select2——支持搜索、标记、远程数据和无限滚动的下拉框</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="bs-example">
		<select class="js-example-basic-single form-control">
			<optgroup label="北直隶">
				<option value="STF">顺天府</option>
				<option value="BDF">保定府</option>
			</optgroup>
			<optgroup label="南直隶">
				<option value="YTF">应天府</option>
				<option value="SZF">苏州府</option>
				<option value="FYF">凤阳府</option>
			</optgroup>
			<optgroup label="河南承宣布政使司">
				<option value="KFF">开封府</option>
				<option value="HNF">河南府</option>
				<option value="NYF">南阳府</option>
			</optgroup>
		</select>
	</div>
	<select class="js-example-basic-multiple form-control" multiple="multiple">
		<optgroup label="北直隶">
			<option value="STF">顺天府</option>
			<option value="BDF">保定府</option>
		</optgroup>
		<optgroup label="南直隶">
			<option value="YTF">应天府</option>
			<option value="SZF">苏州府</option>
			<option value="FYF">凤阳府</option>
		</optgroup>
		<optgroup label="河南承宣布政使司">
			<option value="KFF">开封府</option>
			<option value="HNF">河南府</option>
			<option value="NYF">南阳府</option>
		</optgroup>
	</select>

	<div class="bs-example">
		<select class="js-example-data-ajax form-control"></select>
	</div>

	<div class="bs-example">
		<select class="js-example-data-array form-control"></select>
	</div>

	<select class="js-example-placeholder-single js-states form-control">
		<option></option>
	</select>
	<select class="js-example-placeholder-multiple js-states form-control" multiple="multiple"></select>

	<div class="bs-example">
		<select id="mySelect2" class="form-control">
		</select>
	</div>
	
	<button id="getSelectedData">获取选中项</button>

	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
