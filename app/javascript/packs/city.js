

document.addEventListener("turbolinks:load", function(){
  
  var city = document.getElementById("city");

  

  city.addEventListener("change", function(){
    $.ajax({
      url: "/get_house?city=" + city,
      type: "GET"
    })
  })

})