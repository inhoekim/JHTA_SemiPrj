<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #slide{
 	position:relative;
 	width:500px;
 }
 #slide li{
 	position:absolute;
 	top:0;
 	left:0;
 	display:none;
 }
 #slide img{
 	width:500px;
 	height:300px;
 }


</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }" />
   <div id="slide" val="1" max="3">

      <li id="img1"><img src="${cp}/je/Event/room1.jpg" alt=""/></li>
      <li id="img2"><img src="${cp}/je/Event/room2.jpg" alt=""/></li>
      <li id="img3"><img src="${cp}/je/Event/room3.jpg" alt=""/></li>
      <li id="img4"><img src="${cp}/je/Event/room4.jpg" alt=""/></li>

   </div>  
 <script type="text/javascript">
 imgslide();
    function imgslide(){
    	$val = $("#slide").attr("val");//현재 이미지 번호 가져오기
    	$max = $("#slide").attr("max");//총 이미지 가져오기
    		$("#img" + $val).hide();//현재이미지를 사라지게 함
    		if($val == $max){$val = 1;}
    		else{$val++;}
    		$("#img" + $val).fadeln(500);//변경된 번호의 이미지 영역을 나타나게 함
    		$("#slide").attr('val',$val);
    		setTimeout('imgslide()',1000);
    }

 </script>

</body>

</html>