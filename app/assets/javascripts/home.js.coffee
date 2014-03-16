# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(".inner-wrap, .left-off-canvas-menu, .main-section").height($(window).height() - $(".fixed").height())
