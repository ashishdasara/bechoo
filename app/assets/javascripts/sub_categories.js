jQuery(function() {
  $( document ).ready(function() {
    $('#advertisement_sub_category_id').parent().hide();

    var sub_categories;
    sub_categories = $('#advertisement_sub_category_id').html();
    return $('#advertisement_category_id').change(function(){
      var category, options;
      category = $('#advertisement_category_id :selected').text();
      options = $(sub_categories).filter("optgroup[label=" + category + "]").html();
      if (options) {
        $('#advertisement_sub_category_id').parent().show();
        return $('#advertisement_sub_category_id').html(options);
      } else {
        return $('#advertisement_sub_category_id').empty();
        $('#advertisement_sub_category_id').parent().hide();
        return false;
      }
    });
  });
});
