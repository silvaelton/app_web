$(document).on("turbolinks:click", function () {
  $("#main").hide();
  $(".spinner").show();
});

$(document).on("turbolinks:load", function () {
  $(".spinner").hide();
  $("#main").show();
});