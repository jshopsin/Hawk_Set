//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .

//  You CAN write js in this file, but you're NOT supposed to.
$(document).ready(function() {
  console.log("ready!");

  $(".board").on("click", ".card-in-play", function(event){
    event.preventDefault();
    console.log("AYYYYYYYY");

    board = $(this).closest(".board");

    $(this).find("img").toggleClass("active");

    console.log(board);
    console.log(board.find(".active").length);

    if(board.find(".active").length === 3){
      console.log("YO have selected 3")
    }


  })
});

