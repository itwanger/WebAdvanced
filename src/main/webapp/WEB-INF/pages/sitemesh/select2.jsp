<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<title>Select2——支持搜索、标记、远程数据和无限滚动的下拉框</title>
</head>
<sidekey>six-select2</sidekey>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Select2 <small>实例</small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">赶快练习吧</h3>

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
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>单选</label>
							<select class="js-example-basic-single form-control">
								<optgroup label="北直隶">
									<option value="STF">顺天府</option>
									<option value="BDF">保定府</option>
								</optgroup>
								<optgroup label="南直隶">
									<option value="YTF">应天府</option>
									<option value="SZF">苏州府</option>
									<option value="FYF">凤阳府</option>
								</optgroup>
								<optgroup label="河南承宣布政使司">
									<option value="KFF">开封府</option>
									<option value="HNF">河南府</option>
									<option value="NYF">南阳府</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							<label>多选</label>
							<select class="js-example-basic-multiple form-control" multiple="multiple">
								<optgroup label="北直隶">
									<option value="STF">顺天府</option>
									<option value="BDF">保定府</option>
								</optgroup>
								<optgroup label="南直隶">
									<option value="YTF">应天府</option>
									<option value="SZF">苏州府</option>
									<option value="FYF">凤阳府</option>
								</optgroup>
								<optgroup label="河南承宣布政使司">
									<option value="KFF">开封府</option>
									<option value="HNF">河南府</option>
									<option value="NYF">南阳府</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							<label>单选占位符</label>
							<select class="js-example-placeholder-single js-states form-control">
								<option></option>
							</select>
						</div>
						<div class="form-group">
							<label>多选占位符</label>
							<select class="js-example-placeholder-multiple js-states form-control" multiple="multiple"></select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Ajax</label>
							<select class="js-example-data-ajax form-control"></select>
						</div>
						<div class="form-group">
							<label>Array</label>
							<select class="js-example-data-array form-control"></select>
						</div>
						<div class="form-group">
							<button id="getSelectedData">获取选中项</button>
						</div>
						<div class="form-group">
							<label>JavaScript</label>
							<select id="mySelect2" class="form-control">
							</select>
						</div>
					</div>
				</div>

			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
	<!-- /.content -->
</body>
</html>
