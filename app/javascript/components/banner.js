import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["The most cherished", "memories of yours favorite", "independent artists"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
