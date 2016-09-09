// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function () {
  $(".spinner").hide();
  $("#login").hide();
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
  $('select').material_select();
  $('select').change(function(){
    console.log($('input.select-dropdown').val())
    if ($('input.select-dropdown').val() == 'Aeroplan') {
      $("#main-form").removeClass('offset-s3');
      $("#main-form").addClass('offset-s2');
      $("#login").show();
    } else {
      $("#main-form").removeClass('offset-s2');
      $("#main-form").addClass('offset-s3');
      $("#login").hide();
    }
  });
});

$(document).ajaxStart(function() {
  $(".spinner").fadeIn('slow');
}).ajaxStop(function() {
    $(".spinner").hide();
});