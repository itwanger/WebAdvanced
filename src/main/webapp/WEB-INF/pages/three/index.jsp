<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap粘页脚</title>
<%@ include file="/resources/common/csslib.jsp"%>
<style type="text/css">
html {
  position: relative;
  min-height: 100%;
}
body {
  /* 按页脚高度计算出body的底部边距  */
  margin-bottom: 60px;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  /* 在这里设置页脚的固定高度  */
  height: 60px;
  background-color: #000000;
}

.text-muted {
    color: white;
}

.container .text-muted {
	margin: 20px 0;
}
</style>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>我要粘页脚</h1>
		</div>
		<p class="lead">有些事情不是看到希望才去坚持，而是坚持了才会看到希望。</p>
	</div>

	<footer class="footer">
		<div class="container">
			<p class="text-muted">我是页脚页脚。</p>
		</div>
	</footer>

	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
