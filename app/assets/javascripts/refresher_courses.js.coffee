# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  
  # bootstrap date picker 
  $(".datepicker").datepicker
    startDate: "01/01/1940"
    endDate: "0d"

  
  # Preferred Dates date picker 
  $(".prefdatepicker").datepicker startDate: "0d"
  
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

  
  #Preferred date Tab
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

  $("#toggle8").attr "disabled", true
  return
