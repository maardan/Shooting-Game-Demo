$(document).ready(function () {
    // will call refreshPartial every 1 seconds
    setInterval(refreshPartial, 1000)

});

// calls action refreshing the partial
function refreshPartial() {
  $.ajax({
    url: "gamerooms/new"
 })
}