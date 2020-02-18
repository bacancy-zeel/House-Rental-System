

document.addEventListener("turbolinks:load", function(){
  var state = document.getElementById("state");
  var city = document.getElementById("city");

  state.addEventListener("change", function(){
    $.ajax({
      url: "/cities?state=" + state.value,
      type: "GET"
    })
  })

  city.addEventListener("change", function(){
    $.ajax({
      url: "/cities?state=" + city,
      type: "GET"
    })
  })

})