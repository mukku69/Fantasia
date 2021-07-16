/* global $*/

// フェードイン
$(document).on('turbolinks:load', function () {
  $('#nav-img').delay(4000).fadeIn(3000, function(){
  });
});

// クリックでメニュー
$(document).on('turbolinks:load', function () {
  $('#nav-img').on('click', function(event) {
    $(this).toggleClass('active');
    $('#header-top').fadeToggle();
    event.preventDefault();
  });
});