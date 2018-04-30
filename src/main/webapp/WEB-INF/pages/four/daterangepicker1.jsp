<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>DateRange Picker的基本应用</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.27/daterangepicker.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<div class="row">
				<div class='col-sm-4'>
					<div class="form-group daterange">
						<input class="form-control" type="text">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="https://cdn.bootcss.com/moment.js/2.22.1/moment.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.27/daterangepicker.js"></script>

	<script>
		$(function() {
			$('.daterange input').each(function() {
				var $this = $(this);
				$this.daterangepicker({
					locale : {
						customRangeLabel : '自定义',
						// 显示的日期格式为 年-月-日
						"format" : "YYYY-MM-DD",
						// 两个日期之间的分隔符为“/”
						"separator" : " / ",
						// 点击“确定”按钮把选择的日期范围带回到文本输入框
						"applyLabel" : "确定",
						"cancelLabel" : "清除",
						//星期日、星期一，一直到星期六
						"daysOfWeek" : [ "日", "一", "二", "三", "四", "五", "六" ],
						// 从一月到十二月
						"monthNames" : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
						// 取值范围为0-6，即从周日到周六
						// 我们中国人的习惯是从周一开始
						"firstDay" : 1
					},
					"ranges" : {
						'今日' : [ moment().startOf('day'), moment() ],
						'昨日' : [ moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day') ],
						'最近7日' : [ moment().subtract('days', 6), moment() ],
						'最近30日' : [ moment().subtract('days', 29), moment() ],
						'上个月' : [ moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month") ]
					},
				});
			})
		});
	</script>
</body>
</html>
