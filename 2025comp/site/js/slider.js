function sliderInit(){
    const slider = document.querySelector('.slider__wrapper');
    const sliderCont = slider.querySelector('.slider__content');
    const slide = slider.querySelectorAll('.slider__item');

    sliderCont.appendChild(slide[0].cloneNode(true));
    sliderCont.prepend(slide[slide.length - 1].cloneNode(true));

    
    let slideWidth = (slide.length + 1) ;
    for(let i = 0 ; i < slide.length; i ++){
        slideWidth += 30;
    }
    let translate = -15
    console.log(translate);
    sliderCont.style.width = slideWidth + 'vw';
    sliderCont.style.transform = `translateX(${translate}vw)`;
    
    
    let currentIndex = 1;
    
    const prevBtn = slider.querySelector('.slider__nav--prev');
    const nextBtn = slider.querySelector('.slider__nav--next');
    
    
    function move(index){
        currentIndex += -1 * index;
        translate += (index > 0? index * 30 + 4 : index * 30 - 4);

        sliderCont.style.transition = 'all 0.5s ease-in-out';
        sliderCont.style.transform = `translateX(${translate}vw)`;
        
        if(currentIndex == 0){
            setTimeout(function(){
                index = slide.length;
                translate = -index * 30 - 1;
                currentIndex = index
                sliderCont.style.transition = 'none';
                sliderCont.style.transform = `translateX(${translate}vw)`;
            },500);
        }
        if(currentIndex == slide.length + 1){
            setTimeout(function(){
                currentIndex = 1;
                translate = -15;
                sliderCont.style.transition = 'none';
                sliderCont.style.transform = `translateX(${translate}vw)`;

            },500)
        }
    }

    console.log(prevBtn,nextBtn)
    prevBtn.addEventListener('click', function(){move(1)});
    nextBtn.addEventListener('click', function(){move(-1)});
}


document.addEventListener("DOMContentLoaded", function(){
    sliderInit();
});