<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
	margin: 0; 
	padding: 0;

	  -webkit-font-smoothing:antialised;
	}
	li {
	list-style: none;
    }
    li div {
	margin: auto;
    }
	.container1{
	position: relative;
	width: 100%;
	overflow: hidden;
	padding-top: 80px;
	padding-bottom: 50px;
	align-content: center;
	}
	.slider-container1{
	position:absolute;
	width:100%;
	left: 0;
	-webkit-transition: left .7s ease-in;
	transition: left .7s ease-in;
	}
	.slide1{
	position: absolute;
	width: 100%;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
	overflow: hidden;
	}
	.slider-container1.animated{
	-webkit-transition:left .7s ease-in;
	transition:left .7s ease-in;
	}
	.simple-list1 {
	list-style-type: none;
	margin: 0;
	padding: 0;
    }
	#prev1,
	#next1{
		position:absolute;
		top:50%;
		left:50%;
		transform:translateY(-50%);
		z-index:999999;
		display:inline-block;
		height:5em;
		width:5em;
		border-radius:50%;
		background-position: center center;
		background-repeat: no-repeat;
		-webkit-transition:all .3s ease-in;
		transition:all .3s ease-in;
		width:50px;
		height:30px;     
		 
	}
	.pager1 {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	margin: 0; padding 0;
	text-align: center;
    }

   .pager1 span {
	width: 10px;
	height: 10px;
	background: #ccc;
	border-radius: 50%;
	display: inline-block;
	text-indent: -9999em;
	margin: 0 5px;
    }

   .pager1 span.active {
	 background: #333;
    }
    .img_change1 {
	width: 100%;
	height: 400px;
	float: left;
	align-content: center;
    }
    .slide_wrap1 {
	position: realtive;
	width: 400px;
	margin: auto;
	padding-bottom: 30px;
	}
	
	.slide_box1 {
		width: 100%;
		margin: auto;
		overflow-x: hidden;
	}
	
	.container1 .slide_content1 {
		plspaly: table;
		float: left;
		width: 50px;
		height: 50px;
	}
	.swiper-slide1{
	text-decoration-line: none;    
	}
	    
	#prev1.disabled, #next1.disables{display:none;}     
	#prev1{background-image:url('/semiPrj/images/left-arrow-grey2.png'); margin-left:-570px;} 
	#prev1:hover{background-image:url('/semiPrj/images/left-arrow-grey.png');}
	#next1{margin-left:520px;background-image:url('/semiPrj/images/right-arrow-grey2.png');}
	#next1:hover{background-image:url('/semiPrj/images/right-arrow-grey.png)';}
</style>
</head>
<body>
<div class="img_change1">  
		<h1 style="text-align: center;font-size:50px;color:#ff6666;">Uri Uri promotion</h1>                            
	<div class="container1">   
		<ul class="slider-container1 simple-list1" id="slider1">       
			<li class="slide1" style="align-content: center;">
			<div>
				<div class="content1" style="width:300px; height;300px;display:inline-block;">  
					<a href="" class="swiper-slide1"><!-- 해당 룸 예약창으로 --> 
					<span class="image1"><img src="${cp }/images/promotion1.jpg" alt="사진1"></span> 
					<span class="title">
					<h3>스파와 함께하는 연말</h3> 
					우리우리 호텔의 프라이빗한 룸과 서비스
					</span>
					</a>
				</div>
				<div class="content1" style="width:300px; height;300px;display:inline-block;">
			<a href="" class="swiper-slide1"><!-- 해당 룸 예약창으로 -->
			 <span class="image1"><img src="${cp }/images/promotion2.jpg" alt="사진2"></span>
			  <span class="title">
			 <h3>추운 겨울 맞이 패키지</h3>
			 프리미엄 스파 패키지를 만나보세요!</span>
			</a>
		</div>
		<div class="content1" style="width:300px; height;300px;display:inline-block;">
			<a href="" class="swiper-slide1"><!-- 해당 룸 예약창으로 -->
			 <span class="image1"><img  src="${cp }/images/promotion6.png"  alt="사진4"></span>
			 <span class="title">
			 <h3>연말 프리미엄 레스토랑</h3>
			 특별한 연말 우리우리 호텔에서!</span>
			</a>	
		</div>
		</div>
			</li>
	   <li class="slide1">
	   <div>
		<div class="content1" style="width:300px; height;300px;display:inline-block;">
			<a href="" class="swiper-slide1"><!-- 해당 룸 예약창으로 -->
			 <span class="image1"><img src="${cp }/images/promotion3.jpg" alt="사진3"></span>
			  <span class="title">
			 <h3>특별한 날</h3>
			 프리미엄 패키지를 만나보세요</span>
			</a>
		</div>
		<div class="content1" style="width:300px; height;300px;display:inline-block;">
			<a href="" class="swiper-slide1"><!-- 해당 룸 예약창으로 --> 
			 <span class="image1"><img  src="${cp }/images/promotion4.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>프리미엄 조식 패키지</h3>
			 코로나도 걱정없는 룸 서비스</span>
			</a>	
		</div>
		<div class="content1" style="width:300px; height;300px;display:inline-block;">
			<a href="" class="swiper-slide1"><!-- 해당 룸 예약창으로 -->
			 <span class="image1"><img  src="${cp }/images/promotion5.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>연인과 함께하는 연말</h3>
			 와인과 함께 특별한 날을 맞이해 보세요</span>
			</a>	
		</div>
		</div>
		</li>
 
		</ul>
		<p class="pager1">
		</p>
		<a href="javascript:void(0)#" id="prev1"></a><a href="javascript:void(0)#" id="next1"></a>
	</div>
