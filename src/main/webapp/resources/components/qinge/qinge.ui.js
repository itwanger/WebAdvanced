function initOnce() {
	// -----------------
	// - 登录表单进行BootstrapValidator初始化
	// -----------------
	$('#loginForm').bootstrapValidator({}).on('success.form.bv', function(e) {
		e.preventDefault();

		var $form = $(e.target), bv = $form.data('bootstrapValidator'); // BootstrapValidator
		$.ajax({
			type : $form.attr("method") || 'POST',
			url : $form.attr("action"),
			data : $form.serializeArray(),
			cache : false,
			dataType : "json",
			success : function(json) {
				if (json.statusCode == 200) {
					window.location.href = json.forwardUrl;
				} else {
					bv.updateMessage(json.field, 'blank', json.message);
					bv.updateStatus(json.field, 'INVALID', 'blank');
				}
			},
		});
	});

	$('#bvMessageForm').bootstrapValidator().on('success.form.bv', function(e) {
		e.preventDefault();
		// 验证通过时清除提示信息
		$('#errors').html('');
	}).on('error.field.bv', function(e, data) {
		// data.bv --> BootstrapValidator实例
		// data.field --> 字段名
		// data.element --> 字段元素

		// 清除该字段原有的提示信息
		$('#errors').find('li[data-field="' + data.field + '"]').remove();

		// 获取该字段现有的所有提示信息
		var messages = data.bv.getMessages(data.field);

		// 对信息进行遍历
		for ( var i in messages) {
			// 创建一个<li>元素来显示提示信息
			$('<li/>').attr('data-field', data.field).wrapInner($('<a/>').attr('href', 'javascript: void(0);').html(messages[i]).on('click', function(e) {
				// 点击提示信息时，把焦点聚焦到对应的元素上
				data.element.focus();
			}))
			// 提示信息添加到指定的容器中
			.appendTo('#errors');
		}

		// 隐藏默认的提示信息
		// data.element.data('bv.messages') 返回字段默认的提示信息元素
		data.element.data('bv.messages').find('.help-block[data-bv-for="' + data.field + '"]').hide();
	}).on('success.field.bv', function(e, data) {
		// 该字段验证成功时移除对应的提示信息
		$('#errors').find('li[data-field="' + data.field + '"]').remove();
	});

	// -----------------
	// - 注册表单进行BootstrapValidator初始化
	// -----------------
	$('#bvRemoteForm').bootstrapValidator({
		fields : {
			username : {
				verbose : false,
				validators : {
					notEmpty : {
						message : '账号是必须的'
					},
					stringLength : {
						min : 4,
						max : 8,
						message : '账号的长度在4-8个字符'
					},
					remote : {
						url : '/WebAdvanced/six/username/check',
						data : function(validator, $field, value) {
							return {
								email : validator.getFieldElements('email').val()
							};
						},
						message : '账号不可用',
					}
				}
			},
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
	});

	// -----------------
	// - 登录表单进行Validform初始化
	// -----------------
	$('#validForm').Validform({
		tiptype : function(msg, o, cssctl) {
			$.error(msg);
		},
		tipSweep : true,
		ajaxPost : true,
		callback : function(json) {
			if (json.statusCode == 200) {
				window.location.href = json.forwardUrl;
			} else {
				$.error(msg);
			}
		}
	});
	// -----------------
	// - Validform——在自定义区域中显示错误消息
	// -----------------
	$('#vfMessageForm').Validform({
		tiptype : function(msg, o, cssctl) {
			var objtip = $("#errors");
			cssctl(objtip, o.type);
			objtip.text(msg);
		},
	});

	// -----------------
	// - Geetest——更可靠的安全验证工具
	// -----------------
	if ($('#geetestForm').length > 0) {
		// 对表单进行BootstrapValidator初始化，并取出BootstrapValidator对象
		var $form = $('#geetestForm').bootstrapValidator(), bv = $form.data('bootstrapValidator');

		// Geetest初始化后的回调函数，captchaObj为Geetest的验证码实例
		var handler = function(captchaObj) {

			// 插入验证结果的三个 input 标签到指定的表单中。
			captchaObj.bindForm($form);

			// 表单提交时
			$form.on('success.form.bv', function(e) {
				console.log("success.form.bv事件");
				e.preventDefault();

				// 当product为bind类型时，可以调用verify接口进行验证，此时将弹出Geetest
				captchaObj.verify();
			});

			// 监听验证成功事件。
			captchaObj.onSuccess(function() {
				console.log("onSuccess事件");

				// 获取用户进行成功验证(onSuccess)所得到的结果，该结果用于进行服务端 SDK 进行二次验证。
				var result = captchaObj.getValidate();

				// 使用Ajax的方式提交表单
				$.ajax({
					type : $form.attr("method") || 'POST',
					url : $form.attr("action"),
					data : $form.serializeArray(),
					cache : false,
					dataType : "json",
					success : function(json) {
						if (json.statusCode == 200) {
							window.location.href = json.forwardUrl;
						} else {
							if (json.field) {
								bv.updateMessage(json.field, 'blank', json.message);
								bv.updateStatus(json.field, 'INVALID', 'blank');
							} else {
								$.error(json.message);
							}

							captchaObj.reset(); // 调用reset接口进行Geetest重置
						}
					},
				});

			});

			// 用户把验证关闭了，启用提交按钮
			captchaObj.onClose(function() {
				bv.disableSubmitButtons(false);
			});

		}

		// 页面加载完成后发起Ajax请求，拿到Geetest的配置参数，对行为验证进行初始化
		$.ajax({
			type : 'GET',
			url : $form.data("geetest_url"),
			dataType : "json",
			cache : false,
			success : function(response) {

				// 把JSON字符串转换成JSON对象
				var json = $.parseJSON(response);

				// 调用初始化函数进行初始化
				initGeetest({
					gt : json.gt,
					challenge : json.challenge,
					offline : !json.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
					new_captcha : json.new_captcha,
					product : "bind", // 产品形式
				}, handler);
			},
			error : function() {
				console.log("geetest error");
			}
		});
	}
	// -----------------
	// - Chart.js——柱状图
	// -----------------
	var barChartCtx = $("#barChart");
	if (barChartCtx.length > 0) {
		var barChart = new Chart(barChartCtx, {
			type : 'bar',
			options : {
				title : {
					display : true,
					text : '柱状图'
				},
				tooltips : {
					position : 'nearest',
				}
			},
			data : {
				labels : [ "红色", "蓝色", "黄色", "绿色", "紫色", "橙色" ],
				datasets : [ {
					label : '得票数',
					data : [ 12, 19, 3, 5, 2, 3 ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ],
					borderWidth : 1,
				} ]
			},
		});
	}
	
	// -----------------
	// - Chart.js——Tooltip Position: average
	// -----------------
	var toolTipPositionAverageCtx = $("#toolTipPositionAverage");
	if (toolTipPositionAverageCtx.length > 0) {
		var toolTipPositionAverageChart = new Chart(toolTipPositionAverageCtx, chartjs.createToolTipPositionConfig('average'));
	}
	
	// -----------------
	// - Chart.js——Tooltip Position: nearest
	// -----------------
	var toolTipPositionNearestCtx = $("#toolTipPositionNearest");
	if (toolTipPositionNearestCtx.length > 0) {
		var toolTipPositionNearestChart = new Chart(toolTipPositionNearestCtx, chartjs.createToolTipPositionConfig('nearest'));
	}
	
	// -----------------
	// - Chart.js——Tooltip Mode: point
	// -----------------
	var toolTipModePointCtx = $("#toolTipModePoint");
	if (toolTipModePointCtx.length > 0) {
		var toolTipModePointChart = new Chart(toolTipModePointCtx, chartjs.createToolTipModeConfig('point'));
	}
	// -----------------
	// - Chart.js——Tooltip Mode: dataset
	// -----------------
	var toolTipModeDatasetCtx = $("#toolTipModeDataset");
	if (toolTipModeDatasetCtx.length > 0) {
		var toolTipModeDatasetChart = new Chart(toolTipModeDatasetCtx, chartjs.createToolTipModeConfig('dataset'));
	}
	// -----------------
	// - Chart.js——Tooltip Mode: toolTipCallbacksLabel
	// -----------------
	var toolTipCallbacksLabelCtx = $("#toolTipCallbacksLabel");
	if (toolTipCallbacksLabelCtx.length > 0) {
		var toolTipCallbacksLabelChart = new Chart(toolTipCallbacksLabelCtx, {
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
					mode: 'index',
					callbacks: {
						footer: function(tooltipItems, data) {
							var sum = 0;

							$(tooltipItems).each(function(i, tooltipItem) {
								sum += data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
							});
							return '总和: ' + sum;
						},
		            },
		            footerFontStyle: 'normal'
				},
			}
		});
	}
}

