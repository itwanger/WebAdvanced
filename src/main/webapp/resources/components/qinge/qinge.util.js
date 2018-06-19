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

var chartjs = {
		createToolTipPositionConfig : function(position) {
			return {
				type: 'line',
				data: {
					labels: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
					datasets: [{
						label: '红色',
						borderColor: QINGE.chartjsColors.red,
						backgroundColor: QINGE.chartjsColors.red,
						data: [10, 30, 46, 2, 8, 50, 0],
						fill: false,
					}, {
						label: '蓝色',
						borderColor: QINGE.chartjsColors.blue,
						backgroundColor: QINGE.chartjsColors.blue,
						data: [7, 49, 46, 13, 25, 30, 22],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						position: position,
						mode: 'index',
						intersect: false,
					},
				}
			};
		},
		createToolTipModeConfig : function(mode) {
			return {
				type: 'line',
				data: {
					labels: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
					datasets: [{
						label: '红色',
						borderColor: QINGE.chartjsColors.red,
						backgroundColor: QINGE.chartjsColors.red,
						data: [10, 30, 46, 2, 8, 50, 0],
						fill: false,
					}, {
						label: '蓝色',
						borderColor: QINGE.chartjsColors.blue,
						backgroundColor: QINGE.chartjsColors.blue,
						data: [7, 49, 46, 13, 25, 30, 22],
						fill: false,
					}]
				},
				options: {
					responsive: true,
					tooltips: {
						mode: mode,
					},
				}
			};
		}
}
