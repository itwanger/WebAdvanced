<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过val()获取Form表单域的值</title>
</head>
<body>
	<form>
		<label>用户：</label>
		<input type="text" name="user" value="沉默王二">
		<br>
		<label>密码：</label>
		<input type="password" name="password" value="123456">
		<br>
		<label>我喜欢李孝利：</label>
		<input type="checkbox" name="star" value="Lee Hyo Ri" checked="checked">
		<br>
		<label>我喜欢章子怡：</label>
		<input type="checkbox" name="star" value="Zhang Ziyi" checked="checked">
		<br>
		<label>女性：</label>
		<input type="radio" name="sex" value="female" />
		<br>
		<label>男性：</label>
		<input type="radio" name="sex" value="male" checked="checked" />
		<br>
		<label>支持的足球队：</label>
		<select name="football">
			<option value="Real Madrid">皇马</option>
			<option value="Barcelona">巴萨</option>
			<option value="Manchester United" selected="selected">曼联</option>
			<option value="Liverpool">利物浦</option>
		</select>
		<br>
		<label>支持的篮球队：</label>
		<select name="basketball" multiple="multiple">
			<option value="Houston Rockets" selected="selected">火箭</option>
			<option value="Golden State Warriors" selected="selected">勇士</option>
			<option value="Boston Celtics" selected="selected">凯尔特人</option>
			<option value="Cleveland Cavaliers">骑士</option>
		</select>
		<br>
		<label>备注：</label>
		<textarea name="memo">养成早起的习惯十分重要！</textarea>
	</form>
	<%@ include file="/resources/common/jslib.jsp"%>
	<script type="text/javascript">
		$(function() {
			console.log("用户：" + $("input[name=user]").val());
			console.log("密码：" + $("input[name=password]").val());
			console.log("备注：" + $("textarea[name=memo]").val());

			var star = $("input[name=star]:checked").map(function() {
				return this.value;
			}).get();
			console.log("明星：" + star.join(", "));
			console.log("性别：" + $("input[name=sex]:checked").val());

			console.log("足球队：" + $("select[name=football]").val());
			console.log("篮球队：" + $("select[name=basketball]").val());
		});
	</script>
</body>
</html>
