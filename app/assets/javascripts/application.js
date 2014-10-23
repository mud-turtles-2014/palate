// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

// $(function() {
//   $( "#datepicker" ).datepicker();
// });

$(function(){
  $(document).foundation();

  $(".conclusion_feedback").hide();
  $(".observation_feedback").hide();
  $("#error-msg").hide();

  $(".observation_score").click(function() {
    $(this).next().toggle()
  });

  $(".conclusion_score").click(function() {
    $(this).next().toggle()
  });

})

function validateForm() {
  var whiteArray = ["white_fruits", "fruit_condition", "minerality", "oak", "dry", "acid", "alcohol", "climate", "country", "white_grape"];
  var redArray = ["red_fruits", "fruit_condition", "minerality", "oak", "dry", "acid", "alcohol", "climate", "country", "red_grape", "tannin"];

  if($("input[name='white_fruits']").length > 0) {
    var minNum = whiteArray.length;
  } else {
    var minNum = redArray.length;
  }

  if($('input[type=radio]:checked').size() < minNum) {
    $("#error-msg").show();
  }
  return ($('input[type=radio]:checked').size() > minNum);
}









