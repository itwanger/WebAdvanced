var QINGE = {
	regPlugins : [],// 注册方法
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
