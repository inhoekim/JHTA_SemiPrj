<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav>
	<div>
		<p>가격범위</p>
		<input type="range" id="costMin" min="0" max="1000000" step="1000" value="0">
		<input type="range" id="costMax" min="0" max="1000000" step="1000" value="1000000">
	</div>
	
	<div>
		<p>리뷰평가</p>
		<input type="range" id="review" name="review" min="0" max="4" step="1" value="0">
	</div>
</nav>