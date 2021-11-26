import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Play your part in creating a greener future", "Become friendly towards your economy", "Become friendly towards our ecology", "Become eco-logical"],
    typeSpeed: 70,
    loop: false
  });
}

export { loadDynamicBannerText };
