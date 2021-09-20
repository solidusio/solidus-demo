$(document).ready(function(){
  $('.toggle-accordion').click(function(e) {
    e.preventDefault();
  
    let $this = $(this);

    //changes arrow 
    if( $(this).hasClass('js-arrow-up')){
      $(this).removeClass('js-arrow-up').addClass('js-arrow-down');
    } else {
      $(this).removeClass('js-arrow-up').addClass('js-arrow-down');
      $(this).removeClass('js-arrow-down').addClass('js-arrow-up');
	 	}
  
    if ($this.next().hasClass('js-show-list')) {
        $this.next().removeClass('js-show-list');
        $this.next().slideUp(350);
    } else {
        $this.parent().parent().find('li .inner').removeClass('js-show-list');
        $this.parent().parent().find('li .inner').slideUp(350);
        $this.next().toggleClass('js-show-list');
        $this.next().slideToggle(350);
    }
  });
});
