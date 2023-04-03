const opt = {
  loop: true,
  autoplay: {
    delay: 0,
  },
  speed: 2500,
}

$(document).on('turbolinks:load', function() {
    let swiper = new Swiper('.swiper',opt);
});