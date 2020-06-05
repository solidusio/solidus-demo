$(document).ready(function(){
  // Shows the widget on page load, to prevent the widget text from being
  // displayed unformatted
  $(".tour-widget").show()
  // Toggles the tour on click of the tour button
  $(".tour-toggler").click(toggleTour)
  // Disables tour when you click on the whitebox
  $(".tour-whitebox").click(toggleTour)
  // Disables tour when you hit the escape key
  // Also goes to next section of tour if right arrow is clicked
  $(document).keyup(function(e) {
    if (e.keyCode === 27) closeTour()   // Escape key
    if (e.keyCode === 39) goToNext()    // Right arrow
    if (e.keyCode === 37) goToPrev()    // Left arrow
  });
  // Goes to the next part of the tour if the next button is clicked
  $(".tour-next").click(goToNext)

  // Handles setting the selected element on pages where the tour is initialized on page load
  $($(".tour-widget.open .tour-whitebox:visible").data("selector")).toggleClass("tour-target")

  // Toggles the tour on or off
  function toggleTour() {
    $(".tour-widget").toggleClass("open")
    $($(".tour-whitebox:visible").data("selector")).toggleClass("tour-target")
  }
  // Closes tour
  function closeTour() {
    $(".tour-widget.open").removeClass("open")
  }
  // Goes to the next part of the tour
  function goToNext() {
    var currentSlide = $(".tour-button:visible").parent().parent()
    if(currentSlide.next(".tour-body").length > 0){
      currentSlide.hide()
      currentSlide.next().show()
      $(currentSlide.children(".tour-whitebox").data("selector")).removeClass("tour-target")
      $($(".tour-whitebox:visible").data("selector")).toggleClass("tour-target")
    }else{
      $(".tour-button:visible").click()
    }
  }
  // Goes to the previous slide - this does not go back a page though, whereas the goToNext function will.
  function goToPrev(){
    var currentSlide = $(".tour-button:visible").parent().parent()
    if(currentSlide.prev().length > 0){
      currentSlide.hide()
      currentSlide.prev().show()
      $(currentSlide.children(".tour-whitebox").data("selector")).removeClass("tour-target")
      $($(".tour-whitebox:visible").data("selector")).toggleClass("tour-target")
    }
  }
})
