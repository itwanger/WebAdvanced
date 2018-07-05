<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Magnific Popup的HTML扩展</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
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
		<div class="popup-gallery">
			<a href="${ctx}/resources/images/studio10_b.jpg" title="Light A Fire">
				<img src="${ctx}/resources/images/studio10_s.jpg">
			</a>
			<a href="${ctx}/resources/images/studio3_b.jpg" title="Part of a Fool">
				<img src="${ctx}/resources/images/studio3_s.jpg">
			</a>
			<a href="${ctx}/resources/images/studio26_b.jpg" title="All Out Of Love">
				<img src="${ctx}/resources/images/studio26_s.jpg">
			</a>
		</div>
	</div>

	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
