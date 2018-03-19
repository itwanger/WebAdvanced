<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@ include file="/resources/common/taglib.jsp"%>
<head>
<%@ include file="/resources/common/meta.jsp"%>
<title>Bootstrap的手风琴效果</title>
<%@ include file="/resources/common/csslib.jsp"%>
</head>
<body>
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 每日一句 #1 </a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					If you truly take care of your heart, you will be amazed at how much girls start lining up at your front door.
					<br>
					如果你真的照顾好自己的心，那么你会惊讶的发现，有那么多的姑娘在你的门前拍好长队。
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						每日一句 #2 </a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body">
					Dont push your friends into your stuff, let them find it and like it if they want to.
					<br>
					不要强迫你的朋友爱你所爱，除非他们自愿。
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
						aria-controls="collapseThree"> 每日一句 #3 </a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">
					Life is not always what we want it to be. We fight, we cry, and sometimes we give up. But there is always hope in our heart.
					<br>
					生活有时不尽如人意，我们挣扎过、痛哭过，有时我们还会放弃，但是过后我们又充满希望。
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/resources/common/jslib.jsp"%>
</body>
</html>
