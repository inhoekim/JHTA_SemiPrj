<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	* {
		margin: 0;
		padding: 0;
	}
	
	li {
		list-style: none;
	}
	
	.slider_wrapper {
		position: relative;
		width: 300px;
		margin: 0 auto;
		height: 300px;
		overflow: hidden;
	}
	
	.slides {
		position: absolute;
		left: 0;
		top: 0;
		transition: left 0.5s ease-out;
	}
	
	/* :not(:last-child) 마지막 요소는 css 안 줌 */
	.slides li:not(:last-child) {
		float: left;
	}
	
	.controls {
		position: absolute;
		margin-top: 50px;
		text-align: center;
	}
	
	/* .controls span{
		background: #333;
		color: #fff;
		padding: 10px 20px;
		margin:0 10px;
	} */
</style>
<div class="slider_wrapper">
	<ul class="slides">
		<li>
			<div class="slide_content slide01" style="background-color: red; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: orange; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: yellow; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: lime; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: blue; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: skyblue; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: indigo; width:300px; height: 300px"></div>
		</li>
		<li>
			<div class="slide_content slide01" style="background-color: purple; width:300px; height: 300px"></div>
		</li>
	</ul>	
	<a href="#" id="prev"></a>
	<a href="#" id="next"></a>
</div>
<!-- <p class="controls">
	<span class="prev">prev</span>
	<span class="next">next</span>
</p> -->
<script>
	// ul
	var slides = document.querySelector('.slides');
	// li 배열
	var slide = document.querySelectorAll('.slides li');
	// 처음인지 끝인지 구분하는 변수
	var currentIdx = 0;
	// 끝인지 마지막인지 확인
	var slideCount = slide.length;
	// 이전 버튼
	var prevBtn = document.querySelector('.prev');
	// 다음 버튼
	var nextBtn = document.querySelector('.next');
	// 이미지 넓이
	var slideWidth = 300;
	// 이미지 margin
	//var slideMargin = 30;
	
	//slides.style.width = (slideWidth + slideMargin) * slideCount  - slideMargin + 'px';
	slides.style.width = slideWidth * slideCount + 'px';
	
	// 슬라이드 버튼
	function moveSlide(num) {
		//slides.style.left = -num * (slideWidth + slideMargin) + 'px';
		slides.style.left = -num * slideWidth + 'px';
		currentIdx = num;
	}
	// 다음
	nextBtn.addEventListener('click', function() {
		if (currentIdx < slideCount - 2) {
			moveSlide(currentIdx + 1);
			console.log(slideCount - 1);
		} else {
			moveSlide(0);
		}
	});
	// 이전
	prevBtn.addEventListener('click', function() {
		if (currentIdx > 0) {
			moveSlide(currentIdx - 1);
		} else {
			moveSlide(slideCount - 2)
		}
	});
</script>