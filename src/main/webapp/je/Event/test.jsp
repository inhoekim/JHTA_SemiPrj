<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:set var="cp" value="${pageContext.request.contextPath }" />
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
    *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:300px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:300px;}
    .slide li:nth-child(1){background:none;}
    .slide li:nth-child(2){background:none;}
    .slide li:nth-child(3){background:none;}
    .slide li:nth-child(4){background:none;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
  </style>
</head>
<body>
  <div class="slide">
    <ul>
      <li><img src="${cp}/je/Event/room1.jpg" onmouseover="View()" name="imgimg"></li>
      <li><img src="${cp}/je/Event/room2.jpg" onmouseover="View()" name="imgimg"></li>
      <li><img src="${cp}/je/Event/room3.jpg" onmouseover="View()" name="imgimg"></li>
      <li><img src="${cp}/je/Event/room4.jpg" onmouseover="View()" name="imgimg"></li>
    </ul>
  </div>
  <script type="text/javascript">
  
  
  
  
  function stopView(){
	  clearInterval(slidTime);
  }
  if(document.addEventListener){
	  document.imgimg.addEventListener("mouseover",stopView,false);
	  document.imgimg.addEventListener("mouseout",startView,false);
  }else{
	  document.imgimg.attachEvent("onmouseover",stopView);
	  document.imgimg.attachEvent("onmouseout",startView);
	  
  }
  
  
  
  </script>
</body>
</html>