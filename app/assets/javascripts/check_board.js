// $(document).ready(function() {
//   $(".check-board").on("submit", "input.check-game-button", function(event) {
//     event.preventDefault();

//     var form = $(this);
//     var url = form.attr("action");
//     var method = form.attr("method");

//     var request = $.ajax({
//       url: url,
//       method: method
//     });

//     request.done(function(response) {
//       console.log(response);
//     });

//     request.fail(function(response) {
//       console.log("There are valid sets on the board. Keep trying!")
//     });

//   });
// });
