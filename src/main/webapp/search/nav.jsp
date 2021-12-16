<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav>
	<div>
		<p>가격범위</p>
		<input type="range" id="costMin" min="0" max="1000000" step="1000" value="0" oninput="rangeBar(this,'cmin')">
		<input type="range" id="costMax" min="0" max="1000000" step="1000" value="1000000" oninput="rangeBar(this,'cmax')">
		<br>
		<span id="cmin">0원이상</span>
		<span id="cmax">1000000원이하</span>
	</div>
	
	<div>
		<p>리뷰평가</p>
		<input type="range" id="review" name="review" min="0" max="4" step="1" value="0" oninput="reviewBar(this)">
		<br>
		<span id="reviewBar">0점이상</span>
	</div>
</nav>