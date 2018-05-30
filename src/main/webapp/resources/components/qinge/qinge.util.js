// 操作失败后的警告消息
$.error = function(content, yes) {
	var type = typeof yes === 'function', options = {
		icon : 2,
		title : '错误'
	};

	if (type) {
		layer.alert(content, options, function(index) {
			yes.call();
			layer.close(index);
		});
	} else {
		layer.alert(content, options);
	}
};

// 确认对话框
$.confirm = function(content, yes) {
	var type = typeof yes === 'function', options = {
		icon : 3,
		title : '确认',
	};

	if (type) {
		layer.confirm(content, options, function(index) {
			yes.call();
			layer.close(index);
		});
	} else {
		layer.confirm(content);
	}
};

// 操作成功后的提示消息
$.msg = function(content, end) {
	var type = typeof end === 'function';
	if (type) {
		layer.msg(content, end);
	} else {
		layer.msg(content);
	}
};