/**
 * AdminLTE主页的左侧菜单选中项
 * 
 * @returns
 */
function activeSidebar() {
	var sidekey = $('.sidebar-menu').data("sidekey");
	if (sidekey) {
		if (sidekey.indexOf("-") == -1) {
			$(".sidebar-menu li").addClass("active");
		} else {
			var sidekeys = sidekey.split("-");
			$(".sidebar-menu li.treeview." + sidekeys[0]).addClass("active");
			$(".sidebar-menu .treeview-menu li." + sidekeys[1]).addClass("active");
		}
	}
}

function initUI($p) {
	// -----------------
	// - lazy load 图片延迟加载
	// -----------------
	$("img.lazyload", $p).lazyload({
		threshold : 200,
	});

	// -----------------
	// - iCheck 超级复选框和单选按钮
	// -----------------
	// 我们在需要进行iCheck扩展的input外层包裹了一层类名为icheck的div，所以需要先对外层的div进行遍历
	$("div.icheck", $p).each(function() {
		// $(this)为外层div，在其上面增加两个属性icheck-skin和icheck-color，分别用来定义皮肤和颜色
		// skin的默认值为flat，可选值有minimal、square、flat、line
		// color的可选值有红色（red）、绿色（green）、蓝色（blue）、淡蓝色（aero）、灰色（grey）、橘黄色（orange）、黄色（yellow）、粉色（pink）、紫色（purple）
		// 黑色除外
		var icheck = $(this), skin = icheck.data("skin") || 'flat', color = icheck.data("color") || 'blue';

		// 当皮肤为line时按照line的方式进行iCheck初始化
		if (skin == "line") {
			$('input', icheck).each(function() {
				var self = $(this), label = self.next(), label_text = label.text();

				// 移除label元素
				label.remove();

				// 对input进行iCheck初始化
				self.iCheck({
					// 增加动态颜色值
					checkboxClass : 'icheckbox_line-' + color,
					radioClass : 'iradio_line-' + color,
					// '<div class="icheck_line-icon"></div>'为Line皮肤呈现出来时的x号或者√号
					insert : '<div class="icheck_line-icon"></div>' + label_text
				});
			});
		} else {
			// 非line皮肤
			$('input', icheck).on('ifCreated', function(event) {
				console.log(event.type + ' callback');
			}).iCheck({
				// 设置动态皮肤和颜色值
				checkboxClass : 'icheckbox_' + skin + '-' + color,
				radioClass : 'iradio_' + skin + '-' + color,
				increaseArea : '20%'
			}).on('ifChecked', function(event) {
				console.log(event.type + ' callback');
			});
		}
	});

	// -----------------
	// - Switch——Bootstrap的开关组件
	// -----------------
	$('input.switch').bootstrapSwitch().on('switchChange.bootstrapSwitch', function(event, state) {
		console.log(state); // true | false
	});

	// -----------------
	// - Datetime Picker——Bootstrap 日期时间选择器
	// -----------------
	$('.datetime').each(function() {
		var $this = $(this), format = $this.data("format");
		$this.datetimepicker({
			locale : 'zh-cn',
			format : format,
			showTodayButton : true,
			showClear : true,
		});
	});

	// -----------------
	// - DateRange Picker——Bootstrap 日期范围选择器
	// -----------------
	$('.daterange input').each(function() {
		var $this = $(this);
		$this.daterangepicker({
			// 指示日期范围选择器是否应自动更新其<input>在初始化时以及选定日期更改时所附的元素的值。
			// 默认为true
			autoUpdateInput : false,
			locale : {
				customRangeLabel : '自定义',
				// 显示的日期格式为 年-月-日
				"format" : "YYYY-MM-DD",
				// 两个日期之间的分隔符为“/”
				"separator" : " / ",
				// 点击“确定”按钮把选择的日期范围带回到文本输入框
				"applyLabel" : "确定",
				"cancelLabel" : "清除",
				// 星期日、星期一，一直到星期六
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
		}).on('apply.daterangepicker', function(ev, picker) {
			// 点击确定按钮的时候，需要把选择的日期范围进行组合，然后赋值给当前组件
			$(this).val(picker.startDate.format('YYYY-MM-DD') + ' / ' + picker.endDate.format('YYYY-MM-DD'));
		}).on('cancel.daterangepicker', function(ev, picker) {
			// 点击清除按钮的时候，设为空
			$(this).val('');
		}).css("min-width", "210px").next("span").click(function() {
			$(this).parent().find('input').click();
		});
	});

	// -----------------
	// - Tags Input——Bootstrap风格的标签输入组件
	// -----------------
	$("input.tagsinput", $p).each(function() {
		var $this = $(this), maxTags = $this.attr("maxTags"), maxChars = $this.attr("maxChars");
		$this.tagsinput({
			maxTags : maxTags,
			maxChars : maxChars,
			trimValue : true
		});
	});

	// -----------------
	// - Star Rating——简单而强大的星级评分插件
	// -----------------
	$('input.star-rating', $p).each(function() {
		var $this = $(this), displayOnly = $this.is("[displayOnly]");
		$this.rating({
			language : "zh",
			displayOnly : displayOnly,
		});
	});

	// -----------------
	// - kaptcha验证码
	// -----------------
	$('.kaptcha img', $p).click(function() {
		var $this = $(this), $kaptchaCode = $this.closest(".kaptcha").find("input[name=kaptchaCode]");
		$this.attr("src", $this.attr("src") + "?r=" + Math.random());
		$kaptchaCode.val("");
	});

}

$(function() {
	initOnce();
	activeSidebar();

	QINGE.regPlugins.push(initUI);
	$(document).initUI();

});
