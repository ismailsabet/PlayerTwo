$(function () {
  var $activeSlide = $('#slides .slide:first-child');

  $(".match-tile").on("click", function () {
    var user_id = $(this).data("id");

    $.ajax({
      url: "/get/conversation/" + user_id,
      method: "post",
      dataType: "script"
    });
  });

  $("#login-steam").on("click", function() {

    $.ajax({
      url: "/get/steam",
      method: "post",
      dataType: "ajax"
    });
  });

  $("#close-conversation").on("click", function () {
    $("#conversation").hide();
  });

  $("#decline").on("click", function () {
    var user_id = $activeSlide.data("id");

    $.ajax({
      url: "/decline/" + user_id,
      method: "post",
      dataType: "ajax"
    });

    goToSlide('decline');
  });

  $("#approve").on("click", function () {
    var user_id = $activeSlide.data("id");

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

    // send data to controller
    if (action == "approve") {
      console.log(action);
    } else {
      console.log(action);
    }

    $activeSlide.addClass("showing");
  }
});
