function jsRoar(name) {
  alert('I am ' + name + '. Hear me roar!');
}

jQuery(function() {
  $(document).ready(function() {
    $('.image_thumb').click(function(){
      var src;
      src= $('.image_thumb:hover img').attr('src');
      $('.image_display_pane img').attr('src',src);
    });
  });
});
