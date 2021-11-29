import { preventInsignificantClick } from '@rails/ujs';
import Swipe from 'swipejs';

const initCarousel = () => {
  const swiper = document.getElementById('mySwipe')
  window.mySwipe = new Swipe(swiper, {
    startSlide: 0,
    auto: 3000,
    draggable: true,
    autoRestart: false,
    continuous: false,
    disableScroll: false,
    stopPropagation: false,
    callback: function (_index, _swiper) { },
    // transitionEnd: function (_index, _swiper) { }
  });
}

export { initCarousel };
