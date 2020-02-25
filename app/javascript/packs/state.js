document.addEventListener("turbolinks:load", function(){
  
    var state = document.getElementById("state");
    var city = document.getElementById("city");
    var address_state = document.getElementById("address_state");
    var address_city = document.getElementById("address_city");
    

    $("#state").on("change", function() {
      while (city.firstChild) city.removeChild(city.firstChild);
        var placeholder = document.createElement("option");
        placeholder.text = "Select city";
        placeholder.value = "";
        city.appendChild(placeholder);
          $.ajax({
            url: "/users?state=" + state.value,
            type: "GET"
          })
    });

    $("#address_state").on("change", function() {
      while (address_city.firstChild) address_city.removeChild(address_city.firstChild);
        var placeholder = document.createElement("option");
        placeholder.text = "Select city";
        placeholder.value = "";
        address_city.appendChild(placeholder);
          $.ajax({
            url: "/users?address_state=" + address_state.value,
            type: "GET"
          })
    });

    $("#city").on("change", function() {  
        
      $.ajax({
        url: "cities?city=" + city.value,
        type: "GET"
      })
  });
      
   
})
