$(document).ready(function () {
  $(".top-bar__toggle").click(function () {
    $(".header__mobile-navigation").toggleClass("open");
    $("body").toggleClass("js-show-menu");
  });
});
