<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }" />
    <div class="content">
  		<img alt="사진1" src="${cp}/je/Event/room1.jpg" onmouseover="View()" name="imgr">
    </div>
 <script type="text/javascript">
 
 	var img1=new Image();
 	img1.src = '${cp}/je/Event/room2.jpg';
 	var img2=new Image();
	img2.src = '${cp}/je/Event/room3.jpg';
 	var img3=new Image();
	img3.src = '${cp}/je/Event/room4.jpg';
	var img4=new Image();
	img4.src = '${cp}/je/Event/room1.jpg';
	
	var count = 1;
	var maxCount = 4;
	
	function slideView(){
		if(count == (maxCount+1)){count =1;}
		document.imgr.src = eval("img"+count + ".src");
		count++;
		
	} 
	function startView(){
		slideTime = setInterval("slideView()",2000);
	}
	function stopView(){
		clearInterval(slideTime);
	}
	if(document.addEventListener){
		document.imgr.addEventListener("mouseover",stopView,false);
		document.imgr.addEventListener("mouseout",startView,false);
	}else{
		document.imgr.attachEvent("onmouseover",stopView);
		document.imgr.arrachEvent("onmouseout",startView);
	}
	startView();
 
 </script>
</body>

</html>