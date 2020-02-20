

document.addEventListener("turbolinks:load", function(){
  
  var city = document.getElementById("city");

  

  city.addEventListener("change", function(){
    $.ajax({
      url: "/users?city=" + city,
      type: "GET"
    })
  })

})