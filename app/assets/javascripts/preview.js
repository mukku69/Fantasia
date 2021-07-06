 /* global $*/
 
// 画像プレビュー機能
$(document).on('turbolinks:load', function() {
   $('#file').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $("#preview").attr('src', e.target.result);
      }
      reader.readAsDataURL(e.target.files[0]);
  });
});