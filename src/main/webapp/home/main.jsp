<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.wrap_center{
			width:100%;
			height:400px;
		}
		.container{
			margin:0 auto;
			width:400px;
			height:400px;
			overflow:hidden;
		}
		.img_wrap{
			width:400px;
			height:400px;
			position :absolute;
			overflow: hidden;
		}
		.rollimgs{
			list-style: none;
			padding:0;
			margin:0;
		}


	</style>
</head>
<body>
<jsp:include page="/home/membership.html"/>
<div style="height: 800px;">
</div>
	<div style="height: 800px;">
		<div class="wrap_center">
		  <div class="container">
			<div class="img_wrp">
			  <ul class="rollimgs">
				<li><img src="${cp }/images/a.jpg" ></li>
				<li><img src="${cp }/images/b.jpg" ></li>
				<li><img src="${cp }/images/c.jpg" ></li>
				</ul>
			  </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	
	
	</script>
</body>
</html>