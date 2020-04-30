// Enables/disables the tour on click of the tour button
$(".tour-toggler").click(function(){
  $(".tour-widget").toggleClass("open")
  $($(".tour-whitebox:visible").data("selector")).toggleClass("tour-target")
})
// Handles switching to the next part of the tour, if there are multiple parts on the page
$(".tour-next").click(function(){
  $(this).parent().hide()
  $(this).parent().next().show()
  $($(this).parent().children(".tour-whitebox").data("selector")).removeClass("tour-target")
  $($(".tour-whitebox:visible").data("selector")).toggleClass("tour-target")
})
// Handles setting the selected element on pages where the tour is initialized on page load
$(document).ready(function(){
  $($(".tour-widget.open .tour-whitebox:visible").data("selector")).toggleClass("tour-target")
})
