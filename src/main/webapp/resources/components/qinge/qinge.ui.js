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
}

$(function() {
	QINGE.regPlugins.push(initUI);
	$(document).initUI();
});