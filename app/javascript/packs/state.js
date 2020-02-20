document.addEventListener("turbolinks:load", function(){
    var state = document.getElementById("state");
    var city = document.getElementById("city");

    state.addEventListener("change", function(){
      while (city.firstChild) city.removeChild(city.firstChild);
      var placeholder = document.createElement("option");
      placeholder.text = "Choose a state";
      placeholder.value = "";
      state.appendChild(placeholder);
        $.ajax({
          url: "/users?state=" + state.value,
          type: "GET"
        })
      })

      city.addEventListener("change", function(){
        console.log(this.value);
        $.ajax({
          url: "/cities?city=" + city.value,
          type: "GET"
        })
      })
      $(city).trigger('change');
})
$(document).on("load",function(){

console.log(("#city").text);
});