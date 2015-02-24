# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  
  # bootstrap date picker 
  $(".datepicker").datepicker
    format: "yyyy/mm/dd"
    startDate: "1940/01/01"
    endDate: "0d"
  
  # Preferred Dates date picker 
  $(".prefdatepicker").datepicker 
    format: "yyyy/mm/dd"
    startDate: "0d"

  # Toggle Buttons For navigating between tabs 
  
  #Personal Details Tab
  $("#toggle1").attr "disabled", true
  $("#toggle2").click ->
    $("#tabs a[href=\"#detail2\"]").tab "show"
    return

  
  #University Details Tab
  $("#toggle3").click ->
    $("#tabs a[href=\"#detail1\"]").tab "show"
    return

  $("#toggle4").click ->
    $("#tabs a[href=\"#detail3\"]").tab "show"
    return

  
  #Course Details Tab
  $("#toggle5").click ->
    $("#tabs a[href=\"#detail2\"]").tab "show"
    return

  $("#toggle6").click ->
    $("#tabs a[href=\"#detail4\"]").tab "show"
    return

  
  #Contact Details Tab
  $("#toggle7").click ->
    $("#tabs a[href=\"#detail3\"]").tab "show"
    return

  $("#toggle8").click ->
    $("#tabs a[href=\"#detail5\"]").tab "show"
    return

  #Payment Details Tab
  $("#toggle9").click ->
    $("#tabs a[href=\"#detail4\"]").tab "show"
    return

  $("#toggle10").attr "disabled", true
  return  