let slides = document.querySelector('.slides');
let slideImg = document.querySelectorAll('.slides li');
currentIdx = 0;
slideCount = slideImg.length;
prev = document.querySelector('.prev'); //이전 버튼
next = document.querySelector('.next'); //다음 버튼
slideWidth = 500; //슬라이드이미지 넓이
slideMargin = 100; //슬라이드 끼리의 마진값
makeClone(); // 처음이미지와 마지막 이미지 복사 함수
initfunction(); //슬라이드 넓이와 위치값 초기화 함수
function makeClone() {
  let cloneSlide_first = slideImg[0].cloneNode(true);
  let cloneSlide_last = slides.lastElementChild.cloneNode(true);
  slides.append(cloneSlide_first);
  slides.insertBefore(cloneSlide_last, slides.firstElementChild);
}
function initfunction() {
  slides.style.width = (slideWidth + slideMargin) * (slideCount + 2) + 'px';
  slides.style.left = -(slideWidth + slideMargin) + 'px';
}
next.addEventListener('click', function () {
  if (currentIdx <= slideCount - 1) {
    slides.style.left = -(currentIdx + 2) * (slideWidth + slideMargin) + 'px';
    slides.style.transition = `${0.5}s ease-out`;
  }
  if (currentIdx === slideCount - 1) {
    setTimeout(function () {
      slides.style.left = -(slideWidth + slideMargin) + 'px';
      slides.style.transition = `${0}s ease-out`;
    }, 500);
    currentIdx = -1;
  }
  currentIdx += 1;
});

prev.addEventListener('click', function () {
  if (currentIdx >= 0) {
    slides.style.left = -currentIdx * (slideWidth + slideMargin) + 'px';
    slides.style.transition = `${0.5}s ease-out`;
  }
  if (currentIdx === 0) {
    setTimeout(function () {
      slides.style.left = -slideCount * (slideWidth + slideMargin) + 'px';
      slides.style.transition = `${0}s ease-out`;
    }, 500);
    currentIdx = slideCount;
  }
  currentIdx -= 1;
});

$(document)
.ready(function(){
	setInterval(function(){
		$('.next').trigger('click');
	},3000)	
})
;