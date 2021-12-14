<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>HTML Layouts</title>
	<style>
		header {
			background-color:lightgrey;
			height:100px;
		}
		nav {
			background-color:#339999;
			color:white;
			width:200px;
			height:300px;
			float:left;
		}
		section {
			width:200px;
			text-align:left;
			float:left;
			padding:10px;
		}
		footer {
			background-color:#FFCC00;
			height:100px;
			clear:both;
		}
		header, nav, section, footer { text-align:center; }
		header, footer { line-height:100px; }
		nav, section { line-height:240px; }
	</style>
</head>

<body>

	<h1>HTML5 레이아웃</h1>
	<header>
		<h2>HEADER 영역</h2>
	</header>
	<div id="searchBar">
	
	</div>
	<nav>
		<h2>NAV 영역</h2>
	</nav>
	<section>
		<p>SECTION 영역</p>
	</section>
	<footer>
		<h2>FOOTER 영역</h2>
	</footer>

</body>

</html>