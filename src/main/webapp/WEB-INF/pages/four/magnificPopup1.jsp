<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Magnific Popup的基本应用</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="bs-example">
		<a class="image-popup-vertical-fit" href="${ctx}/resources/images/studio10_b.jpg" title="标题，可以包含任何HTML，可以对齐到任何方向">
			<img src="${ctx}/resources/images/studio10_s.jpg">
		</a>
		<a class="image-popup-fit-width" href="${ctx}/resources/images/studio3_b.jpg" title="水平方向的图像.">
			<img src="${ctx}/resources/images/studio3_s.jpg">
		</a>
		<a class="image-popup-no-margins" href="${ctx}/resources/images/studio26_b.jpg">
			<img src="${ctx}/resources/images/studio26_s.jpg">
		</a>

	</div>

	<div class="bs-example">
		<a class="popup-youku"
			href="https://v.youku.com/v_show/id_XMzAwNzM5NDY4MA==.html?spm=a2hww.11359951.m_26681.5~5!2~5~5~5!6~5~5~A">小猪佩奇——土豆城市</a>
	</div>

	<div class="bs-example">
		<a href="#test-popup" class="open-popup-link">打开内联弹窗1</a>

		<div id="test-popup" class="white-popup mfp-hide">我为什么而活着 —— 对知识的向往，对爱情的追求，对人类苦难不可节制的同情心。</div>
	</div>

	<div class="bs-example">
		<a href="${ctx}/four?p=magnificPopup-ajax" class="ajax-popup-link">Ajax 类型弹窗</a>
	</div>

	<div class="bs-example">
		<a class="popup-modal" href="#test-modal">打开模态框</a>

		<div id="test-modal" class="white-popup-block mfp-hide">
			<h1>模态框</h1>
			<p>你无法通过常规的方式关闭我，意味着ESC和单击事件均无效，但是你可以通过编程的方式来选择某个动作关闭我。</p>
			<p>
				<a class="popup-modal-dismiss" href="#">点此关闭</a>
			</p>
		</div>
	</div>

	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/magnific-popup.js/1.1.0/jquery.magnific-popup.js"></script>

	<script>
		$(function() {
			$('.image-popup-vertical-fit').magnificPopup({
				type : 'image',
				closeOnContentClick : true,
				mainClass : 'mfp-img-mobile',
				image : {
					verticalFit : true
				},
				alignTop : false
			});

			$('.image-popup-fit-width').magnificPopup({
				type : 'image',
				closeOnContentClick : true,
				image : {
					verticalFit : false
				}
			});

			$('.image-popup-no-margins').magnificPopup({
				type : 'image',
				closeOnContentClick : true,
				closeBtnInside : false,
				fixedContentPos : true,
				mainClass : 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
				image : {
					verticalFit : true
				},
				zoom : {
					enabled : true,
					duration : 300
				// don't foget to change the duration also in CSS
				}
			});

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
				disableOn : function() {
					// 					if ($(window).width() < 600) {// 视窗宽度小于600则不打开
					// 						return false;
					// 					}
					// 					return true;
				},
				callbacks : {
					parseAjax : function(mfpResponse) {
						// mfpResponse.data 将返回Ajax请求成功后的数据对象
						// 对于简单的HTML文件来说，它只是一段字符串
						// 我们可以修改它以更改弹窗的内容
						// 例如，我们只想要显示ID为 #some-element 的元素

						// 		   mfpResponse.data = $(mfpResponse.data).find('#some-element');

						console.log('Ajax 加载后的内容：', mfpResponse);
					},
				}
			});

			$('.popup-modal').magnificPopup({
				type : 'inline',
				preloader : false,
				modal : true
			});

			$(document).on('click', '.popup-modal-dismiss', function(e) {
				e.preventDefault();
				$.magnificPopup.close();
			});
		});
	</script>
</body>
</html>
