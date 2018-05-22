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
