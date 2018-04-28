<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Datetime Picker的HTML扩展</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="container">
		<div class="bs-example">
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
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
