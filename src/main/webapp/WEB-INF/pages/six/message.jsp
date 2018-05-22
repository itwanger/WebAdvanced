<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>在自定义区域中显示错误消息</title>
<%@ include file="/resources/common/csslib.jsp"%>

<style type="text/css">
/* 简单的定制样式 */
#errors {
	border-left: 5px solid #a94442;
	padding-left: 15px;
}

#errors li {
	list-style-type: none;
}

#errors li:before {
	content: '\b7\a0';
}
</style>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#">
				<b>Web</b>全栈开发进阶之路
			</a>
		</div>
		<div class="login-box-body">
			<ul id="errors">
			</ul>

			<form id="messageForm" action="#" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="username" data-bv-notempty data-bv-notempty-message="账号不允许为空"
						placeholder="账号">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="password" data-bv-notempty data-bv-notempty-message="密码不允许为空"
						placeholder="密码">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck" data-skin="square">
							<label>
								<input type="checkbox">
								记住我
							</label>
						</div>
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${ctx}/resources/components/jquery/jquery-3.3.1.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
	<script src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/language/zh_CN.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#messageForm').each(function() {
				var $form = $(this);
				$form.bootstrapValidator()
					.on('success.form.bv', function(e) {
						e.preventDefault();
						// 验证通过时清除提示信息
						$('#errors').html('');
					})
					.on('error.field.bv', function(e, data) {
							// data.bv      --> BootstrapValidator实例
							// data.field   --> 字段名
							// data.element --> 字段元素

							// 清除该字段原有的提示信息
							$('#errors').find('li[data-field="' + data.field + '"]').remove();

							// 获取该字段现有的所有提示信息
							var messages = data.bv.getMessages(data.field);

							// 对信息进行遍历
							for ( var i in messages) {
								// 创建一个<li>元素来显示提示信息
								$('<li/>')
									.attr('data-field', data.field)
									.wrapInner(
										$('<a/>')
											.attr('href', 'javascript: void(0);')
											.html(messages[i])
											.on('click', function(e) {
											// 点击提示信息时，把焦点聚焦到对应的元素上
											data.element.focus();
										})
									)
									// 提示信息添加到指定的容器中
									.appendTo('#errors');
							}

							// 隐藏默认的提示信息
							// data.element.data('bv.messages') 返回字段默认的提示信息元素
							data.element
								.data('bv.messages')
								.find('.help-block[data-bv-for="' + data.field + '"]')
								.hide();
						})
						.on('success.field.bv', function(e, data) {
							// 该字段验证成功时移除对应的提示信息
							$('#errors').find('li[data-field="' + data.field + '"]').remove();
						});
			});
		});
	</script>
</body>
</html>
