<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap的响应式表格</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>星期</th>
					<th>正能量</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>星期一</td>
					<td>面对敌人需要勇气，但敢于直面朋友，需要更大的勇气</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>星期二</td>
					<td>真正的爱情不是一时好感，而是我知道遇到你不容易，错过了会很可惜</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>星期三</td>
					<td>不要害怕黑暗，不要害怕追寻自己的梦想，不要害怕做与众不同的自己，走你自己的路</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>星期四</td>
					<td>面对敌人需要勇气，但敢于直面朋友，需要更大的勇气</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>星期五</td>
					<td>真正的爱情不是一时好感，而是我知道遇到你不容易，错过了会很可惜</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td>星期六</td>
					<td>不要害怕黑暗，不要害怕追寻自己的梦想，不要害怕做与众不同的自己，走你自己的路</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- /.table-responsive -->

	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
