jQuery(function() {
  $(document).ready(function() {
    $('.button_remove').click(function(){
      val_int=0;
      val = $('.button_remove:focus').parent().find("#cart_product_quantity").val();
      $('.button_remove:focus').parent().find("#cart_product_quantity").val(parseInt(val)-1);
      val_int = parseInt(val);
      console.log(val_int);
      if (val_int <= 2)
      {
          $('.button_remove:focus').parent().find('.button_remove').hide();
      }

    });
    $('.button_add').click(function(){
      val = $('.button_add:focus').parent().find("#cart_product_quantity").val();
      $('.button_add:focus').parent().find("#cart_product_quantity").val(parseInt(val)+1);
      $('.button_add:focus').parent().find('.button_remove').show();
    });
  });
});


// jQuery(function() {
//   $( document ).ready(function() {
//     $('#advertisement_sub_category_id').parent().hide();
//
//     var sub_categories;
//     sub_categories = $('#advertisement_sub_category_id').html();
//     return $('#advertisement_category_id').change(function(){
//       var category, options;
//       category = $('#advertisement_category_id :selected').text();
//       options = $(sub_categories).filter("optgroup[label=" + category + "]").html();
//       if (options) {
//         $('#advertisement_sub_category_id').parent().show();
//         return $('#advertisement_sub_category_id').html(options);
//       } else {
//         return $('#advertisement_sub_category_id').empty();
//         $('#advertisement_sub_category_id').parent().hide();
//         return false;
//       }
//     });
//   });
// });
