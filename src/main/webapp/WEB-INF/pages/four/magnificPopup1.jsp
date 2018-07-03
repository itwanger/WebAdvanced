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
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.bootcss.com/magnific-popup.js/1.1.0/jquery.magnific-popup.js"></script>

	<script>
$(function() {
	$('.image-popup-vertical-fit').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		mainClass: 'mfp-img-mobile',
		image: {
			verticalFit: true
		}
		
	});

	$('.image-popup-fit-width').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		image: {
			verticalFit: false
		}
	});

	$('.image-popup-no-margins').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		closeBtnInside: false,
		fixedContentPos: true,
		mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
		image: {
			verticalFit: true
		},
		zoom: {
			enabled: true,
			duration: 300 // don't foget to change the duration also in CSS
		}
	});

});
	</script>
</body>
</html>
