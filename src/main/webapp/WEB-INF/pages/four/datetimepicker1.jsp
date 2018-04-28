<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Datetime Picker的基本应用</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/eonasdan-bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="bs-example">
			<div class="row">
				<div class='col-sm-4'>
					<div class="form-group">
						<div class='input-group datetime'>
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-4'>
					<div class="form-group">
						<div class='input-group datetime' data-format="LT">
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-4'>
					<div class="form-group">
						<div class='input-group datetime' data-format="L">
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class='col-sm-3'>
					<div class="form-group">
						<div class='input-group datetime' data-format="YYYY-MM-DD HH:mm:ss">
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-3'>
					<div class="form-group">
						<div class='input-group datetime' data-format="LLLL">
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-3'>
					<div class="form-group">
						<div class='input-group datetime' data-format="LLL">
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-3'>
					<div class="form-group">
						<div class='input-group datetime' data-format="LL">
							<input type='text' class="form-control" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class='col-sm-3'>
					<div class="form-group">
						<div class='input-group datetime' data-format="YYYY-MM-DD HH:mm:ss">
							<input type='text' class="form-control" value="2018-10-1 13:59:59" />
							<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="https://cdn.bootcss.com/moment.js/2.22.1/moment-with-locales.js"></script>
	<script src="https://cdn.bootcss.com/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

	<script>
		$(function() {
			$('.datetime').each(function() {
				var $this = $(this), format = $this.data("format");
				$this.datetimepicker({
					locale : 'zh-cn',
					format : format,
					showTodayButton : true,
					showClear : true,
				});
			})
		});
	</script>
</body>
</html>
