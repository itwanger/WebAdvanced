var QINGE = {
	regPlugins : [],// 注册方法
	keys : {
		statusCode : "statusCode",
		message : "message"
	},
	statusCode : {// 服务端响应状态码
		ok : 200,// 正常
		error : 300,// 出错了
		timeout : 301,// 超时
	},
	chartjsColors : {
			red: 'rgb(255, 99, 132)',
			orange: 'rgb(255, 159, 64)',
			yellow: 'rgb(255, 205, 86)',
			green: 'rgb(75, 192, 192)',
			blue: 'rgb(54, 162, 235)',
			purple: 'rgb(153, 102, 255)',
			grey: 'rgb(201, 203, 207)'
		},
};

(function($) {
	$.fn.extend({
		initUI : function() {// 初始化方法
			return this.each(function() {
				var $this = $(this);
				$.each(QINGE.regPlugins, function(index, fn) {
					fn($this);
				});
			});
		},
	});
})(jQuery);
