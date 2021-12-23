<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/home/membership.html" />
<div style="min-height: 1300px;">
<div class="img_change">  
<h1 style="text-align: center;font-size:50px;margin-bottom: 0px; font-family: Gowun Batang; font-weight: 100">Room Package</h1>                          
	<div class="container">    
		<ul class="slider-container simple-list" id="slider">       
			<li class="slide" style="align-content: center;">
			<div>
				<div class="content" style="width:310px; height:400px;display:inline-block;vertical-align: top;">  
					<a href="${cp }/room/detail?room_id=1" class="swiper-slide"><!-- 해당 룸 예약창으로 --> 
					<span class="image"><img src="${cp }/images/room/singleRoom1.jpg" alt="사진1"></span> 
					<h3>연말 가족, 친구와 함께</h3> 
					<p>추운 겨울 가족과 함께 따뜻한 연말 보내세요.</p>
					</a>
				</div>
			
				<div class="content" style="width:310px; height:400px;display:inline-block;vertical-align: top;">
			<a href="${cp }/room/detail?room_id=2" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp}/images/room/doubleRoom1.jpg" alt="사진2"></span>
			 <h3>연말 연인과 함께하는</h3>
			 <p>넓은 거실과 패밀리 패키지를 함께 누려보세요!</p>
			</a>
		</div>
		
		<div class="content" style="width:310px;height:400px;display:inline-block;vertical-align: top">
			<a href="${cp}/room/detail?room_id=3" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp}/images/room/doubleRoom2.jpg"  alt="사진4"></span>
			 <h3>연말 호캉스는 우리우리호텔에서</h3>
			 <p>스파와 함께 연말 맞이 호캉스를 누려보세요!</p>
			</a>	
		</div>
		</div>
			</li>
	   <li class="slide">
	   <div>
		<div class="content" style="width:310px; height: 400px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=4" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp }/images/room/twinRoom1.jpg" alt="사진3"></span>
			 <h3>프리미엄 호캉스</h3>
			 <p>연말 맞이 스스로에게 주는 선물 호캉스</p>
			</a>
		</div>
		<div class="content" style="width:310px; height: 400px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=5" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/twinRoom2.jpg" alt="사진4"></span>
			 <h3>크리스마스 맞이 호캉스</h3>
			 <p>스파와 함께 연말 맞이 호캉스를 누려보세요!</p>
			</a>	
		</div>
		<div class="content" style="width:310px; height: 400px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=6" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/familyRoom1.jpg" alt="사진4"></span>
			 <h3>친구와 함께하는 호캉스</h3>
			 <p>넷플릭스와 함께 맞는 연말</p>
			</a>	
		</div>
		</div>
		</li>
		</ul>
		<p class="pager"></p>
		<a href="javascript:void(0)" id="prev"></a><a href="javascript:void(0)" id="next"></a>
	</div>
</div>   
<jsp:include page="/home/promotion.jsp" />   
</div>

<script type="text/javascript">
	var slideWrap = document.querySelector('.container');
	var slideContainer = document.querySelector('.slider-container');
	var slide = document.querySelectorAll('.slide');
	var slideHeight = 0;
	var slideCount = slide.length;
	var currentIndex = 0;
	var timer = null;
	var pagerHTML='';
	var pager = document.querySelector('.pager');
	
	var navPrev = document.getElementById('prev');
	var navNext = document.getElementById('next');
	
	slideHeight = slide[0].offsetHeight;
	for(let i=0;i<slideCount; i++){
		let slideHei = slide[i].offsetHeight;
		if(slideHeight < slideHei){
			slideHeight = slideHei;
		}
	}
	
	slideWrap.style.height = slideHeight + 'px';
	slideContainer.style.height = slideHeight + 'px';
	
	for(let i=0;i<slideCount;i++){
		slide[i].style.left = i*100 +'%';
		pagerHTML += '<span data-idx="' + i + '">' + ( i + 1) + '</span>';
		pager.innerHTML = pagerHTML;
	}
	var pagerBtn = document.querySelectorAll('.pager span');
	
	function goToSlide(idx){
		slideContainer.classList.add('animated');
		slideContainer.style.left=-100*idx+'%';
		currentIndex = idx;
		for (let j = 0; j < pagerBtn.length; j++) {
			pagerBtn[j].classList.remove('active');
		}
		pagerBtn[idx].classList.add('active');
		
	}
	goToSlide(0);
	
	navPrev.addEventListener('click',function(){
		if(currentIndex == 0){
			goToSlide(slideCount - 1);
		}else{
			goToSlide(currentIndex-1);
		}
	});
	navNext.addEventListener('click',function(){
		if(currentIndex == slideCount - 1){
			goToSlide(0);
		}else{
			goToSlide(currentIndex + 1);
		}
	});
	function startAutoSlide(){
		timer = setInterval(function(){
			let nextIdx = (currentIndex + 1)%slideCount;
			goToSlide(nextIdx);
		},3000);
	}     
	startAutoSlide();
	
	function stopAutoSlide(){
		clearInterval(timer);
	}
	
	slideWrap.addEventListener('mouseenter', function(){
		stopAutoSlide();
	});
	
	slideWrap.addEventListener('mouseleave', function(){
		startAutoSlide();
	});
	
	for(let i = 0; i< pagerBtn.length; i++){
		pagerBtn[i].addEventListener('click', function(event){
			let pagerNum = event.target.innerText - 1;
			goToSlide(pagerNum);
		});
	}
	/* -------------------------------------------------------- */
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
	
	slideHeight1 = slide1[0].offsetHeight;
	for(let i=0;i<slideCount1; i++){
		let slideHei = slide1[i].offsetHeight;
		if(slideHeight1 < slideHei){
			slideHeight1 = slideHei;
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
		clearInterval(timer1);
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
