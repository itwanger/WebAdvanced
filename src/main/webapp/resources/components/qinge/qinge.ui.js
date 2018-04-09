function initUI($p) {
	// -----------------
	// - lazy load 图片延迟加载
	// -----------------
	$("img.lazyload", $p).lazyload();
}

$(function() {
	// 注册QINGE插件，QINGE是我们定义的全局变量，在qinge.core.js中定义
	QINGE.regPlugins.push(initUI);
	// 首次初始化插件，对象是整个document对象
	$(document).initUI();
});