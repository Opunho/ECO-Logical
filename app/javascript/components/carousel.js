import Swipe from 'swipejs';

const initCarousel = () => {
  const swiper = document.getElementById('mySwipe')
  window.mySwipe = new Swipe(swiper, {
    startSlide: 0,
    // auto: 3000,
    draggable: true,
    autoRestart: false,
    continuous: true,
    disableScroll: true,
    stopPropagation: true,
    callback: function (_index, _swiper) { },
    transitionEnd: function (_index, _swiper) { }
  });

  const swiping = document.getElementById('otherSwipe')
  window.mySwipe = new Swipe(swiping, {
    startSlide: 0,
    // auto: 3000,
    draggable: true,
    autoRestart: false,
    continuous: false,
    disableScroll: true,
    stopPropagation: true,
    callback: function (_index, _swiping) { },
    transitionEnd: function (_index, _swiping) { }
  });
}

export { initCarousel };
