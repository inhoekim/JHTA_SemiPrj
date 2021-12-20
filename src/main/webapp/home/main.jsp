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
		.rollimgs li{
			position:absolute;
			width:400px;
			height:400px;
			left:400px;
		}
		.rollimgs li img{
			width:100%;
			height:100%;
		} 
		.follimgs li.currentroll{
			left:0;
			transition:left .5s ease-in-out, rigth .5s ease-in-out;
		}
		.rollimgs li.prevroll{
			left:-400px;
			transition : left .5s ease-in-out, right .5s ease-in-out;
		}
		.rollimgs.reverse li.prevroll{
			transition:none;
		}
		.rollimgs li.nextroll{
			left:400px;
			display:block;
			transition : none;
		}
		.rollimgs.reverse li.nextroll{
			transition:left .5s ease-in-out, right .5s ease-in-out;
		}
	</style>
</head>
<body>
<div style="height: 800px;">
</div>
	<div style="height: 800px;">
		<div class="wrap_center">
		  <div class="container">
			<div class="img_wrp">
			  <ul class="rollimgs">
				<li><img src="${cp }/images/room/doubleRoom.jpg" ></li>
				<li><img src="${cp }/images/room/familyRoom.jpg" ></li>
				<li><img src="${cp }/images/room/.jpg" ></li>
				</ul>
			  </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		let banner = {
				rollId:null;
				interval:2000,
				
				follInit:function(newinterval){
					if(parsrInt(newinterval)>0){
						this.inerval = newinterval;
					}
					let firstitem = document.querySelector('.follimgs li');
					if(firstitem){
						
					}
				}
				
				
				
		}
	
	
	</script>
</body>
</html>