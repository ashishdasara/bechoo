jQuery(function() {
  $(document).ready(function() {
    $('.image_thumb').click(function(){
      var src;
      src= $('.image_thumb:hover img').attr('src');
      $('.image_display_pane img').attr('src',src);
    });
  });
});

jQuery(function() {
  $(document).ready(function(){
    $('.form-control[type=file]').change(function(){
      var item = $(this).clone(true);
      item.val("")
      $(this).parent().append(item);
    });
  });
});

// function new_image() {
//  var item = $('.form-control[type=file]:last').clone(true);
//  item.val("");
//  $('.form-control[type=file]').parent().append(item);
// }
