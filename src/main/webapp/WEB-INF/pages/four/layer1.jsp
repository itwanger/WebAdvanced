<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Layer的基本应用</title>
</head>
<body>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/layer/3.1.0/layer.js"></script>
	<script>
		$(function() {
			//示范一个公告层
			layer.open({
				type : 1,
				title : false,//不显示标题栏
				closeBtn : false,
				area : '300px;',
				shade : 0.8,
				id : 'LAY_layuipro',//设定一个id，防止重复弹出
				resize : false,
				btn : [ '支持火箭', '支持勇士' ],
				btnAlign : 'c',
				moveType : 1,//拖拽模式，0或者1
				content : '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">哈登VS杜兰特</div>',
				success : function(layero) {
					var btn = layero.find('.layui-layer-btn');
					btn.find('.layui-layer-btn0').attr({
						href : 'https://blog.csdn.net/qing_gee',
						target : '_blank'
					});
				}
			});

		});
	</script>
</body>
</html>
