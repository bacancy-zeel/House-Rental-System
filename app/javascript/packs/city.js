

document.addEventListener("turbolinks:load", function(){
  
  $("#city").on("change", function() {     
      $.ajax({
        url: "/cities?city=" + city.value,
        type: "GET"
      })
  });
  

})

  