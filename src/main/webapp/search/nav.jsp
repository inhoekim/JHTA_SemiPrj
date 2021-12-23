<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav>
	<div style="border-bottom: 1px solid #eeeeee; padding-bottom: 20px;">
		<p style="font-size: 25px;color: #474747; margin-bottom: 5px;">가격범위</p>
		<span>최소</span> <input type="range" id="costMin" min="0" max="5000000" step="1000" value="0" oninput="rangeBar(this,'cmin')">
		<br>
		<span style="margin-top:4px;vertical-align: middle;display:inline-block">최대</span> <input type="range" id="costMax" min="0" max="5000000" step="1000" value="5000000" oninput="rangeBar(this,'cmax')">
		<br>
		<span id="cmin">0원이상</span>
		<span id="cmax">5000000원이하</span>
	</div>
	
	<div>
		<p style="font-size: 25px;color: #474747; margin-bottom: 5px;">리뷰평가</p>
		<input type="range" id="review" name="review" min="0" max="4" step="1" value="0" oninput="reviewBar(this)">
		<br>
		<span id="reviewBar">0점이상</span>
	</div>
</nav>