<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过val()设置Form表单域的值</title>
</head>
<body>
	<form>
		<label>用户：</label>
		<input type="text" name="user">
		<br>
		<label>密码：</label>
		<input type="password" name="password">
		<br>
		<label>我喜欢李孝利：</label>
		<input type="checkbox" name="star" value="Lee Hyo Ri">
		<br>
		<label>我喜欢章子怡：</label>
		<input type="checkbox" name="star" value="Zhang Ziyi">
		<br>
		<label>女性：</label>
		<input type="radio" name="sex" value="female" />
		<br>
		<label>男性：</label>
		<input type="radio" name="sex" value="male" />
		<br>
		<label>支持的足球队：</label> <select name="football">
			<option value="Real Madrid">皇马</option>
			<option value="Barcelona">巴萨</option>
			<option value="Manchester United">曼联</option>
			<option value="Liverpool">利物浦</option>
		</select>
		<br>
		<label>支持的篮球队：</label> <select name="basketball" multiple="multiple">
			<option value="Houston Rockets">火箭</option>
			<option value="Golden State Warriors">勇士</option>
			<option value="Boston Celtics">凯尔特人</option>
			<option value="Cleveland Cavaliers">骑士</option>
		</select>
		<br>
		<label>备注：</label>
		<textarea name="memo"></textarea>
	</form>
	<%@ include file="/resources/common/jslib.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("input[name=user]").val("沉默王二");
			$("input[name=password]").val("123456");
			$("textarea[name=memo]").val("养成早起的习惯十分重要！");

			$("input[name=star]").val([ "Lee Hyo Ri", "Zhang Ziyi" ]);
			$("input[name=sex]").val([ "male" ]);// 正确
			//$("input[name=sex]").val("male");// 错误

			$("select[name=football]").val("Manchester United");
			// 或者
			// $("select[name=football]").val(["Manchester United"]);
			$("select[name=basketball]").val([ "Houston Rockets", "Golden State Warriors", "Boston Celtics" ]);
			// 多选的情况下只选中一个时
			// $("select[name=basketball]").val("Houston Rockets");
		});
	</script>
</body>
</html>
