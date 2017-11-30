
jQuery(function() {
  $( document ).ready(function() {

    var sub_categories;
    sub_categories = $('#advertisement_sub_category_id').html();

    if ($('#advertisement_category_id :selected').text()=="") {
      $('#advertisement_sub_category_id').parent().hide();
    }
    else {
      var category, options;
      category = $('#advertisement_category_id :selected').text();
      options = $(sub_categories).filter("optgroup[label=" + category + "]").html();
      $('#advertisement_sub_category_id').html(options);
    }
    //change function
    $('#advertisement_category_id').change(function(){
      var category, options;
      category = $('#advertisement_category_id :selected').text();
      options = $(sub_categories).filter("optgroup[label=" + category + "]").html();
      if (options) {
        $('#advertisement_sub_category_id').parent().show();
        return $('#advertisement_sub_category_id').html(options);
      } else {
        $('#advertisement_sub_category_id').parent().hide();
        return $('#advertisement_sub_category_id').empty();
      }
    });
  });
});

//search
jQuery(function() {
  $( document ).ready(function() {
    $('#sub_category_id').css("visibility", "hidden");
    var sub_categories;
    sub_categories = $('#sub_category_id').html();
    return $('#category').change(function(){
      var category, options;
      category = $('#category :selected').text();
      if(category != '') {
        options = $(sub_categories).filter("optgroup[label=" + category + "]").html();
      }
      else {
        options=null;
      }
      if (options) {
        $('#sub_category_id').css("visibility", "visible");
        return $('#sub_category_id').html(options);
      } else {
        $('#sub_category_id').css("visibility", "hidden");
      }
    });
  });
});