</div>
	
	<script type="text/javascript">
		var slideWrap1 = document.querySelector('.container1');
		var slideContainer1 = document.querySelector('.slider-container1');
		var slide1 = document.querySelectorAll('.slide1');
		var slideHeight1 = 0;
		var slideCount1 = slide1.length;
		var currentIndex1 = 0;
		var timer1 = null;
		var pager1 = document.querySelector('.pager1');
		var pager1HTML='';
		
		var navPrev1 = document.getElementById('prev1');
		var navNext1 = document.getElementById('next1');
		
		slideHeight = slide1[0].offsetHeight;
		for(let i=0;i<slideCount1; i++){
			let slideHei = slide1[i].offsetHeight;
			if(slideHeight < slideHei){
				slideHeight = slideHei;
			}
		}
		
		slideWrap1.style.height = slideHeight + 'px';
		slideContainer1.style.height = slideHeight + 'px';
		
		for(let i=0;i<slideCount1;i++){
			slide1[i].style.left = i*100 +'%';
			pager1HTML += '<span data-idx="' + i + '">' + ( i + 1) + '</span>';
			pager1.innerHTML = pager1HTML;
		}
		var pager1Btn = document.querySelectorAll('.pager1 span');
		
		function goToSlide1(idx){
			slideContainer1.classList.add('animated');
			slideContainer1.style.left=-100*idx+'%';
			currentIndex1 = idx;
			for (let j = 0; j < pager1Btn.length; j++) {
				pager1Btn[j].classList.remove('active');
			}
			pager1Btn[idx].classList.add('active');
			
		}
		goToSlide1(0);
		
		navPrev1.addEventListener('click',function(){
			if(currentIndex1 == 0){
				goToSlide1(slideCount1 - 1);
			}else{
				goToSlide1(currentIndex1-1);
			}
		});
		navNext1.addEventListener('click',function(){
			if(currentIndex1 == slideCount1 - 1){
				goToSlide1(0);
			}else{
				goToSlide1(currentIndex1 + 1);
			}
		});
		function startAutoSlide1(){
			timer1 = setInterval(function(){
				let nextIdx1 = (currentIndex1 + 1)%slideCount1;
				goToSlide1(nextIdx1);
			},4000);
		}
		startAutoSlide1();
		
		function stopAutoSlide1(){
			clearInterval(timer);
		}
		
		slideWrap1.addEventListener('mouseenter', function(){
			stopAutoSlide1();
		});
		
		slideWrap1.addEventListener('mouseleave', function(){
			startAutoSlide1();
		});
		
		for(let i = 0; i< pager1Btn.length; i++){
			pager1Btn[i].addEventListener('click', function(event){
				let pager1Num = event.target.innerText - 1;
				goToSlide1(pager1Num);
			});
		}

	</script>
</body>
</html>