<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">

    </style>
</head>
<jsp:include page="/home/membership.html"/>
	<div class="img_cal_wrap">
		<div class="img_change">
			<div class="container">
				<ul class="slider-container simple-list" id="slider">
					<li class="slide"><img src="/semiPrj/images/a.jpg"
						width="500px" height="500px"></li>
					<li class="slide"><img src="/semiPrj/images/b.jpg"
						width="500px" height="500px"></li>
					<li class="slide"><img src="/semiPrj/images/c.jpg"
						width="500px" height="500px"></li>
				</ul>
				<a href="#" id="prev"></a> <a href="#" id="next"></a>
			</div>
		</div>
		<div class="cal"></div>
	</div>
</body>
</html>