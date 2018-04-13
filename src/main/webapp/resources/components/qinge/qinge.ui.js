function initUI($p) {
	// -----------------
	// - lazy load 图片延迟加载
	// -----------------
	$("img.lazyload", $p).lazyload({
		threshold : 200,
	});
}

$(function() {
	QINGE.regPlugins.push(initUI);
	$(document).initUI();
});