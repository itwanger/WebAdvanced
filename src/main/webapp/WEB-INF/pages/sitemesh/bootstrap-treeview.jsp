<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<title>Bootstrap-Treeview——一款非常酷的分层树结构插件</title>
</head>
<sidekey>six-btreeview</sidekey>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Bootstrap-Treeview <small>实例</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Bootstrap-Treeview的基本应用</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
							<div id="treeview1"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col (LEFT) -->
			<div class="col-md-6">
				<div class="box box-danger">
					<div class="box-header with-border">
						<h3 class="box-title">Bootstrap-Treeview的异步加载</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<button id="getData" data-url="${ctx}/six/treeview/submit">提交</button>
						<div id="treeview_procity" data-url="${ctx}/six/treeview/procity"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col (RIGHT) -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</body>
</html>
