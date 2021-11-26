import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.querySelector("#banner-typed-text")
  const ellypsis = document.querySelector("#pledge-co2")
  if (banner){
    new Typed('#banner-typed-text', {
      strings: ["Play your part in creating a greener future", "Become friendly towards your economy", "Become friendly towards our ecology", "Become eco-logical"],
      typeSpeed: 70,
      loop: false
    });

  }
  if (ellypsis){
    new Typed('#pledge-co2', {
      strings: ["..."],
      typeSpeed: 100,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
