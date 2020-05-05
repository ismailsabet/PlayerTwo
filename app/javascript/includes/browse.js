// Functions for approving or declining a user in browse section

$(function(){

  var $activeSlide = $('#slides .slide:first-child');
  $activeSlide.addClass("showing");

  $(".match").on("click", function() {
    var user_id = $(this).data("id");
    console.log(user_id);

    $.ajax({
      url: "/get/conversation/" + user_id,
      method: "post",
      dataType: "ajax"
    });

  });

  $("#decline").on("click", function() {
    goToSlide('decline');
  });

  $("#approve").on("click", function() {
    var user_id = $activeSlide.data("id");

    console.log(user_id);

    $.ajax({
      url: "/approve/" + user_id,
      method: "post",
      dataType: "ajax"
    });

    goToSlide('approve');
  });

  function goToSlide(action) {
    $activeSlide.removeClass("showing");
    $activeSlide = $activeSlide.next(".slide");

    if(action == "approve"){
      console.log(action);
    } else {
      console.log(action);
    }

    $activeSlide.addClass("showing");
  }

});
