$(document).ready(function() {
  $(".board").on("click", ".card-in-play", function() {

    board = $(this).closest(".board");

    $(this).find("img").toggleClass("active");

    activeCards = board.find(".active")

    if(activeCards.length === 3) {
      createSet(activeCards);
    }
  });
});

var createSet = function(activeCards) {

  var data = {
    cards: {
      c1: activeCards[0].alt,
      c2: activeCards[1].alt,
      c3: activeCards[2].alt
    }
  }
  var method = "post";
  var url = "/games/24/card_sets";

  var request = $.ajax({
    url: url,
    method: method,
    data: data,
    dataType: "json"
  });

  request.done(function(response) {
    activeCards.removeClass("active");
    console.log(activeCards);
    console.log(response);
  });
};
