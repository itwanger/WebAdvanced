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
	var barChartCtx = $("#barChart"), barChartProgress = $("#barChartProgress");
	if (barChartCtx.length > 0) {
		var barChart = new Chart(barChartCtx, {
			type : 'bar',
			options : {
				title : {
					display : true,
					text : '柱状图'
				}
			},
			data : {
				labels : [ "红色", "蓝色", "黄色", "绿色", "紫色", "橙色" ],
				datasets : [ {
					label : '得票数',
					data : [ 12, 19, 3, 5, 2, 3 ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1,
				} ]
			},
			options : {
				animation : {
					duration : 2000,
					easing : 'easeOutBounce',
					onProgress : function(animation) {
						barChartProgress.val(animation.currentStep / animation.numSteps);
					},
					onComplete : function() {
						window.setTimeout(function() {
							barChartProgress.val(0);
						}, 2000);
					}
				},
			}
		});
	}
	// -----------------
	// - Chart.js——混合型
	// -----------------
	var mixedChartCtx = $("#mixedChart");
	if (mixedChartCtx.length > 0) {
		var mixedChart = new Chart(mixedChartCtx, {
			type : 'bar',
			options : {
				title : {
					display : true,
					text : '混合型图表'
				},
				tooltips : {
					mode : 'index',
					intersect : true
				}
			},
			data : {
				labels : [ '三月', '四月', '五月', '六月', '七月', '八月' ],
				datasets : [ {
					label : '得票数',
					data : [ 12, 19, 3, 5, 2, 3 ],
					backgroundColor : QINGE.chartjsColors.red,
					borderColor : 'white',
					borderWidth : 2
				}, {
					type : 'line',
					label : '投票数',
					data : [ 22, 29, 13, 15, 12, 13 ],
					backgroundColor : QINGE.chartjsColors.blue,
					borderWidth : 2
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
			type : 'line',
			data : {
				labels : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月' ],
				datasets : [ {
					label : '红色',
					borderColor : QINGE.chartjsColors.red,
					backgroundColor : QINGE.chartjsColors.red,
					data : [ 10, 30, 46, 2, 8, 50, 0 ],
					fill : false,
				}, {
					label : '蓝色',
					borderColor : QINGE.chartjsColors.blue,
					backgroundColor : QINGE.chartjsColors.blue,
					data : [ 7, 49, 46, 13, 25, 30, 22 ],
					fill : false,
				} ]
			},
			options : {
				responsive : true,
				scales : {
					yAxes : [ {
						ticks : {
							stepSize : 3
						}
					} ]
				},
				tooltips : {
					mode : 'index',
					callbacks : {
						footer : function(tooltipItems, data) {
							var sum = 0;

							$(tooltipItems).each(function(i, tooltipItem) {
								sum += data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
							});
							return '总和: ' + sum;
						},
					},
					footerFontStyle : 'normal'
				},
			}
		});
	}

	// -----------------
	// - Chart.js——Point Style
	// -----------------
	var pointStyleCtx = $("#pointStyleChart");
	if (pointStyleCtx.length > 0) {
		var pointStyleChart = new Chart(pointStyleCtx, chartjs.createPointStyleConfig('triangle'));
	}
	// -----------------
	// - Chart.js——Radar Chart
	// -----------------
	var radarChartCtx = $("#radarChart");
	if (radarChartCtx.length > 0) {
		var color = Chart.helpers.color;
		var radarChart = new Chart(radarChartCtx, {
			type : 'radar',
			data : {
				labels : [ '场次', '进球', '助攻', '犯规', '抢断', '解围' ],
				datasets : [ {
					label : 'C罗',
					borderColor : QINGE.chartjsColors.red,
					backgroundColor : color(QINGE.chartjsColors.red).alpha(0.2).rgbString(),
					pointBackgroundColor : QINGE.chartjsColors.red,
					data : [ 2, 3, 2, 1, 0, 1 ],
				}, {
					label : '梅西',
					borderColor : QINGE.chartjsColors.blue,
					backgroundColor : color(QINGE.chartjsColors.blue).alpha(0.2).rgbString(),
					pointBackgroundColor : QINGE.chartjsColors.blue,
					data : [ 2, 0, 0, 1, 1, 0 ],
				} ]
			},
			options : {
				scale : {
					ticks : {
						beginAtZero : true
					}
				},
				tooltips : {
					mode : 'index',
				},
			}
		});
	}
	// -----------------
	// - Chart.js——DONUT CHART
	// -----------------
	var doughnutChartCtx = $("#doughnutChart");
	if (doughnutChartCtx.length > 0) {
		var radarChart = new Chart(doughnutChartCtx, {
			type : 'doughnut',
			data : {
				labels : [ '几乎不可能', '看别人脸色', '天佑梅西' ],
				datasets : [ {
					label : '投票人数：',
					backgroundColor : [ QINGE.chartjsColors.red, QINGE.chartjsColors.orange, QINGE.chartjsColors.green ],
					data : [ 20, 50, 30 ],
				} ]
			},
			options : {
				title : {
					display : true,
					text : '阿根廷能否出现？'
				},
				animation : {
					animateScale : true,
					animateRotate : true
				}
			}
		});
	}
	// -----------------
	// - Chart.js——Polar Area Chart
	// -----------------
	var polarAreaChartCtx = $("#polarAreaChart");
	if (polarAreaChartCtx.length > 0) {
		var color = Chart.helpers.color;
		var polarAreaChart = new Chart(polarAreaChartCtx, {
			type : 'polarArea',
			data : {
				labels : [ '几乎不可能', '看别人脸色', '天佑梅西' ],
				datasets : [ {
					label : '投票人数：',
					backgroundColor : [ color(QINGE.chartjsColors.red).alpha(0.8).rgbString(), color(QINGE.chartjsColors.orange).alpha(0.8).rgbString(),
							color(QINGE.chartjsColors.green).alpha(0.8).rgbString() ],
					data : [ 20, 50, 30 ],
				} ]
			},
			options : {
				title : {
					display : true,
					text : '阿根廷能否出现？'
				},
				animation : {
					animateScale : true,
					animateRotate : true
				}
			}
		});
	}
	// -----------------
	// - Chart.js——笛卡尔类别轴min、max
	// -----------------
	var minMaxChartCtx = $("#minMaxChart");
	if (minMaxChartCtx.length > 0) {
		var minMaxChart = new Chart(minMaxChartCtx, {
			type : 'line',
			data : {
				labels : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月' ],
				datasets : [ {
					label : '红色',
					borderColor : QINGE.chartjsColors.red,
					backgroundColor : QINGE.chartjsColors.red,
					data : [ 10, 30, 46, 2, 8, 50, 0 ],
					fill : false,
				}, {
					label : '蓝色',
					borderColor : QINGE.chartjsColors.blue,
					backgroundColor : QINGE.chartjsColors.blue,
					data : [ 7, 49, 46, 13, 25, 30, 22 ],
					fill : false,
				} ]
			},
			options : {
				responsive : true,
				scales : {
					xAxes : [ {
						ticks : {
							min : '五月',
							max : '七月'
						}
					} ]
				},
			}
		});
	}
	// -----------------
	// - Chart.js——笛卡尔线性轴的步长
	// -----------------
	var stepChartCtx = $("#stepChart");
	if (stepChartCtx.length > 0) {
		var stepChart = new Chart(stepChartCtx, {
			type : 'line',
			data : {
				labels : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月' ],
				datasets : [ {
					label : '红色',
					borderColor : QINGE.chartjsColors.red,
					backgroundColor : QINGE.chartjsColors.red,
					data : [ 10, 30, 46, 2, 8, 50, 0 ],
					fill : false,
				}, ]
			},
			options : {
				responsive : true,
				scales : {
					yAxes : [ {
						ticks : {
							stepSize : 4
						}
					} ]
				},
			}
		});
	}
	// -----------------
	// - Chart.js——Time Axes Chart
	// -----------------
	var timeAxesChartCtx = $("#timeAxesChart");
	if (timeAxesChartCtx.length > 0) {
		var timeFormat = 'YYYY年MM月DD日';
		function newDate(days) {
			return moment().add(days, 'd').toDate();
		}

		var timeAxesChart = new Chart(timeAxesChartCtx, {
			type : 'bar',
			data : {
				labels : [ newDate(0), newDate(1), newDate(2), newDate(3), newDate(4), newDate(5), newDate(6), newDate(7) ],
				datasets : [ {
					label : '投票人数：',
					backgroundColor : QINGE.chartjsColors.red,
					data : [ 20, 50, 30, 60, 30, 20, 90, 80 ],
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						type : 'time',
						time : {
							unit : 'day',
							displayFormats : {
								day : timeFormat
							},
							tooltipFormat : timeFormat
						},
					} ],
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				},
			}
		});
	}

	// -----------------
	// - Chart.js——轴标题
	// -----------------
	var labelingAxesChartCtx = $("#labelingAxesChart");
	if (labelingAxesChartCtx.length > 0) {
		var timeFormat = 'YYYY年MM月DD日';
		function newDateString(days) {
			return moment().add(days, 'd').format(timeFormat);
		}

		var labelingAxesChart = new Chart(labelingAxesChartCtx, {
			type : 'bar',
			data : {
				labels : [ newDateString(0), newDateString(1), newDateString(2), newDateString(3), newDateString(4), newDateString(5), newDateString(6),
						newDateString(7) ],
				datasets : [ {
					label : '投票人数：',
					backgroundColor : QINGE.chartjsColors.red,
					data : [ 20, 50, 30, 60, 30, 20, 90, 80 ],
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						scaleLabel : {
							display : true,
							labelString : '日期'
						}
					} ],
					yAxes : [ {
						scaleLabel : {
							display : true,
							labelString : '投票人数'
						}
					} ]
				},
			}
		});
	}

	// -----------------
	// - Chart.js——轴样式
	// -----------------
	var gridLineStyleCtx = $("#gridLineStyle");
	if (gridLineStyleCtx.length > 0) {
		var gridLineStyle = new Chart(gridLineStyleCtx, {
			type : 'line',
			data : {
				labels : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月' ],
				datasets : [ {
					label : '红色',
					borderColor : QINGE.chartjsColors.red,
					backgroundColor : QINGE.chartjsColors.red,
					data : [ 10, 30, 46, 2, 8, 50, 0 ],
					fill : false,
				}, ]
			},
			options : {
				responsive : true,
				scales : {
					yAxes : [ {
						gridLines : {
							color : 'blue'
						}
					} ],
					xAxes : [ {
						gridLines : {
							display : false,
						}
					} ]
				},
			}
		});
	}

	// -----------------
	// - Chart.js——综合实例
	// -----------------
	var comboChartCtx = $("#comboChart");
	if (comboChartCtx.length > 0) {
		var color = Chart.helpers.color;
		var comboChart = new Chart(comboChartCtx, {
			plugins : [ {
				afterDatasetsDraw : function(chart) {
					var ctx = chart.ctx;

					chart.data.datasets.forEach(function(dataset, i) {
						var meta = chart.getDatasetMeta(i);
						if (!meta.hidden) {
							meta.data.forEach(function(element, index) {
								// 用指定的字体、黑色绘制文本
								ctx.fillStyle = 'rgb(0, 0, 0)';

								var fontSize = 16;
								var fontStyle = 'normal';
								var fontFamily = 'Helvetica Neue';
								ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

								// 简单的转换一下
								var dataString = dataset.data[index].toString() + "张";

								// 确保对其方式
								ctx.textAlign = 'center';
								ctx.textBaseline = 'middle';

								var padding = 5;
								var position = element.tooltipPosition();
								ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
							});
						}
					});
				}
			} ],
			type : 'bar',
			options : {
				title : {
					display : true,
					text : '锦上添花'
				},
			},
			data : {
				labels : [ '三月', '四月', '五月', '六月', '七月', '八月' ],
				datasets : [ {
					label : '得票数',
					data : [ 12, 19, 3, 5, 2, 3 ],
					backgroundColor : color(QINGE.chartjsColors.red).alpha(0.2).rgbString(),
					borderColor : QINGE.chartjsColors.red,
				}, {
					type : 'line',
					label : '投票数',
					data : [ 22, 29, 13, 15, 12, 13 ],
					backgroundColor : color(QINGE.chartjsColors.blue).alpha(0.2).rgbString(),
					borderColor : QINGE.chartjsColors.blue,
				} ]
			},
		});
	}

	// -----------------
	// - Select2的基本应用
	// -----------------
	function matchCustom(params, data) {
		// 如果没有搜索条件，则返回所有数据。
		if ($.trim(params.term) === '') {
			return data;
		}

		// 跳过没有`children`的数据（只检索嵌套数据的子项）
		if (typeof data.children === 'undefined') {
			return null;
		}

		// `data.children` 包含我们正在匹配的实际选项
		var filteredChildren = [];
		$.each(data.children, function(idx, child) {
			// `params.term` 是用于检索的关键字
			// `data.text` 是数据对象要显示的文本
			// `data.id` 是数据对象的唯一索引
			if (child.text.toUpperCase().indexOf(params.term.toUpperCase()) > -1 || child.id.toUpperCase().indexOf(params.term.toUpperCase()) > -1) {
				filteredChildren.push(child);
			}
		});

		// 如果检索结果中有数据，则返回
		if (filteredChildren.length) {
			var modifiedData = $.extend({}, data, true);
			modifiedData.children = filteredChildren;

			// 返回复制后的数据
			return modifiedData;
		}

		return null;
	}
	$('.js-example-basic-single').select2({
		matcher : matchCustom
	});

	$(".js-example-placeholder-single").select2({
		placeholder : "请选择",
		allowClear : true
	});
	$('.js-example-basic-multiple').select2();
	$(".js-example-placeholder-multiple").select2({
		placeholder : "请选择"
	});
	function formatRepo(repo) {
		if (repo.loading) {
			return repo.text;
		}

		var markup = "<div class='select2-result-repository clearfix'>" + "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url
				+ "' /></div>" + "<div class='select2-result-repository__meta'>" + "<div class='select2-result-repository__title'>" + repo.full_name + "</div>";

		if (repo.description) {
			markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
		}

		markup += "<div class='select2-result-repository__statistics'>" + "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> "
				+ repo.forks_count + " Forks</div>" + "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> " + repo.stargazers_count
				+ " Stars</div>" + "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> " + repo.watchers_count + " Watchers</div>"
				+ "</div>" + "</div></div>";

		return markup;
	}

	function formatRepoSelection(repo) {
		return repo.full_name || repo.text;
	}

	$(".js-example-data-ajax").select2({
		ajax : {
			url : "https://api.github.com/search/repositories",
			dataType : 'json',
			delay : 250,
			processResults : function(data, params) {
				// parse the results into the format expected by Select2
				// since we are using custom formatting functions we do not need
				// to
				// alter the remote JSON data, except to indicate that infinite
				// scrolling can be used
				params.page = params.page || 1;

				return {
					results : data.items,
					pagination : {
						more : (params.page * 30) < data.total_count
					}
				};
			},
			cache : true
		},
		placeholder : '搜索仓库',
		escapeMarkup : function(markup) {
			return markup;
		}, // let our custom formatter work
		minimumInputLength : 1,
		templateResult : formatRepo,
		templateSelection : formatRepoSelection
	});

	var data = [ {
		id : 0,
		text : '小猪佩奇'
	}, {
		id : 1,
		text : '小羊苏西'
	}, {
		id : 2,
		text : '小狗丹尼'
	} ];

	$(".js-example-data-array").select2({
		data : data
	});

	if ($("#mySelect2").length > 0) {
		var data1 = {
			id : 1,
			text : '小猪佩奇'
		};
		var data2 = {
			id : 2,
			text : '小羊苏西'
		};

		var newOption1 = new Option(data1.text, data1.id, false, false);
		var newOption2 = new Option(data2.text, data2.id, false, true);
		$('#mySelect2').select2().append(newOption1).append(newOption2).trigger('change');
	}

	$("#getSelectedData").click(function() {
		console.log($('.js-example-data-ajax').find(':selected'));
		console.log($('.js-example-data-ajax').select2('data'));
	});

	var treeviewDefaultData = [ {
		text : "河南省",
		nodes : [ {
			text : "洛阳市",
			nodes : [ {
				text : "涧西区"
			}, {
				text : "西工区"
			} ]
		}, {
			text : "郑州市"
		} ]
	}, {
		text : "江苏省"
	}, {
		text : "浙江省"
	} ];

	var _parentCheck = function(event, children) {
		// 获取树视图实例
		var treeview = $(event.target).data('treeview');

		$.each(children, function(index, child) {
			// child为子节点，child.nodeId返回节点的ID
			treeview.checkNode(child.nodeId, {
				silent : true
			});

			// 如果当前子节点还有子节点，那么继续
			if (child.nodes != null) {
				_parentCheck(child.nodes);
			}
		});
	}

	var _childCheck = function(event, child) {
		// 获取树视图实例
		var treeview = $(event.target).data('treeview');

		// 获取父节点
		var parent = treeview.getParent(child.nodeId);
		// 父节点存在的话，判断其是否应该选中
		if (parent != undefined) {
			// 是否全部选中
			var isAllchecked = true;

			// 获取兄弟节点
			var siblings = treeview.getSiblings(child.nodeId);

			// 如果兄弟节点中有一个节点是未勾选的状态，那么父节点就不应该勾选
			for ( var i in siblings) {
				if (!siblings[i].state.checked) {
					isAllchecked = false;
					break;
				}
			}

			// 如果子节点全部勾选，那么父节点就应该勾选
			if (isAllchecked) {
				treeview.checkNode(parent.nodeId, {
					silent : true
				});

				// 如果父节点还有父节点，那么继续
				var grand = treeview.getParent(parent.nodeId);
				if (parent != undefined) {
					_childCheck(parent);
				}
			}
		}
	}

	var _parentUncheck = function(event, children) {
		// 获取树视图实例
		var treeview = $(event.target).data('treeview');

		// 遍历子节点，对其进行取消勾选
		$.each(children, function(index, child) {
			treeview.uncheckNode(child.nodeId, {
				silent : true
			});

			// 如果当前子节点还有子节点，那么继续
			if (child.nodes != null) {
				_parentUncheck(child.nodes);
			}
		});
	}

	var _childUncheck = function(event, child) {
		// 获取树视图实例
		var treeview = $(event.target).data('treeview');

		// 获取父节点
		var parent = treeview.getParent(child.nodeId);
		// 父节点存在的话，判断其是否应该选中
		if (parent != undefined) {
			// 是否全部取消选中
			var isAllUnchecked = true;

			// 获取兄弟节点
			var siblings = treeview.getSiblings(child.nodeId);

			// 如果兄弟节点中有一个节点是勾选的状态，那么父节点就不应该取消勾选
			for ( var i in siblings) {
				if (siblings[i].state.checked) {
					isAllUnchecked = false;
					break;
				}
			}

			// 如果子节点全部取消勾选，那么父节点就应该取消勾选
			if (isAllUnchecked) {
				treeview.uncheckNode(parent.nodeId, {
					silent : true
				});

				// 如果父节点还有父节点，那么继续
				var grand = treeview.getParent(parent.nodeId);
				if (parent != undefined) {
					_childUncheck(parent);
				}
			}
		}
	}

	$('#treeview1').treeview({
		data : treeviewDefaultData,
		// levels : 3,
		showCheckbox : true,
		// highlightSelected : false,
		// onNodeSelected : function (event, node) {
		// $('#treeview1').treeview('checkNode', [ node.nodeId]);
		// },
		// onNodeUnselected : function (event, node) {
		// $('#treeview1').treeview('uncheckNode', [ node.nodeId]);
		// },
		onNodeChecked : function(event, node) {
			// 勾选的是父节点
			if (node.nodes != null) {
				// 遍历子节点，对其进行勾选
				_parentCheck(event, node.nodes);
			} else {
				// 勾选的是子节点
				_childCheck(event, node);
			}
		},
		onNodeUnchecked : function(event, node) {
			// 取消勾选的是父节点
			if (node.nodes != null) {
				_parentUncheck(event, node.nodes);
			} else {
				// 取消勾选的是子节点
				_childUncheck(event, node);
			}
		},
	});

	// $('#treeview1').treeview('checkAll', { silent: true }); //勾选所有的节点。
	// $('#treeview1').treeview('checkNode',[1, { silent: true }]); //勾选指定的节点

	// console.log($('#treeview1').treeview('getChecked'));// 返回被勾选节点的数组

	// $('#treeview1').treeview('uncheckAll', { silent: true }); //取消勾选所有的节点。
	// $('#treeview1').treeview('uncheckNode',[1, { silent: true }]);
	// //取消勾选指定的节点

	// console.log($('#treeview1').treeview('getUnchecked'));// 返回未勾选节点的数组

	// $('#treeview1').treeview('toggleNodeChecked', [ 1, { silent: true } ]);
	// // 切换节点的勾选状态。

	// $('#treeview1').treeview('collapseAll', {
	// silent : true
	// });
	// 折叠树的所有的节点
	// $('#treeview1').treeview('collapseNode',[1, { silent: true }]); //
	// 折叠指定节点和它的子节点
	// $('#treeview1').treeview('collapseNode',[1, { silent: true,
	// ignoreChildren: true }]); // 折叠指定节点并忽略其子节点

	// console.log($('#treeview1').treeview('getCollapsed'));// 返回折叠节点的数组

	// $('#treeview1').treeview('expandAll',{ silent: true }); // 展开所有节点
	// $('#treeview1').treeview('expandAll', { levels: 1, silent: true }); //
	// 只展开一级节点，两级或两级以上的节点并不展开（如果有的话）
	// $('#treeview1').treeview('expandNode',[0, { silent: true }]); //
	// 展开指定节点和它的子节点

	// console.log($('#treeview1').treeview('getExpanded'));// 返返回所有展开节点的数组

	// $('#treeview1').treeview('toggleNodeExpanded', [ 1, { silent: true } ]);
	// 切换一个节点的展开和折叠状态。

	// $('#treeview1').treeview('disableAll', { silent: true }); //禁用所有的节点。
	// $('#treeview1').treeview('disableNode',[1, { silent: true }]); // 禁用指定的节点
	// console.log($('#treeview1').treeview('getEnabled')); // 返回被禁用节点的数组

	// $('#treeview1').treeview('enableAll', { silent: true }); //启用所有的节点
	// $('#treeview1').treeview('enableNode',[1, { silent: true }]); // 启用指定的节点
	// console.log($('#treeview1').treeview('getEnabled'));// 返回可用节点的数组

	// $('#treeview1').treeview('toggleNodeDisabled', [ 1, { silent: true } ]);
	// //切换一个节点的可用和不可用状态

	// // 选择指定的节点
	// $('#treeview1').treeview('selectNode', [ 1, { silent: true } ]);
	// // 返回选择节点的数组
	// console.log($('#treeview1').treeview('getSelected'));
	// // 取消选择指定的节点
	// $('#treeview1').treeview('unselectNode', [ 1, { silent: true } ]);
	// // 返回未选择节点的数组
	// console.log($('#treeview1').treeview('getUnselected'));

	// 返回指定节点ID的单一节点对象
	// console.log($('#treeview1').treeview('getNode', 1));

	// 返回指定节点的父节点，如果没有则返回undefined。
	// console.log($('#treeview1').treeview('getParent', 1));

	// 返回给定节点的兄弟节点的数组，如果没有则返回undefined。
	// console.log($('#treeview1').treeview('getSiblings', 1));

	// 显示一个树节点，展开从这个节点开始到根节点的所有节点。
	// $('#treeview1').treeview('revealNode', [ 3, { silent: true } ]);

	// var treeview1 = $('#treeview1').data('treeview');
	// treeview1.search("洛阳", {
	// ignoreCase : true, // 忽略大小写
	// exactMatch : false, // false的时候采用模糊匹配，true的时候采用精确匹配
	// revealResults : true, // 展开匹配的节点
	// });

	// $('#treeview1').on('nodeChecked', function(event, data) {
	// console.log("jQuery的on方法");
	// });

	var procity_tree = $("#treeview_procity");
	if (procity_tree.length > 0) {
		$.ajax({
			type : 'GET',
			url : procity_tree.data("url"),
			dataType : "json",
			success : function(json) {
				procity_tree.treeview({
					data : json,
					showCheckbox : true,
					highlightSelected : false,
					levels : 1,
					onNodeSelected : function(event, node) {
						procity_tree.treeview('checkNode', [ node.nodeId ]);
					},
					onNodeUnselected : function(event, node) {
						procity_tree.treeview('uncheckNode', [ node.nodeId ]);
					},
					onNodeChecked : function(event, node) {
						// 勾选的是父节点
						if (node.nodes != null) {
							// 遍历子节点，对其进行勾选
							_parentCheck(event, node.nodes);
						} else {
							// 勾选的是子节点
							_childCheck(event, node);
						}
					},
					onNodeUnchecked : function(event, node) {
						// 取消勾选的是父节点
						if (node.nodes != null) {
							_parentUncheck(event, node.nodes);
						} else {
							// 取消勾选的是子节点
							_childUncheck(event, node);
						}
					},
				});
			}
		});
	}

	$("#getData").click(function() {
		var data = {
			checkedData : []
		}, checkedNodes = $('#treeview_procity').treeview('getChecked');

		for (var i = 0; i < checkedNodes.length; i++) {
			data.checkedData.push(checkedNodes[i].id);
		}

		$.ajax({
			type : 'POST',
			url : $("#getData").data("url"),
			data : {
				ids : data.checkedData.join(",")
			},
			success : function(response) {
				console.log(response);
			}
		});
	});

	$('#headimgForm').bootstrapValidator({
		fields : {
			headimg : {
				validators : {
					notEmpty : {
						message : '请选择一张图片'
					},
					file : {
						extension : 'jpeg,jpg,png',
						type : 'image/jpeg,image/png',
						maxSize : 2097152, // 2048 * 1024
						message : '请选择PNG/JPG/JPEG格式的图片，且不能超过2M'
					}
				}
			},
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		var $form = $(e.target), bv = $form.data('bootstrapValidator'), data = new FormData($form[0]);
		$.ajax({
			type : $form.attr("method") || 'POST',
			url : $form.attr("action"),
			data : data,
			cache : false,
			dataType : "json",
			// 发送数据到服务器时所使用的内容类型。默认为true，类型为："application/x-www-form-urlencoded"。
			contentType : false,
			// 布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
			processData : false,
			success : function(json) {
				if (json.statusCode == 200) {
					$("#headimg").attr("src", json.mo.headimg);
				} else {
					bv.updateMessage(json.field, 'blank', json.message);
					bv.updateStatus(json.field, 'INVALID', 'blank');
				}
			},
		});
	});

	$('#dropifyImg').change(function(e) {
		var $this = $(this), file = e.target.files[0], data = new FormData();

		data.append($this.attr("name"), file);

		$.ajax({
			data : data,
			type : "POST",
			url : $this.data("url"),
			contentType : false,
			processData : false,
			success : function(json) {
				if (json.statusCode == 200) {
					$.msg(json.mo.imgUrl);
				} else {
					$.error(json.message);
				}
			},
		});
	});

$('#input-b1').fileinput({
	language:'zh',
	uploadUrl : '/WebAdvanced/seven/saveFile',
//	showUpload : false,
//	showClose : false,
//	showUploadedThumbs : false,
//	showBrowse : false,
//	browseOnZoneClick : true,
//	minFileSize : 1000,
//	maxFileSize : 1000,
//	allowedFileTypes : ['image', 'html', 'text', 'video', 'audio', 'flash'],
	allowedFileExtensions : ['jpg', 'gif', 'png', 'txt'],
});

$('#input-ajax-multiple').fileinput({
	language:'zh',
	uploadUrl : '/WebAdvanced/seven/saveFile',
	minFileCount : 2,
});
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

	// -----------------
	// - Magnific Popup——一款真正的响应式灯箱插件
	// -----------------
	$('.popup-youku').magnificPopup({
		type : 'iframe',
		iframe : {
			patterns : {
				youku : {
					index : 'youku.com/',
					id : function(url) {
						var m = url.match(/id_(\S*)==./)[1];
						return m;
					},
					src : 'http://player.youku.com/embed/%id%'
				}
			}
		}
	});

	$('.open-popup-link').magnificPopup({
		type : 'inline',
	});

	$('.ajax-popup-link').magnificPopup({
		type : 'ajax',
	});

	$('.popup-gallery').magnificPopup({
		delegate : 'a',
		type : 'image',
		tLoading : '图像 #%curr% 加载中',
		mainClass : 'mfp-img-mobile',
		gallery : {
			enabled : true,
			navigateByImgClick : true,
			tPrev : '上一个', // 左侧箭头标题
			tNext : '下一个', // 右侧箭头标题
			tCounter : '<span class="mfp-counter">%curr% / %total%</span>', // 计数器标记
		},
		image : {
			tError : '<a href="%url%">当前图像 #%curr%</a> 加载失败.',
		},
	});

	// -----------------
	// - Dropify——基于H5的图片拖拽和预览插件
	// -----------------
	$('input.dropify').dropify({
		// defaultFile : "/WebAdvanced/resources/images/cmower160x160.jpg",
		// height : 300,
		// maxFileSize : '1M',
		// showRemove : false,
		// showErrors : false,
		// errorsPosition : 'outside',
		// allowedFileExtensions : 'png jpg',
		// maxFileSizePreview : '1K',
		messages : {
			'default' : '可拖放一个文件到这或者点击选择',
			'replace' : '可拖放一个文件或者点击选择进行替换',
			'remove' : '移除',
			'error' : '哦，出错了！'
		},
		error : {
			'fileSize' : '文件超出了最大限度，最大值为 ({{ value }} )。',
			'minWidth' : '图像宽度过小，最小宽度为 ({{ value }}}px )。',
			'maxWidth' : '图像宽度过大，最大宽度为 ({{ value }}}px )。',
			'minHeight' : '图像高度过小，最小高度为 ({{ value }}}px )。',
			'maxHeight' : '图像高度过大，最大高度为 ({{ value }}px )。',
			'imageFormat' : '图像格式不符合要求，只允许 ({{ value }} )。',
			'fileExtension' : '文件后缀不符合要求，只允许 ({{ value }} )。'
		},
	}).on('dropify.beforeClear', function(event, element) {
		return $.confirm("您确定要删除 \"" + element.file.name + "\" 文件了吗?");
	}).on('dropify.error.fileSize', function(event, element) {
		console.log('文件大小超出！');
	}).on('dropify.error.minWidth', function(event, element) {
		console.log('图片不满足最小宽度！');
	}).on('dropify.error.maxWidth', function(event, element) {
		console.log('图片超出最大宽度！');
	}).on('dropify.error.minHeight', function(event, element) {
		console.log('图片不满足最小高度！');
	}).on('dropify.error.maxHeight', function(event, element) {
		console.log('图片超出最大高度！');
	});
}

$(function() {
	initOnce();
	activeSidebar();

	QINGE.regPlugins.push(initUI);
	$(document).initUI();

});
