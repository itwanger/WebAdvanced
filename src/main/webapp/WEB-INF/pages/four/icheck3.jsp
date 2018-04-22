<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>iCheck的HTML扩展</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<h2 class="demo-title">案例</h2>
		<div class="demo-list clearfix icheck" data-color="pink">
			<ul>
				<li>
					<input tabindex="1" type="checkbox" id="input-1"> <label for="input-1">Checkbox, <span>Flat-pink-1</span></label>
				</li>
				<li>
					<input tabindex="2" type="checkbox" id="input-2" checked> <label for="input-2">Checkbox, <span>Flat-pink-2</span></label>
				</li>
			</ul>
			<ul>
				<li>
					<input tabindex="3" type="radio" id="input-3" name="iCheck"> <label for="input-3">Radio button, <span>Flat-pink-3</span>
					</label>
				</li>
				<li>
					<input tabindex="4" type="radio" id="input-4" name="iCheck" checked> <label for="input-4">Radio
						button, <span>Flat-pink-4</span>
					</label>
				</li>
			</ul>
		</div>
		<div class="demo-list clearfix icheck" data-skin="square">
			<ul>
				<li>
					<input tabindex="1" type="checkbox" id="input-1"> <label for="input-1">Checkbox, <span>Square-blue-1</span></label>
				</li>
				<li>
					<input tabindex="2" type="checkbox" id="input-2" checked> <label for="input-2">Checkbox, <span>Square-blue-2</span></label>
				</li>
			</ul>
			<ul>
				<li>
					<input tabindex="3" type="radio" id="input-3" name="iCheck"> <label for="input-3">Radio button, <span>Square-blue-3</span>
					</label>
				</li>
				<li>
					<input tabindex="4" type="radio" id="input-4" name="iCheck" checked> <label for="input-4">Radio
						button, <span>Square-blue-4</span>
					</label>
				</li>
			</ul>
		</div>
		
		<div class="demo-list clearfix icheck" data-skin="line" data-color="orange">
			<ul class="list">
				<li>
					<input tabindex="17" type="checkbox" id="line-checkbox-1"> <label for="line-checkbox-1">Line Checkbox 1</label>
				</li>
				<li>
					<input tabindex="18" type="checkbox" id="line-checkbox-2" checked> <label for="line-checkbox-2">Line Checkbox
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
					<input tabindex="19" type="radio" id="line-radio-1" name="line-radio"> <label for="line-radio-1">Line Radio
						button 1</label>
				</li>
				<li>
					<input tabindex="20" type="radio" id="line-radio-2" name="line-radio" checked> <label for="line-radio-2">Line Radio
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
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
