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
  var current_url = window.location.pathname
  var url = current_url + "/card_sets";

  var request = $.ajax({
    url: url,
    method: method,
    data: data,
    dataType: "json"
  });

  request.done(function(response) {

    // console.log(response["1"])
    // console.log(response["2"])
    // console.log(response["3"])

    $('div').find("img[alt='" + data["cards"]["c1"] + "']").replaceWith(response["1"].toString());
    $('div').find("img[alt='" + data["cards"]["c2"] + "']").replaceWith(response["2"].toString());
    $('div').find("img[alt='" + data["cards"]["c3"] + "']").replaceWith(response["3"].toString());

    // for(var i=0; i < activeCards.length; i++){
    //   activeCards[i].html((response[i.toString()]).toString());
    // }

    activeCards.removeClass("active");
  });

  request.fail(function(response) {
    console.error("Fail")
  })
};
