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
<body>
  <div id="wrapper">
    <div class="content">
  		<img alt="사진1" src="room1.jpg">
    </div>
     <div class="content">
  		<img alt="사진2" src="room2.jpg">
    </div>
     <div class="content">
  		<img alt="사진3" src="room3.jpg">
    </div>
  </div> 
</body>
<script type="text/javascript">
	var ingex=4;
	var cnt=0;
	var img=document.getElementsByTagName("img");
	
	function cng(){
		img[cnt++].src = "room" + index + ".jpg";
		
		cnt%=3;
		index++;
		if(index>=9)
			index = 1;
		
		
		console.log(index);
		
	}
	setInterval(cng,2000);




</script>
</html>